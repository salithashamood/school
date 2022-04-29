import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:school/components/camera_screen_components.dart';
import 'package:school/screens/report_main_screen.dart';
import 'package:school/utils/image.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

List<CameraDescription>? cameras;

class CameraViewScreen extends StatefulWidget {
  final List<Medium> images;
  const CameraViewScreen({Key? key, required this.images}) : super(key: key);

  @override
  State<CameraViewScreen> createState() => _CameraViewScreenState();
}

class _CameraViewScreenState extends State<CameraViewScreen> {
  CameraController? _cameraController;
  Future<void>? _cameraValue;
  List<Medium> imagesMedia = [];
  List<Medium> selectedImages = [];
  Set<String> physical_status_selected = Set();

  Future<List<Medium>> getImage() async {
    try {
      final List<Album> imagesAlbum =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);

      imagesAlbum.forEach((element) async {
        if (element.name == 'Cams') {
          final MediaPage mediaPage = await element.listMedia(newest: true);
          setState(() {
            imagesMedia = mediaPage.items;
          });
          print(imagesMedia.length);
        }
      });
    } catch (e) {
      print(e.toString());
    }
    return imagesMedia;
  }

  onClickImage(int index) {
    if (selectedImages.isEmpty) {
      selectedImages.add(imagesMedia[index]);
      physical_status_selected.add(imagesMedia[index].id);
    } else {
      List<Medium> toRemove = [];
      List<Medium> toAdd = [];
      selectedImages.forEach((image) {
        if (image.title!.trim() == imagesMedia[index].title!.trim()) {
          toRemove.add(imagesMedia[index]);
        } else {
          toAdd.add(imagesMedia[index]);
          physical_status_selected.add(imagesMedia[index].id);
        }
      });
      selectedImages.addAll(toAdd);
      selectedImages.removeWhere((e) => toRemove.contains(e));
      toRemove.forEach((element) {
        physical_status_selected.remove(element.id);
      });
    }
    setState(() {});
  }

  takeImage() async {
    final img = await _cameraController!.takePicture();
    await GallerySaver.saveImage(img.path, albumName: 'Cams')
        .then((value) async {
      await getImage().then((data) {
        Future.delayed(const Duration(seconds: 1)).then((value) {
          setState(() {
            physical_status_selected.add(imagesMedia.first.id);
            selectedImages.add(imagesMedia.first);
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    _cameraValue = _cameraController!.initialize();
    init();
    getImage();
  }

  init() {
    if (widget.images.isEmpty) {
      setState(() {
        selectedImages.clear();
        physical_status_selected.clear();
      });
    } else {
      setState(() {
        selectedImages = widget.images;
        widget.images.forEach((element) {
          physical_status_selected.add(element.id);
        });
      });
    }
  }

  clickDoneButton() {
    Get.back(result: [selectedImages]);
  }

  clickDeleteButton() async {
    List<Medium> toRemove = [];
    selectedImages.forEach((element) async {
      try {
        final file = await element.getFile();
        print(file);
        file.delete();
        toRemove.add(element);
      } catch (e) {
        print(e);
      }
    });
    Future.delayed(Duration(seconds: 1)).then((v) async {
      selectedImages.removeWhere((e) => toRemove.contains(e));

      await getImage();
    });
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            Get.back(result: [selectedImages]);
            return true;
          },
          child: Stack(
            children: [
              cameraView(_cameraController, _cameraValue),
              bottomIcon(imagesMedia, physical_status_selected, onClickImage,
                  takeImage, clickDoneButton, clickDeleteButton),
              topCloseButton(clickDoneButton),
            ],
          ),
        ),
      ),
    );
  }
}

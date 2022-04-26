import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

List<CameraDescription>? cameras;

class CameraViewScreen extends StatefulWidget {
  const CameraViewScreen({Key? key}) : super(key: key);

  @override
  State<CameraViewScreen> createState() => _CameraViewScreenState();
}

class _CameraViewScreenState extends State<CameraViewScreen> {
  CameraController? _cameraController;
  Future<void>? _cameraValue;
  List<Album> images = [];

  Future getImage() async {
    final List<Album> imageAlbums = await PhotoGallery.listAlbums(
      mediumType: MediumType.image,
    );
    setState(() {
      images = imageAlbums;
    });
    print('images: $imageAlbums');
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      getImage();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    _cameraValue = _cameraController!.initialize();
    _promptPermissionSetting();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: FutureBuilder(
                future: _cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 100.w,
                height: 20.h,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: images.map((image) {
                        print(images.length);
                        if (images.isEmpty || images.length == 1) {
                          return Container();
                        } else {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 3),
                            height: 10.h,
                            width: 10.h,
                            // color: Colors.red,
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: MemoryImage(kTransparentImage),
                              image: AlbumThumbnailProvider(
                                albumId: image.id,
                                mediumType: image.mediumType,
                              ),
                            ),
                          );
                        }
                      }).toList(),
                      //     [
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //     child: Text('data'),
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     // color: Colors.red,
                      //     child: images.isEmpty
                      //         ? Text('data')
                      //         : FadeInImage(
                      //             fit: BoxFit.cover,
                      //             placeholder: MemoryImage(kTransparentImage),
                      //             image: AlbumThumbnailProvider(
                      //               albumId: images[0].id,
                      //               mediumType: images[0].mediumType,
                      //             ),
                      //           ),
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //   ),
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 4, horizontal: 3),
                      //     height: 10.h,
                      //     width: 10.h,
                      //     color: Colors.red,
                      //   ),
                      // ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrangeAccent,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Done'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

cameraView(CameraController? _cameraController, Future<void>? _cameraValue) {
  return SizedBox(
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
  );
}

bottomIcon(List<Medium> imagesMedia, Set<String> physical_status_selected,
    Function onClick, VoidCallback takeImage, VoidCallback pressedDone, VoidCallback pressedDelete) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: 100.w,
      height: 20.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                photoListView(imagesMedia, physical_status_selected, onClick),
          ),
          actionIcon(takeImage, pressedDone, pressedDelete),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    ),
  );
}

photoListView(List<Medium> imagesMedia, Set<String> physical_status_selected,
    Function onClick) {
  return ListView.builder(
    itemCount: imagesMedia.length,
    itemBuilder: (context, index) {
      if (imagesMedia.isEmpty) {
        return Container();
      } else {
        if (index == 0) {
          return Container();
        } else {
          return InkWell(
            onTap: () => onClick(index),
            child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 3,
                ),
                height: 10.h,
                width: 10.h,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 10.h,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: ThumbnailProvider(
                          mediumId: imagesMedia[index].id,
                          mediumType: imagesMedia[index].mediumType,
                        ),
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 10.h,
                      color: physical_status_selected
                              .contains(imagesMedia[index].id)
                          ? Colors.white.withOpacity(0.5)
                          : Colors.transparent,
                    ),
                    physical_status_selected.contains(imagesMedia[index].id)
                        ? const Positioned(
                            top: 1,
                            right: 3,
                            child: Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.black,
                            ),
                          )
                        : Container(),
                  ],
                )),
          );
        }
      }
    },
    scrollDirection: Axis.horizontal,
  );
}

actionIcon(VoidCallback takeImage, VoidCallback pressedDone, VoidCallback pressedDelete) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      actionButton('Delete', Colors.deepOrangeAccent, pressedDelete),
      IconButton(
        onPressed: takeImage,
        icon: Icon(
          Icons.camera_alt_outlined,
          size: 30,
        ),
      ),
      actionButton('Done', Colors.grey, pressedDone),
    ],
  );
}

actionButton(String text, Color color, VoidCallback pressed) {
  return ElevatedButton(
    onPressed: pressed,
    child: Text(text),
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );
}

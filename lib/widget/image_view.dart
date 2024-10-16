import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewCell extends StatefulWidget {
  final int index;
  final List<Map<String, dynamic>> listImage;

  ImagePreviewCell({
    required this.index,
    required this.listImage,
  });

  @override
  ImagePreviewCellState createState() => ImagePreviewCellState();
}

class ImagePreviewCellState extends State<ImagePreviewCell> {
  bool isLoading = false;
  Locale locale = Locale('en', 'US');
  double textScale = 1.0;
  bool isDarkMode = false;
  PhotoViewController controller = PhotoViewController();

  List<String> listImage = [
    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
    "https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg",
    "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649"
  ];
  int indexShowImage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: widget.listImage.length,
            itemBuilder: (BuildContext context, int index) {
              return PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  filterQuality: FilterQuality.medium,
                  controller: controller,
                  // scaleStateChangedCallback: (value) {
                  //   setState(() {
                  //     if (value.reactive.state != PhotoViewScaleState.initial) {
                  //       widget.callBackFunc(false);
                  //     } else {
                  //       widget.callBackFunc(true);
                  //     }
                  //   });
                  // },
                  // enableRotation: true,
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered,
                  imageProvider: CachedNetworkImageProvider(listImage[index]));
            },
          ),
        ],
      ),
    );
  }
}

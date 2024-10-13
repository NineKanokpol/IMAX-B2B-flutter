import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension PictureNetWork on Widget {

  static Widget imageProfile(context, double size, String profilePicture){
    return Container(
      height: size,
      width: size,
      child: CircleAvatar(
        radius: size * 0.60,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
              imageUrl: profilePicture,
              width: size,
              height: size,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  // padding: EdgeInsets.all(8),
                  // child: Center(
                  //   child: CircularProgressIndicator(
                  //       backgroundColor: Colors.grey.shade200,
                  //       valueColor: AlwaysStoppedAnimation<Color>(
                  //         Theme.of(context).primaryColor,
                  //       ),
                  //       value: downloadProgress.progress),
                  // ),
                ),
              ),
              errorWidget: (context, error, stackTrace) {
                return CircleAvatar(
                  radius: size * 0.60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: size * 0.77,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }),
        ),
      )
    );
  }

  static Widget showImageFull(String filePath) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        fadeOutDuration: Duration(milliseconds: 500),
        fadeInDuration: Duration(milliseconds: 500),
        filterQuality: FilterQuality.high,
        // memCacheHeight: ImageManager.setCacheImage(),
        // memCacheWidth: ImageManager.setCacheImage(),
        imageUrl: filePath,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: Colors.grey.shade200,
              ),
            ),
        errorWidget: (context, error, stackTrace) {
          print(error);
          return Container(
            color: Colors.grey.shade200,
            child: Center(
              child: Icon(
                Icons.error,
                color: Colors.grey.shade500,
              ),
            ),
          ); //do something
        },
      ),
    );
  }
}
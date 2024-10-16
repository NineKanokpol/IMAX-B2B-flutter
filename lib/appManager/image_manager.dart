import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../main.dart';

class ImageManager {
  static Future<File> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return File("");

      final imageTemp = File(image.path);
      print('object');
      print(imageTemp.path);
      // return cropImage(imageTemp);
      return imageTemp;
    } on PlatformException catch (e) {
      var status = await Permission.storage.status;
      print('status : $status');
      if (Platform.isIOS) {
        print('e.message : ${e.message}');
        print('Access Denied');
        await showDialogPermission("You did not allow photo access", 'Cancel',
            'Setting', 'Allow Health Rider to access photo on your device?');
      }
      print('Failed to pick image: $e');
      return File("");
    }
  }

  static Future<File> pickVideo() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.gallery);

      if (video == null) return File("");

      final videoTemp = File(video.path);
      print('object');
      print(videoTemp.path);
      return videoTemp;
    } on PlatformException catch (e) {
      var status = await Permission.camera.status;
      print('status : ${status}');
      if (Platform.isIOS) {
        print('e.message : ${e.message}');
        print('Access Denied');
        await showDialogPermission("You did not allow camera access", 'Cancel',
            'Setting', 'Allow Health Rider to access video on your device?');
      }
      print('Failed to pick video: $e');
      return File("");
    }
  }

  static Future<File> pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return File("");

      final imageTemp = File(image.path);

      return imageTemp;
    } on PlatformException catch (e) {
      var status = await Permission.camera.status;
      print('status : ${status}');
      if (Platform.isIOS) {
        print('e.message : ${e.message}');
        print('Access Denied');
        await showDialogPermission("You did not allow camera access", 'Cancel',
            'Setting', 'Allow Health Rider to access camera on your device?');
      }
      print('Failed to pick image: $e');
      return File("");
    }
  }

  static Future<List<XFile>> pickMultiCamera() async {
    try {
      final image = await ImagePicker().pickMultiImage();

      if (image == null) return [];

      return image;
    } on PlatformException catch (e) {
      var status = await Permission.storage.status;
      print('status : $status');
      if (Platform.isIOS) {
        print('e.message : ${e.message}');
        print('Access Denied');
        await showDialogPermission("You did not allow photo access", 'Cancel',
            'Setting', 'Allow Health Rider to access photo on your device?');
      }
      print('Failed to pick image: $e');
      return [];
    }
  }

  static Future<File> pickVideoCamera() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.camera);

      if (video == null) return File("");

      final videoTemp = File(video.path);

      return videoTemp;
    } on PlatformException catch (e) {
      var status = await Permission.storage.status;
      print('status : $status');
      if (Platform.isIOS) {
        print('e.message : ${e.message}');
        print('Access Denied');
        await showDialogPermission("You did not allow camera access", 'Cancel',
            'Setting', 'Allow Health Rider to access camera on your device?');
      }
      print('Failed to pick video: $e');
      return File("");
    }
  }

  static Future<List<XFile>> pickMultipleMedia() async {
    try {
      final media = await ImagePicker().pickMultipleMedia();

      if (media == null) return [];

      return media;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      return [];
    }
  }
}

showDialogPermission(
    String title, String textLeft, String textRight, String description) async {
  await showDialog(
    // barrierDismissible: true,
    context: GlobalVariable.navState.currentContext!,
    builder: (BuildContext context) => CupertinoAlertDialog(
      //"You did not allow photo access"
      title: Text(title.tr),
      content: Text(description.tr),
    ),
  );
}
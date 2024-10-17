import 'package:flutter/material.dart';
import 'package:imaxb2bflutter/pages/home/home_page.dart';
import 'package:imaxb2bflutter/pages/profile/edit_address_page.dart';
import 'package:imaxb2bflutter/pages/viewitem/detail_item_page.dart';
import 'package:imaxb2bflutter/pages/viewitem/list_item_page.dart';
import 'package:imaxb2bflutter/widget/image_view.dart';

class Navigation {
  static Navigation shared = Navigation();

  void toHomePage(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void toListItemPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListItemPage()));
  }

  void toDetailItemPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailItemPage()));
  }

  void toImagePreviewCell(context, int index,List<Map<String, dynamic>> list) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImagePreviewCell(index: index, listImage: list,)));
  }

  void toEditAddressPaage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditAddressPage()));
  }
}

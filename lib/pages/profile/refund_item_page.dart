import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imaxb2bflutter/appManager/image_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../appManager/aseets_path.dart';
import '../../appManager/color_manager.dart';

class RefundItemPage extends StatefulWidget {
  const RefundItemPage({super.key});

  @override
  State<RefundItemPage> createState() => _RefundItemPageState();
}

class _RefundItemPageState extends State<RefundItemPage> {
  String? selectedValue;
  final List<String> options = [
    'ตัวแทนเจ้าหน้าที่เคลมเอง / ลูกค้าฝากส่ง',
    'Option 1',
    'Option 2',
    'Option 3'
  ];
  File imageItem = File('');
  File imageProveBuy = File('');

  int lengthText = 0;

  TextEditingController _controllerSerial = TextEditingController();
  TextEditingController _controllerForFix = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhoneNo = TextEditingController();

  FocusNode focusNodeSerial = FocusNode();
  FocusNode focusNodeForFix = FocusNode();
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodePhoneNo = FocusNode();

  @override
  void initState() {
    _controllerForFix.addListener(forFixListener);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  forFixListener() {
    setState(() {
      lengthText = _controllerForFix.text.length;
    });
  }

  unfocusNode() {
    focusNodeSerial.unfocus();
    focusNodeForFix.unfocus();
    focusNodeName.unfocus();
    focusNodePhoneNo.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          'แจ้งเคลมสินค้า',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          unfocusNode();
        },
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'เคลมสินค้า',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                dropDownTypeRefund(),
                serialItemView(),
                dateBuyItem(),
                explainForFix(),
                _sendPictureView(),
                _sendProveView(),
                nameContact(),
                phoneNoView(),
                btn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btn() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 0,
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.all(8)),
              onPressed: () {},
              child: Text('ยกเลิก'),
            ),
          ),
          Container(
            height: 40,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  elevation: 0,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(8)),
              onPressed: () {},
              child: Text('ส่ง'),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDownTypeRefund() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'ประเภทการเคลม',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Similar background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                borderSide: BorderSide.none, // Remove outer border
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0), // Padding inside
            ),
            value: selectedValue,
            hint: Text(
              'ตัวแทนเจ้าหน้าที่เคลมเอง / ลูกค้าฝากส่ง', // Placeholder text
              style: TextStyle(color: Colors.grey),
            ),
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            // Dropdown arrow
            iconSize: 24,
            style: TextStyle(color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget serialItemView() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'หมายเลข Serial ของสินค้า',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controllerSerial,
              focusNode: focusNodeSerial,
              cursorColor: Colors.orange,
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: 'กรุณาระบุหมายเลข Serial No.',
                filled: true,
                suffixIcon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }

  Widget dateBuyItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'วันที่ซื้อสินค้า',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Expanded(child: Text('')),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget explainForFix() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'อาการเสีย',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controllerForFix,
              focusNode: focusNodeForFix,
              cursorColor: Colors.orange,
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText:
                    'กรุณาระบุรายละเอียด เช่น [อุปกรณ์ไม่ครบ, เครื่องไม่ทำงาน]',
                filled: true,
                counterText: '${lengthText}/250 ตัวอักษร',
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              keyboardType: TextInputType.text,
              maxLength: 250,
            ),
          )
        ],
      ),
    );
  }

  Widget _sendPictureView() {
    return GestureDetector(
      onTap: () {
        _accessGallery('item');
      },
      child: imageItem.path.isNotEmpty
          ? Center(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 16),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Stack(
                  alignment: Alignment(1.1,-1.05),
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(imageItem.path),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          imageItem = File('');
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20), color: Colors.red),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(bottom: 16),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Text(
                    'แนบรูปภาพสินค้าที่ส่งเคลม',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
    );
  }

  Widget _sendProveView() {
    return GestureDetector(
      onTap: () {
        _accessGallery('buyItem');
      },
      child: imageProveBuy.path.isNotEmpty
          ? Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.35),
              borderRadius: BorderRadius.circular(8)),
          padding:
          EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Stack(
            alignment: Alignment(1.1,-1.05),
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(imageProveBuy.path),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    imageProveBuy = File('');
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.red),
                  child: Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      )
          : Container(
        margin: EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.35),
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.iconClip,
              width: 30,
              height: 30,
              color: Colors.grey,
            ),
            Text(
              'แนบไฟล์ หลักฐานการซื้อ',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget nameContact() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'ชื่อผู้ติดต่อ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controllerForFix,
              focusNode: focusNodeForFix,
              cursorColor: Colors.orange,
              cursorHeight: 30,
              decoration: InputDecoration(
                hintText: 'กรุณาระบุชื่อ',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }

  Widget phoneNoView() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(
              'หมายเลขติดต่อกลับ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _controllerForFix,
              focusNode: focusNodeForFix,
              cursorColor: Colors.orange,
              cursorHeight: 30,
              validator: textValidator.validateNumber,
              decoration: InputDecoration(
                hintText: 'กรุณาเบอร์โทรศัพท์',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          )
        ],
      ),
    );
  }

  _accessGallery(String typeTab) async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      if (typeTab == 'item') {
        try {
          Permission.photos.request().then((value) async {
            await ImageManager.pickImage().then((imageFile) {
              if (imageFile.path.isNotEmpty) {
                setState(() {
                  imageItem = imageFile;
                  print('imageFile ${imageFile}');
                });
              }
            });
          });
        } catch (e) {
          var status = await Permission.photos.status;
          if (status.isDenied) {
            ImageManager.showDialogPermissionDenied(
                context,
                'การปฏิเสธการเข้าถึง'.tr,
                'การอนุญาติเข้าถึงคลังภาพถูกปฏิเสธ'.tr);
          }
        }
      } else {
        try {
          Permission.photos.request().then((value) async {
            await ImageManager.pickImage().then((imageFile) {
              if (imageFile.path.isNotEmpty) {
                setState(() {
                  imageProveBuy = imageFile;
                  print('imageFile ${imageFile}');
                });
              }
            });
          });
        } catch (e) {
          var status = await Permission.photos.status;
          if (status.isDenied) {
            ImageManager.showDialogPermissionDenied(
                context,
                'การปฏิเสธการเข้าถึง'.tr,
                'การอนุญาติเข้าถึงคลังภาพถูกปฏิเสธ'.tr);
          }
        }
      }
    } else {
      if (typeTab == 'item') {
        try {
          await ImageManager.pickImage().then((imageFile) {
            if (imageFile.path.isNotEmpty) {
              setState(() {
                imageProveBuy = imageFile;
              });
            }
          });
        } catch (e) {
          var status = await Permission.photos.status;
          if (status.isDenied) {
            ImageManager.showDialogPermissionDenied(
                context,
                'การปฏิเสธการเข้าถึง'.tr,
                'การอนุญาติเข้าถึงคลังภาพถูกปฏิเสธ'.tr);
          }
        }
      } else {
        try {
          await ImageManager.pickImage().then((imageFile) {
            if (imageFile.path.isNotEmpty) {
              setState(() {
                imageProveBuy = imageFile;
              });
            }
          });
        } catch (e) {
          var status = await Permission.photos.status;
          if (status.isDenied) {
            ImageManager.showDialogPermissionDenied(
                context,
                'การปฏิเสธการเข้าถึง'.tr,
                'การอนุญาติเข้าถึงคลังภาพถูกปฏิเสธ'.tr);
          }
        }
      }
    }
  }
}

class textValidator {
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "กรุณกรอกข้อมูล";
    } else if (value.replaceAll("-", "").length < 10) {
      return "กรุณากรอกเบอร์โทรศัพท์ให้ครบ";
    } else {
      return null;
    }
  }
}

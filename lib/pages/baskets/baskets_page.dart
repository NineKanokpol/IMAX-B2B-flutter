import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imaxb2bflutter/appManager/color_manager.dart';
import 'package:imaxb2bflutter/appManager/picture_network.dart';

class BasketsPage extends StatefulWidget {
  const BasketsPage({super.key});

  @override
  State<BasketsPage> createState() => _BasketsPageState();
}

class _BasketsPageState extends State<BasketsPage> {
  int count = 0;
  bool isDeleteMode = false;
  bool isCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      appBar: AppBar(
        elevation: 0,
        title: Text("ตะกร้าสินค้า".tr),
        centerTitle: true,
        backgroundColor: Colors.orange,
        // leading: GestureDetector(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios_new_outlined,
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          Visibility(
            visible: isDeleteMode == false,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDeleteMode = true;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 12, right: 16),
                    child: Text(
                      'แก้ไข',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
          ),
          Visibility(
            visible: isDeleteMode == true,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDeleteMode = false;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(top: 12, right: 16),
                    child: Text(
                      'สำเร็จ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.only(left: 8, right: 8),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: PictureNetWork.showImageFull(
                                'https://dl.lnwfile.com/_/dl/_raw/hr/mn/um.jpg'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'test1dhdhddhhdhdhdhdhdhdhdhdhdhddhdhhdhd'),
                                Text('test2'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '790.00',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (count > 0) {
                                                count--;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons
                                                .remove_circle_outline_outlined,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Container(
                                          width: 50,
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.orange,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Text(
                                            '${count}',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              count++;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isDeleteMode,
                  child: Container(
                    margin: EdgeInsets.only(right: 2, left: 2),
                    child: Column(
                      children: [
                        Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                        Checkbox(
                          value: isCheck,
                          checkColor: Colors.white,
                          activeColor: Colors.orange,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheck = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: isDeleteMode
          ? Container(
              padding: EdgeInsets.all(16),
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          Text(
                            'ทั้งหมด',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'ลบ',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'รวมจำนวนรายการ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Text('${'1'} รายการ',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text('รวมยอดทั้งหมด',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('${'790.00'} บาท',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8, top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: RichText(
                              text: TextSpan(children: [
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0, 3),
                                    child: Text(
                                      '*',
                                      textScaler: TextScaler.linear(1.0),
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: 'มูลค่าดังกล่าวรวมภาษีมูลค่าเพิ่มแล้ว'
                                        .tr,
                                    style: TextStyle(color: Colors.red)),
                              ]),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                elevation: 0,
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.all(8)),
                            onPressed: count == 0 ? null : () {},
                            child: Text('ยืนยันการสั่งซื้อ'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

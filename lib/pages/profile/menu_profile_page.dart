import 'package:flutter/material.dart';
import 'package:imaxb2bflutter/appManager/aseets_path.dart';
import 'package:imaxb2bflutter/appManager/color_manager.dart';

import '../../navigation.dart';

class MenuProfilePage extends StatefulWidget {
  const MenuProfilePage({super.key});

  @override
  State<MenuProfilePage> createState() => _MenuProfilePageState();
}

class _MenuProfilePageState extends State<MenuProfilePage> {
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
          'เมนูผู้ใช้งาน',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8, right: 8, top: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(24)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Icon(
                                Icons.person,
                                size: 40,
                              )),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'บริษัท ทดสอบ จำกัด',
                                style: TextStyle(color: Colors.orange),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'สาขา : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Text('สำนักงานใหญ่ [0000]')),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'เลขประจำตัวผู้เสียภาษี : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(child: Text('01099999999999999999')),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ที่อยู่ : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                      child: Text(
                                          '9999/99 dhdhddhdhdhddhdhddhdhdhdhdh')),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'โทรศัพท์ : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('02-434-9999'),
                                ],
                              ),
                            ],
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
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.all(8)),
                            onPressed: () {
                              Navigation.shared.toEditAddressPaage(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                Text('แก้ไขที่อยู่'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                        Text(
                          'ใช้เป็นที่อยู่ในการจัดส่งสินค้า',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'ยอดซื้อสะสม',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 24),
                          )),
                          Text('1,280,200 บาท',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 24))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('ยอดค้างชำระ/วงเงินเครดิต',
                                style: TextStyle(color: Colors.orange))),
                        Text('340,000/500,000 บาท',
                            style: TextStyle(color: Colors.orange))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'สถานะการสั่งซื้อของฉัน',
                        style: TextStyle(color: Colors.orange, fontSize: 24),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconShowStatusMyOrder(
                            AssetsPath.iconChecklist, "รับคำสั่งซื้อ"),
                        iconShowStatusMyOrder(
                            AssetsPath.iconPackage, "จัดสินค้า"),
                        iconShowStatusMyOrder(
                            AssetsPath.iconTruck, "กำลังขนส่ง"),
                        iconShowStatusMyOrder(
                            AssetsPath.iconReceived, "ได้รับแล้ว"),
                        iconShowStatusMyOrder(AssetsPath.iconBill, "ชำระแล้ว")
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'ประวัติคำสั่งซื้อที่จัดส่งแล้ว',
                        style: TextStyle(color: Colors.orange, fontSize: 24),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columnSpacing: 16.0,
                          columns: [
                            DataColumn(label: Text('วันที่สั่งซื้อ')),
                            DataColumn(label: Text('เลขที่เอกสาร')),
                            DataColumn(label: Text('จำนวนเงินรวม')),
                            DataColumn(label: Text('สถานะ')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('2024-05-16')),
                              DataCell(Text('INV64050082')),
                              DataCell(Text('180,000.00')),
                              DataCell(
                                Text(
                                  'รอเรียกเก็บ',
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2024-03-17')),
                              DataCell(Text('INV64030057')),
                              DataCell(Text('220,000.00')),
                              DataCell(
                                Text(
                                  'ชำระเงินแล้ว',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2024-02-14')),
                              DataCell(Text('INV64020030')),
                              DataCell(Text('145,000.00')),
                              DataCell(
                                Text(
                                  'ชำระเงินแล้ว',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2024-02-12')),
                              DataCell(Text('INV64020018')),
                              DataCell(Text('123,000.00')),
                              DataCell(
                                Text(
                                  'ชำระเงินแล้ว',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2024-01-08')),
                              DataCell(Text('INV64010012')),
                              DataCell(Text('278,500.00')),
                              DataCell(
                                Text(
                                  'ชำระเงินแล้ว',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('2024-01-08')),
                              DataCell(Text('INV64010012')),
                              DataCell(Text('278,500.00')),
                              DataCell(
                                Text(
                                  'ชำระเงินแล้ว',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(right: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                elevation: 0,
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.all(8)),
                            onPressed: () {
                              Navigation.shared.toRefundItemPage(context);
                            },
                            child: Text('แจ้งเคลมสินค้า'),
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
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.all(8)),
                            onPressed: () {
                              Navigation.shared.toContactPage(context,'problem');
                            },
                            child: Text('แจ้งปัญหา'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          elevation: 0,
                          backgroundColor: ColorManager.colorBtnSupport,
                          padding: EdgeInsets.all(8)),
                      onPressed: () {
                        Navigation.shared.toContactPage(context,'contact');
                      },
                      child: Text(
                        'ติดต่อ IMAX Support',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconShowStatusMyOrder(String image, String title) {
    return Column(
      children: [
        Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(bottom: 8),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
        Text(
          title,
          style: TextStyle(color: Colors.orange),
        )
      ],
    );
  }
}

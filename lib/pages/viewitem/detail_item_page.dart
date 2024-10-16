import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../appManager/color_manager.dart';
import '../../appManager/picture_network.dart';
import '../../widget/custom_snack_bar.dart';

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({super.key});

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  int _currentImageIndex = 0;
  int count = 0;
  final CarouselSliderController _controllerCarousel =
      CarouselSliderController();
  List<Map<String, dynamic>> listBanner = [
    {
      "index": 1,
      "image":
          "https://www.aekdumrong.co.th/wp-content/uploads/2018/02/SCD12S2-B1-10.8V-Drill-Driver-2-Battery-1.jpg"
    },
    {
      "index": 2,
      "image":
          "https://homehub.co.th/wp-content/uploads/2022/07/%E0%B8%94%E0%B8%B5%E0%B9%84%E0%B8%8B%E0%B8%99%E0%B9%8C%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%A1%E0%B8%B5%E0%B8%8A%E0%B8%B7%E0%B9%88%E0%B8%AD-7.png"
    },
    {
      "index": 3,
      "image":
          "https://www.skilthailand.com/wp-content/uploads/2022/08/skil_800x800_DL5290SE10.png"
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text('รายละเอียดสินค้า'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16, left: 8, right: 8),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              _imageItem(),
              _detailMainCard(),
              _priceCard(),
              _descriptionItem(),
              _detailValueItem(),
              _sizeItem(),
              _linkView()
            ],
          )),
        ),
      ),
    );
  }

  Widget _detailMainCard() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Barcode : 8851006132'),
                Text('SKU : AOSK0068'),
                Text('Name: สว่านไร้สายไร้แปรงถ่าน 20v'),
                Text('Warranty 6 เดือน')
              ],
            ),
          ),
          Text(
            'In stock',
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
    );
  }

  Widget _priceCard() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ราคาปลีก 1190.00'),
                Text('ราคาส่ง 790.00', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              bottomSheetAddToCart();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.orange, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  Text('Add to Cart', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bottomSheetAddToCart() {
    return showModalBottomSheet(
        context: context,
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        barrierColor: Colors.white.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 32),
                            child: Text(
                              "เพิ่มสินค้าลงตะกร้า",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 48, left: 8, right: 8),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ระบุจำนวนสั่งซื้อ',
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
                                      Icons.remove_circle_outline_outlined,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.orange),
                                        borderRadius: BorderRadius.circular(8)),
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
                          _btnAddAndCancelCart()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _btnAddAndCancelCart() {
    return Container(
      margin: EdgeInsets.only(top: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  elevation: 0,
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(16)),
              onPressed: () {},
              child: Text('ยกเลิก'),
            ),
          ),
          Container(
            width: 150,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  elevation: 0,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(16)),
              onPressed: count == 0 ? null : () {},
              child: Text('ใส่ตะกร้า'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionItem() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'รายละเอียดสินค้า',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                      text: 'test',
                    ));
                    CustomSnack.show(context, 'คัดลอกเนื้อหาสำเร็จ'.tr);
                  },
                  child: Icon(
                    Icons.copy,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.file_download,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _detailValueItem() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'คุณสมบัติ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
                Text('เจาะเร็ว แรง ด้วยมอเตอร์ไร้แปรงถ่าย',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(
                      text: 'test',
                    ));
                    CustomSnack.show(context, 'คัดลอกเนื้อหาสำเร็จ'.tr);
                  },
                  child: Icon(
                    Icons.copy,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.file_download,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sizeItem() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ขนาดสินค้า',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Table(
            border: TableBorder.all(color: Colors.orange, width: 2),
            children: [
              // Table Header
              TableRow(
                children: [
                  _buildHeaderText('บรรจุ'),
                  _buildHeaderText('กว้าง x ยาว x สูง (ซม.)'),
                  _buildHeaderText('น้ำหนัก'),
                ],
              ),
              // Table Content
              TableRow(
                children: [
                  _buildContentText('1 กล่อง'),
                  _buildContentText('30 x 60 x 20'),
                  _buildContentText('2 กิโลกรัม'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeaderText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _linkView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Links',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              launchUrl(
                  Uri.parse('https://pub.dev/packages/permission_handler'),
                  mode: LaunchMode.externalApplication);
            },
            child: Text(
              'https://www.google.com/',
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageItem() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            itemCount: listBanner.length,
            carouselController: _controllerCarousel,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return GestureDetector(
                  onTap: () {},
                  child:
                      PictureNetWork.showImageFull(listBanner[index]["image"]));
            },
            options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1.56,
                enlargeCenterPage: false,
                scrollPhysics: BouncingScrollPhysics(),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                initialPage: _currentImageIndex,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                }),
          ),
        ),
        listBanner.length > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.040,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listBanner.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _controllerCarousel.jumpToPage(index);
                                _currentImageIndex = index;
                              });
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 3.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (_currentImageIndex == index
                                        ? Colors.orange
                                        : Colors.grey)),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

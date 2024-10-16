import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imaxb2bflutter/appManager/color_manager.dart';

import '../../navigation.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage>
    with TickerProviderStateMixin {
  TabController? _tabControllerTool;
  TextEditingController _controllerSearchGeneral = TextEditingController();
  FocusNode searchFocus = FocusNode();
  int _currentIndex = 0;
  int _currentIndexBottom1 = 0;
  int _currentIndexBottom2 = 0;
  RangeValues _currentRangeValues = const RangeValues(0, 4500);
  TextEditingController _minController = TextEditingController();
  TextEditingController _maxController = TextEditingController();
  List<Map<String, dynamic>> listItemTab1 = [
    {
      "image": "",
      "title": "",
      "description": "สว่านไร้สาย 20v",
      "status": "in stock",
      "price_split": "1,190.00",
      "price_send": "790"
    },
    {
      "image": "",
      "title": "",
      "description": "สว่านไร้สาย 20v",
      "status": "in stock",
      "price_split": "1,190.00",
      "price_send": "790"
    },
    {
      "image": "",
      "title": "",
      "description": "สว่านไร้สาย 20v",
      "status": "in stock",
      "price_split": "1,190.00",
      "price_send": "790"
    }
  ];

  @override
  void initState() {
    _tabControllerTool = TabController(vsync: this, length: 4, initialIndex: 0);
    _minController.text = _currentRangeValues.start.toStringAsFixed(2);
    _maxController.text = _currentRangeValues.end.toStringAsFixed(2);
    super.initState();
  }

  @override
  void dispose() {
    _tabControllerTool?.dispose();
    super.dispose();
  }

  void _updateRangeValues() {
    setState(() {
      _minController.text = _currentRangeValues.start.toStringAsFixed(2);
      _maxController.text = _currentRangeValues.end.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: GestureDetector(
        onTap: () {
          searchFocus.unfocus();
        },
        child: Scaffold(
          backgroundColor: ColorManager.colorBg,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: Colors.orange, child: searchBar()),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 16),
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabControllerTool,
                      unselectedLabelColor: Colors.grey.shade400,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      indicatorColor: Colors.orange,
                      // labelColor: Colors.white,
                      tabs: [
                        Tab(
                          child: _tap(context, 'เครื่องมือช่าง'.tr),
                        ),
                        Tab(
                          child: _tap(context, 'เครื่องมือสวน'.tr),
                        ),
                        Tab(
                          child: _tap(context, 'เครื่องมือเชื่อม'.tr),
                        ),
                        Tab(
                          child: _tap(context, 'ซ่อมรถยนต์'.tr),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Text('แบรนด์สินค้า'.tr),
                        for (int i = 0; i < 4; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = i;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(4),
                                margin: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _currentIndex == i
                                        ? Colors.orange
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: i == _currentIndex
                                            ? Colors.transparent
                                            : Colors.orange)),
                                child: Text(
                                  i == 0 ? 'All' : 'IMAX',
                                  style: TextStyle(
                                      color: i == _currentIndex
                                          ? Colors.white
                                          : Colors.orange),
                                )),
                          )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: _tabControllerTool,
                      children: [
                        gridItemView(),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's rainy here"),
                        ),
                        Center(
                          child: Text("It's sunny here"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget gridItemView() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.65, crossAxisSpacing: 5.0),
      padding: EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigation.shared.toDetailItemPage(context);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.dohome.co.th/media/catalog/product/1/0/10233045_mc_p3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SKU : AOSK0068'),
                    Text('สว่านไร้สายแปรงถ่าน 20v'),
                    Row(
                      children: [
                        Expanded(child: Text('in stock')),
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text('ราคาปลีก')),
                                  Text('1,190.00'),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: Text('ราคาส่ง')),
                                  Text('790.00'),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget searchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 45,
            margin: EdgeInsets.only(bottom: 16, top: 16, left: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: TextFormField(
              controller: _controllerSearchGeneral,
              focusNode: searchFocus,
              style: TextStyle(
                fontSize: 14,
              ),
              cursorColor: Colors.orange,
              textAlign: TextAlign.start,
              // validator: doubleFieldValidator.validate,
              decoration: InputDecoration(
                suffixIcon: Container(
                  width: 50,
                  margin: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  // padding: EdgeInsets.only(right: 8,top: 8,bottom: 8),
                  decoration: BoxDecoration(
                      color: Color(0xFFfbc97f),
                      borderRadius: BorderRadius.circular(99)),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                hintText: "ระบุรหัสสินค้า/ชื่อสินค้า".tr,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.only(left: 16, top: 24),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 24, top: 16, left: 8, right: 8),
          child: IconButton(
            onPressed: () {
              bottomSheetFilter();
            },
            icon: Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        )
      ],
    );
  }

  bottomSheetFilter() {
    return showModalBottomSheet(
        context: context,
        elevation: 0,
        isScrollControlled: true,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 32),
                            child: Text(
                              "Filter",
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
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Year',
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 24),
                            child: Row(
                              children: [
                                for (int i = 0; i < 4; i++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = i;
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        margin:
                                            EdgeInsets.only(left: 8, right: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: _currentIndex == i
                                                ? Colors.orange
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: i == _currentIndex
                                                    ? Colors.transparent
                                                    : Colors.orange)),
                                        child: Text(
                                          '2024',
                                          style: TextStyle(
                                              color: i == _currentIndex
                                                  ? Colors.white
                                                  : Colors.orange),
                                        )),
                                  )
                              ],
                            ),
                          ),
                          Text('Discounts'),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 24),
                            child: Row(
                              children: [
                                for (int j = 0; j < 4; j++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndexBottom1 = j;
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        margin:
                                            EdgeInsets.only(left: 8, right: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: _currentIndexBottom1 == j
                                                ? Colors.orange
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: j == _currentIndexBottom1
                                                    ? Colors.transparent
                                                    : Colors.orange)),
                                        child: Text(
                                          'Normal',
                                          style: TextStyle(
                                              color: j == _currentIndexBottom1
                                                  ? Colors.white
                                                  : Colors.orange),
                                        )),
                                  )
                              ],
                            ),
                          ),
                          Text('Stock'),
                          Container(
                            margin: EdgeInsets.only(top: 16, bottom: 24),
                            child: Row(
                              children: [
                                for (int k = 0; k < 4; k++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndexBottom2 = k;
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        margin:
                                            EdgeInsets.only(left: 8, right: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: _currentIndexBottom2 == k
                                                ? Colors.orange
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: k == _currentIndexBottom2
                                                    ? Colors.transparent
                                                    : Colors.orange)),
                                        child: Text(
                                          'Normal',
                                          style: TextStyle(
                                              color: k == _currentIndexBottom2
                                                  ? Colors.white
                                                  : Colors.orange),
                                        )),
                                  )
                              ],
                            ),
                          ),
                          Text('Price'),
                          RangeSlider(
                            values: _currentRangeValues,
                            min: 0,
                            max: 5000,
                            divisions: 500,
                            activeColor: Colors.orange,
                            inactiveColor: Colors.orangeAccent,
                            labels: RangeLabels(
                              _currentRangeValues.start.toStringAsFixed(2),
                              _currentRangeValues.end.toStringAsFixed(2),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                                _updateRangeValues();
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text('${_minController.text}'),
                              ),
                              Text('to'),
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.orange,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text('${_maxController.text}'),
                              ),
                            ],
                          )
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

  Widget _tap(context, str) {
    return Container(
      width: 100,
      child: Text(
        str,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          // color: Theme.of(context).primaryColor
        ),
      ),
    );
  }
}

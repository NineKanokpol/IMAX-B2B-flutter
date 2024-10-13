import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imaxb2bflutter/appManager/color_manager.dart';
import 'package:imaxb2bflutter/appManager/picture_network.dart';

class MainShowItemPage extends StatefulWidget {
  const MainShowItemPage({super.key});

  @override
  State<MainShowItemPage> createState() => _MainShowItemPageState();
}

class _MainShowItemPageState extends State<MainShowItemPage> {
  final CarouselSliderController _controllerCarousel =
      CarouselSliderController();
  int _currentImageIndex = 0;

  List<Map<String, dynamic>> listBanner = [
    {
      "index": 1,
      "image":
          "https://img.freepik.com/free-photo/abstract-autumn-beauty-multi-colored-leaf-vein-pattern-generated-by-ai_188544-9871.jpg"
    },
    {
      "index": 2,
      "image":
          "https://img.freepik.com/free-photo/vibrant-autumn-maple-leaves-nature-beauty-showcased-generated-by-ai_188544-15039.jpg"
    },
    {
      "index": 3,
      "image":
          "https://img.freepik.com/free-photo/autumn-season-brings-bright-yellow-multi-colored-leaves-generative-ai_188544-12676.jpg"
    },
  ];

  List<Map<String, dynamic>> listBrandItem = [
    {
      "index": 1,
      "image":
          "https://marketplace.canva.com/EAFauoQSZtY/1/0/1600w/canva-brown-mascot-lion-free-logo-qJptouniZ0A.jpg"
    },
    {
      "index": 2,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 3,
      "image":
          "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720915200&semt=sph"
    }
  ];

  List<Map<String, dynamic>> listCategory = [
    {
      "index": 1,
      "image":
          "https://marketplace.canva.com/EAFauoQSZtY/1/0/1600w/canva-brown-mascot-lion-free-logo-qJptouniZ0A.jpg"
    },
    {
      "index": 2,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 3,
      "image":
          "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720915200&semt=sph"
    },
    {
      "index": 4,
      "image":
          "https://marketplace.canva.com/EAFauoQSZtY/1/0/1600w/canva-brown-mascot-lion-free-logo-qJptouniZ0A.jpg"
    },
    {
      "index": 5,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 6,
      "image":
          "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720915200&semt=sph"
    },
    {
      "index": 7,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 8,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 9,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
    {
      "index": 10,
      "image":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_640.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleProfile(),
              _imageBanner(),
              _brandItem(),
              _categoryItem(),
              _promotionView(),
              _videoSuggestView()
            ],
          ),
        )),
      ),
    );
  }

  Widget titleProfile() {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 8),
      color: Colors.orange,
      child: Row(
        children: [
          PictureNetWork.imageProfile(context, 48,
              'https://albanyvet.com.au/wp-content/uploads/2019/11/blank-profile-picture-973460_640.png'),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ยินดีต้อนรับ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'บริษัททดสอบจำกัด',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imageBanner() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, left: 8, right: 8),
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider.builder(
            itemCount: listBanner.length,
            carouselController: _controllerCarousel,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return PictureNetWork.showImageFull(listBanner[index]["image"]);
            },
            options: CarouselOptions(
                autoPlay: true,
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

  Widget _brandItem() {
    return Container(
      margin: EdgeInsets.only(left: 8, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'แบรนด์สินค้า',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: listBrandItem.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 24),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: PictureNetWork.showImageFull(
                        listBrandItem[index]["image"]),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _categoryItem() {
    return Container(
      margin: EdgeInsets.only(left: 8, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'หมวดหมู่สินค้า',
            style: TextStyle(fontSize: 16),
          ),
          GridView.builder(
            itemCount: listCategory.length,
            padding: EdgeInsets.only(top: 8, right: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, crossAxisSpacing: 8),
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child:
                    PictureNetWork.showImageFull(listCategory[index]["image"]),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _promotionView() {
    return Container(
      margin: EdgeInsets.only(left: 8, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'โปรโมชั่น',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: listBrandItem.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 24),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: PictureNetWork.showImageFull(
                        listBrandItem[index]["image"]),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _videoSuggestView() {
    return Container(
      margin: EdgeInsets.only(left: 8, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'วิดีโอ(แนะนำสินค้า)',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(top: 8),
            child: ListView.builder(
                itemCount: listBrandItem.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 24),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: PictureNetWork.showImageFull(
                        listBrandItem[index]["image"]),
                  );
                }),
          )
        ],
      ),
    );
  }
}

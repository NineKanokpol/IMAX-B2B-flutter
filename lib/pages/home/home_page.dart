import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imaxb2bflutter/appManager/aseets_path.dart';
import 'package:imaxb2bflutter/pages/home/main_show_item_page.dart';
import 'package:imaxb2bflutter/pages/viewitem/detail_item_page.dart';
import 'package:imaxb2bflutter/pages/viewitem/list_item_page.dart';

import '../baskets/baskets_page.dart';
import '../profile/profile_page.dart';
import '../shop/shop_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectPage = 0;
  double textScale = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQuery.copyWith(textScaler: TextScaler.linear(textScale)),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            iconSize: 35,
            backgroundColor: Colors.orange,
            height: 65,
            onTap: (index) async {
              setState(() {
                _selectPage = index;
              });
              print('indexTest $index');
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: _selectPage == 0 ? EdgeInsets.all(8) : null,
                  decoration: _selectPage == 0
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          color: Colors.white.withOpacity(0.3),
                        )
                      : null,
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: _selectPage == 1 ? EdgeInsets.all(8) : null,
                  decoration: _selectPage == 1
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          color: Colors.white.withOpacity(0.3),
                        )
                      : null,
                  child: Image.asset(
                    AssetsPath.iconBoxBottomSheet,
                    width: 35,
                    height: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: _selectPage == 2 ? EdgeInsets.all(8) : null,
                  decoration: _selectPage == 2
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          color: Colors.white.withOpacity(0.3),
                        )
                      : null,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  child: Container(
                    padding: _selectPage == 3 ? EdgeInsets.all(8) : null,
                    decoration: _selectPage == 3
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            color: Colors.white.withOpacity(0.3),
                          )
                        : null,
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
        tabBuilder: (BuildContext context, int index) {
          index = _selectPage;
          switch (index) {
            case 0:
              return CupertinoTabView(
                  builder: (context) => MainShowItemPage(
                        callBack: () {
                          setState(() {
                            _selectPage = 1;
                          });
                        },
                      ));
            case 1:
              return ListItemPage();
            case 2:
              return BasketsPage();
            default:
              return ProfilePage();
          }
        },
      ),
    );
  }
}

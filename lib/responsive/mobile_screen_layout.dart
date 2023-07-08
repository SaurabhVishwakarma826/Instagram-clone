import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController  pagecontroller;
  @override
  void initState(){
    super.initState();
    pagecontroller=PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pagecontroller.dispose();
  }
  void navigationTapped(int page){
    pagecontroller.jumpToPage(page);

  }
  void onPageChanged(int page){
    setState(() {
      _page = page;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Text("feed"),
          Text("Search"),
          Text("Add post"),
          Text("notification"),
          Text("Profile"),
        ],
        controller: pagecontroller,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _page==0?primaryColor : secondaryColor,), label: "", backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _page==1?primaryColor : secondaryColor),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: _page==2?primaryColor : secondaryColor),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: _page==3?primaryColor : secondaryColor),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _page==4?primaryColor : secondaryColor),
              label: "",
              backgroundColor: primaryColor),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}

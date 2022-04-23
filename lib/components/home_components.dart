import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';

appBarTitle(String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600),
  );
}

appBarActionButton() {
  return IconButton(
    onPressed: () {},
    icon: Image.asset('assets/images/filter_icon.png'),
  );
}

appBarLeading() {
  return IconButton(
    onPressed: () {},
    icon: Image.asset('assets/images/hamburger_icon.png'),
  );
}

appBarShape() {
  return const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(30),
    ),
  );
}

appBarPreferredSize(TextEditingController searchController,
    VoidCallback clickSearch, bool isClickButton) {
  return PreferredSize(
    preferredSize: Size.fromHeight(5.h),
    child: isClickButton
        ? appBarSearchBar(searchController, clickSearch)
        : appBarsecondTitle(clickSearch),
  );
}

appBarSearchBar(
    TextEditingController searchController, VoidCallback clickSearch) {
  return Container(
    width: 98.w,
    height: 7.h,
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
    child: Form(
      child: TextField(
        controller: searchController,
        cursorColor: Colors.blue,
        autofocus: true,
        cursorHeight: 3.h,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            onPressed: clickSearch,
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    ),
  );
}

appBarsecondTitle(VoidCallback clickSearch) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 5.w, bottom: 2.h, right: 10.w, top: 2.h),
        child: Text(
          'Waste Management',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 10.w, bottom: 2.h, right: 5.w, top: 2.h),
        child: IconButton(
          onPressed: clickSearch,
          icon: Image.asset('assets/images/search_icon.png'),
        ),
      ),
    ],
  );
}

appBarTab(String text) {
  return Tab(
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

appBarTabView(String text) {
  return ListView.builder(
    itemCount: 20,
    itemBuilder: (contex, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
        child: SizedBox(
          height: 90,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/arrow_right.png',
                    color: Colors.black),
              ),
              title: tabBarViewColumn(text),
            ),
          ),
        ),
      );
    },
  );
}

tabBarViewColumn(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Jul 07.2021',
        style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
      ),
      Text(text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          )),
    ],
  );
}

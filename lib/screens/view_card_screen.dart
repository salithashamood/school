import 'package:flutter/material.dart';
import 'package:school/components/appbar_component.dart';
import 'package:school/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ViewCardScreen extends StatefulWidget {
  const ViewCardScreen({Key? key}) : super(key: key);

  @override
  State<ViewCardScreen> createState() => _ViewCardScreenState();
}

class _ViewCardScreenState extends State<ViewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        isHaveTitle: true,
        isHomePage: false,
        toolBarHeight: 17.h,
        title: 'West Tower seaside bulding',
        secondTitle: 'Ground floor main entrance',
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shadowColor: greyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 28.w,
                                        child: Text(
                                          'Door - Glass Work',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: primaryTextColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 1.5),
                                        decoration: BoxDecoration(
                                          color: yellowColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.sp)),
                                        ),
                                        child: const Text(
                                          'A45878788',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Condition Rating',
                                  //       style: TextStyle(
                                  //         fontWeight: FontWeight.w700,
                                  //         fontSize: 12,
                                  //         color: primaryColor,
                                  //       ),
                                  //       overflow: TextOverflow.ellipsis,
                                  //     ),
                                  //     const Text(
                                  //       'Risk Factor',
                                  //       style: TextStyle(
                                  //         fontWeight: FontWeight.w600,
                                  //         fontSize: 12,
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

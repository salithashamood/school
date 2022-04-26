import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

helpList() {
  List helpList = [
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'title':
          'Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant.',
      'description':
          'Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Quis lectus nulla at volutpat diam ut venenatis tellus in.'
    },
    {
      'title': 'Tincidunt eget nullam non nisi est.',
      'description':
          'Sagittis aliquam malesuada bibendum arcu vitae elementum curabitur vitae. Sagittis vitae et leo duis. Blandit volutpat maecenas volutpat blandit aliquam etiam erat. Sit amet cursus sit amet. Ac placerat vestibulum lectus mauris ultrices eros in cursus. Neque sodales ut etiam sit amet nisl purus in.'
    },
    {
      'title': 'Elit ut aliquam purus sit.',
      'description':
          'Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Ornare suspendisse sed nisi lacus sed viverra tellus in hac. Ultricies leo integer malesuada nunc vel risus. Sapien eget mi proin sed libero enim sed faucibus turpis. Vehicula ipsum a arcu cursus vitae congue mauris.'
    },
  ];

  return Container(
    height: 100.h,
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: helpList.map((help) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                help['title'],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(help['description']),
              SizedBox(
                height: 2.h,
              ),
            ],
          );
        }).toList(),
        // [
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Head',
        //         style: TextStyle(
        //           fontWeight: FontWeight.w700,
        //           fontSize: 22,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 1.h,
        //       ),
        //       Text(
        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        //     ],
        //   ),
        // SizedBox(
        //   height: 2.h,
        // ),
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Head',
        //         style: TextStyle(
        //           fontWeight: FontWeight.w700,
        //           fontSize: 22,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 1.h,
        //       ),
        //       Text(
        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        //     ],
        //   ),
        //   SizedBox(
        //     height: 2.h,
        //   ),
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         'Head',
        //         style: TextStyle(
        //           fontWeight: FontWeight.w700,
        //           fontSize: 22,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 1.h,
        //       ),
        //       Text(
        //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        //     ],
        //   ),
        //   // SizedBox(
        //   //   height: 2.h,
        //   // ),
        // ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

chatTile() {
  List users = [
    {
      'name': 'Surendra Jayawardena',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': true,
      'isRead': false
    },
    {
      'name': 'Hari Prasad Chaudhary',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': true
    },
    {
      'name': 'Krishna Chaudhary',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': true,
      'isRead': true
    },
    {
      'name': 'John Cena',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': false
    },
    {
      'name': 'Jonney Deep',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': true
    },
    {
      'name': 'Clint Eastwood',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': false
    },
    {
      'name': 'Kanishka Athapattu',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': true
    },
    {
      'name': 'Surendra Jayawardena',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': false,
      'isRead': true
    },
    {
      'name': 'Surendra Jayawardena',
      'msg': 'Hi how are you? We are stating new job at..',
      'isOnline': true,
      'isRead': true
    },
  ];
  // return ListView(
  //   shrinkWrap: true,
  //   children: users.map((user) {
  //     return Card(
  //       child: ListTile(
  //         leading: Stack(
  //           children: [
  //             const CircleAvatar(
  //               backgroundColor: Colors.black,
  //               radius: 30,
  //               child: Icon(
  //                 Icons.person_outline,
  //                 size: 50,
  //               ),
  //             ),
  //             user['isOnline']
  //                 ? const Positioned(
  //                     child: CircleAvatar(radius: 6),
  //                     top: 5,
  //                     right: 5,
  //                   )
  //                 : Container(),
  //           ],
  //         ),
  //         isThreeLine: true,
  //         title: Text(
  //           user['name'],
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         subtitle: Text(
  //           user['msg'],
  //           overflow: TextOverflow.ellipsis,
  //           softWrap: true,
  //           maxLines: 2,
  //           style: TextStyle(
  //               color: user['isRead'] ? Colors.black : Colors.blue,
  //               fontWeight: FontWeight.w600),
  //         ),
  //         trailing: Text('2min ago'),
  //       ),
  //     );
  //   }).toList(),
  // );

  return ListView(
    shrinkWrap: true,
    children: users.map((user) {
      return SizedBox(
        height: 15.h,
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 15.w,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Icon(
                          Icons.person_outline,
                          size: 50,
                        ),
                      ),
                      user['isOnline']
                          ? Positioned(
                              child: CircleAvatar(radius: 6),
                              top: 5,
                              right: 5,
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                user['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                                width: 15.w,
                                child: Text(
                                  '2min ago',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                        child: Text(
                          user['msg'],
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 15,
                              color:
                                  user['isRead'] ? Colors.black : Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );

  // return ListView.builder(
  //   itemCount: 10,
  //   itemBuilder: (context, index) {
  //     return SizedBox(
  //       height: 15.h,
  //       child: Card(
  //         child: Container(
  //           margin: const EdgeInsets.all(8.0),
  //           child: Row(
  //             children: [
  //               SizedBox(
  //                 width: 15.w,
  //                 child: Stack(
  //                   children: const [
  //                     CircleAvatar(
  //                       backgroundColor: Colors.black,
  //                       radius: 30,
  //                       child: Icon(
  //                         Icons.person_outline,
  //                         size: 50,
  //                       ),
  //                     ),
  //                     Positioned(
  //                       child: CircleAvatar(radius: 6),
  //                       top: 5,
  //                       right: 5,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 2.w,
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     SizedBox(
  //                       height: 5.h,
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         children: [
  //                           Expanded(
  //                             child: const Text(
  //                               'Surendra Jayawardena',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                               width: 15.w,
  //                               child: Text(
  //                                 '2min ago',
  //                                 style: TextStyle(color: Colors.grey),
  //                               )),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 6.h,
  //                       child: Text(
  //                         'Hi how are you? We are stating new job at.............',
  //                         overflow: TextOverflow.ellipsis,
  //                         softWrap: true,
  //                         maxLines: 2,
  //                         style: TextStyle(
  //                             fontSize: 15,
  //                             color: Colors.blue,
  //                             fontWeight: FontWeight.w600),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  // ListTile(
  //   leading: Stack(
  //     children: const [
  //       CircleAvatar(
  //         backgroundColor: Colors.black,
  //         radius: 30,
  //         child: Icon(
  //           Icons.person_outline,
  //           size: 50,
  //         ),
  //       ),
  //       Positioned(
  //         child: CircleAvatar(radius: 6),
  //         top: 5,
  //         right: 5,
  //       ),
  //     ],
  //   ),
  //   isThreeLine: true,
  //   title: const Text(
  //     'Surendra Jayawardena',
  //     style: TextStyle(fontWeight: FontWeight.bold),
  //   ),
  //   subtitle: Text(
  //     'Hi how are you? We are stating new job at..',
  //     overflow: TextOverflow.ellipsis,
  //     softWrap: true,
  //     maxLines: 2,
  //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
  //   ),
  //   trailing: Text('2min ago'),
  // ),
  //       ),
  //     );
  //   },
  // );
}

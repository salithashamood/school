import 'package:flutter/material.dart';

chatTile() {
  // List users = [
  //   {
  //     'name': 'Surendra Jayawardena',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': true,
  //     'isRead': false
  //   },
  //   {
  //     'name': 'Hari Prasad Chaudhary',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': true
  //   },
  //   {
  //     'name': 'Krishna Chaudhary',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': true,
  //     'isRead': true
  //   },
  //   {
  //     'name': 'John Cena',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': false
  //   },
  //   {
  //     'name': 'Jonney Deep',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': true
  //   },
  //   {
  //     'name': 'Clint Eastwood',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': false
  //   },
  //   {
  //     'name': 'Kanishka Athapattu',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': true
  //   },
  //   {
  //     'name': 'Surendra Jayawardena',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': false,
  //     'isRead': true
  //   },
  //   {
  //     'name': 'Surendra Jayawardena',
  //     'msg': 'Hi how are you? We are stating new job at..',
  //     'isOnline': true,
  //     'isRead': true
  //   },
  // ];
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

  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          leading: Stack(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                ),
              ),
              Positioned(
                child: CircleAvatar(radius: 6),
                top: 5,
                right: 5,
              ),
            ],
          ),
          isThreeLine: true,
          title: const Text(
            'Surendra Jayawardena',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Hi how are you? We are stating new job at..',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          ),
          trailing: Text('2min ago'),
        ),
      );
    },
  );
}

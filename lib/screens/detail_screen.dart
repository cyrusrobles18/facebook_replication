import 'package:facebook_starter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_font.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;

  DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomFont(
            text: userName,
            fontSize: ScreenUtil().setSp(20),
            color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (imageUrl == '')
                  ? SizedBox(
                      height: ScreenUtil().setHeight(0.1),
                    )
                  : Image.network(imageUrl),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (profileImageUrl == '')
                        ? const Icon(Icons.person)
                        : CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            backgroundImage: NetworkImage(profileImageUrl),
                          ),

                    // (profileImageUrl == '')
                    //     ? const Icon(
                    //         Icons.person,
                    //       )
                    //     : CircleAvatar(
                    //         radius: ScreenUtil().setSp(15),
                    //         backgroundImage: NetworkImage(profileImageUrl),
                    //       ),
                    // const Icon(
                    //   Icons.person,
                    // ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: userName,
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomFont(
                              text: date,
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(3),
                            ),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: ScreenUtil().setSp(18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Divider(),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        print('Liked');
                      },
                      icon: const Icon(
                        Icons.thumb_up,
                        color: FB_DARK_PRIMARY,
                      ),
                      label: CustomFont(
                        text:
                            (numOfLikes == 0) ? 'Like' : numOfLikes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment,
                        color: FB_DARK_PRIMARY,
                      ),
                      label: CustomFont(
                        text: 'Comment',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.redo,
                        color: FB_DARK_PRIMARY,
                      ),
                      label: CustomFont(
                        text: 'Share',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_DARK_PRIMARY,
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
  }
}

// import 'package:flutter/material.dart';

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => print('FAB'),
//         child: Icon(Icons.add),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 onPressed: () => print('TextButton'),
//                 child: Text('TextButton'),
//               ),
//               ElevatedButton(
//                   onPressed: () => print('ElevatedButton'),
//                   child: Text('ElevatedButton')),
//               OutlinedButton(
//                   onPressed: () => print('OutlinedButton'),
//                   child: Text('OutlinedButton')),
//               GestureDetector(
//                 onTap: () => print('Gesture Detected'),
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.yellow,
//                 ),
//               ),
//               InkWell(
//                 onTap: () => print('Inkwell'),
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                 ),
//                 splashColor: Colors.amber,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

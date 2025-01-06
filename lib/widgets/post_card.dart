import 'package:facebook_starter/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';

// ignore: must_be_immutable
class PostCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;

  PostCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
      // Navigator.pushNamed(context, '/detail'),
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            userName: widget.userName,
            postContent: widget.postContent,
            date: widget.date,
            numOfLikes: widget.numOfLikes,
            imageUrl: widget.imageUrl,
            profileImageUrl: widget.profileImageUrl,
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (widget.profileImageUrl == '')
                      ? const Icon(Icons.person)
                      : CircleAvatar(
                          radius: ScreenUtil().setSp(15),
                          backgroundImage: NetworkImage(widget.profileImageUrl),
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
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomFont(
                            text: widget.date,
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(3),
                          ),
                          Icon(
                            Icons.public,
                            color: Colors.grey,
                            size: ScreenUtil().setSp(15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),

              SizedBox(height: ScreenUtil().setHeight(5)),
              // Post Content
              CustomFont(
                text: widget.postContent,
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black,
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              // (imageUrl == '')
              //     ? SizedBox(
              //         height: ScreenUtil().setHeight(0.1),
              //       )
              //     : Image.network(imageUrl),

              (widget.imageUrl == '')
                  ? SizedBox(
                      height: ScreenUtil().setHeight(0.1),
                    )
                  : Image.network(widget.imageUrl),

              // (!widget.hasImage)
              //     ? SizedBox(
              //         height: ScreenUtil().setHeight(0.1),
              //       )
              //     : const Placeholder(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      print('Liked');
                      setState(() {
                        widget.numOfLikes++;
                      });
                    },
                    icon: const Icon(
                      Icons.thumb_up,
                      color: FB_DARK_PRIMARY,
                    ),
                    label: CustomFont(
                      text: (widget.numOfLikes == 0)
                          ? 'Like'
                          : widget.numOfLikes.toString(),
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

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextButton(
              //       onPressed: () {},
              //       child: Column(
              //         children: [
              //           Icon(Icons.abc),
              //           SizedBox(
              //             height: ScreenUtil().setHeight(1),
              //           ),
              //           CustomFont(
              //               text: 'Text',
              //               fontSize: ScreenUtil().setSp(12),
              //               color: FB_DARK_PRIMARY),
              //         ],
              //       ),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Column(
              //         children: [
              //           Icon(Icons.access_alarm),
              //           SizedBox(
              //             height: ScreenUtil().setHeight(1),
              //           ),
              //           CustomFont(
              //               text: 'Elevated',
              //               fontSize: ScreenUtil().setSp(12),
              //               color: FB_DARK_PRIMARY),
              //         ],
              //       ),
              //     ),
              //     OutlinedButton(
              //       onPressed: () {},
              //       child: Column(
              //         children: [
              //           Icon(Icons.yard_sharp),
              //           SizedBox(
              //             height: ScreenUtil().setHeight(1),
              //           ),
              //           CustomFont(
              //               text: 'Outlined',
              //               fontSize: ScreenUtil().setSp(12),
              //               color: FB_DARK_PRIMARY),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    width: ScreenUtil().setWidth(330),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setSp(10))),
                    ),
                    child: CustomFont(
                        text: 'Write a comment...',
                        fontSize: ScreenUtil().setSp(11),
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomFont(
                  text: 'View comments',
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

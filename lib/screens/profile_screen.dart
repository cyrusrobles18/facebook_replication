import 'package:facebook_starter/constants.dart';
import 'package:facebook_starter/widgets/custom_button.dart';
import 'package:facebook_starter/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification.dart' as notif;
import '../widgets/post_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://cdn.photographylife.com/wp-content/uploads/2014/06/Nikon-D810-Image-Sample-6.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: ScreenUtil().setWidth(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://cdn.photographylife.com/wp-content/uploads/2014/06/Nikon-D810-Image-Sample-6.jpg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(55)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: 'Cyrus Rj Robles',
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    Row(
                      children: [
                        CustomFont(
                          text: '1M',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomFont(
                          text: 'followers',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Icon(
                          Icons.circle,
                          size: ScreenUtil().setSp(5),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        CustomFont(
                          text: '1',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomFont(
                          text: 'following',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(
                      children: [
                        CustomButton(
                          buttonName: 'Follow',
                          onPressed: () {},
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomButton(
                          buttonName: 'Message',
                          onPressed: () {},
                          buttonType: 'outlined',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              TabBar(
                indicatorColor: FB_DARK_PRIMARY,
                tabs: [
                  Tab(
                    child: CustomFont(
                      text: 'Posts',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'About',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: CustomFont(
                      text: 'Photos',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2000),
                child: TabBarView(
                  children: [
                    _posts(),
                    _about(),
                    _photos(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _posts() {
    return Column(
      children: [
        PostCard(
          userName: 'Test 1',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
        ),
        PostCard(
          userName: 'Test 1',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
          imageUrl:
              'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium',
          profileImageUrl:
              'https://image.petmd.com/files/inline-images/shiba-inu-black-and-tan-colors.jpg?VersionId=pLq84BEOjdMjXeDCUJJJLFPuIWYsVMUU',
        ),
        PostCard(
          userName: 'Test 1',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
        ),
      ],
    );
  }

  Widget _about() {
    return Column(
      children: [
        notif.Notification(
          name: 'Works',
          post: 'Krusty Crab',
          description: 'Description',
          icon: Icon(
            Icons.work,
          ),
        ),
        notif.Notification(
          name: 'Graduated',
          post: 'National University',
          description: 'BSIT MWA',
          icon: Icon(
            Icons.school,
            size: ScreenUtil().setSp(35),
          ),
        ),
        notif.Notification(
          name: 'In a relationship',
          post: 'Manila',
          description: 'since 2001',
        ),
      ],
    );
  }

  Widget _photos() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Image.network(
          'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium',
          scale: 10,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Image.network(
              'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.teal[200],
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.petplace.com/article/breed/media_15ad72c2fdb39acf09aafa9934912c89bfa08665a.jpeg?width=1200&format=pjpg&optimize=medium'))),
        ),
      ],
    );
  }
}

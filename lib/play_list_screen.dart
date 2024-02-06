import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple.shade900,
            const Color(0xff922FF5),
            const Color(0xffDB28A9),
          ], begin: Alignment.topRight, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 10,
                  bottom: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "R&B Playlist",
                            style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Chill your mind",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xffA5A5A5),
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 24.h,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.play_circle_outline_sharp,
                        color: Colors.white,
                        size: 24.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

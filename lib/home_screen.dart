import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offline_music_player/play_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final List tabs = ["Recent", "Top 50", "Chill", "R&B", "Festival"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple.shade900,
          const Color(0xff922FF5),
          const Color(0xffDB28A9),
        ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "What do you feel like today?",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffA5A5A5),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  fillColor: const Color(0xff433E48),
                  hintText: "Search song, play list, artist...",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 34.h,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              tabs[index],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            index == selectedIndex
                                ? Container(
                                    height: 4.h,
                                    width: 54.w,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Color(0xffC22BB7),
                                          Color(0xff922FF5),
                                        ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PlayListScreen(),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                    "assets/images/background.png")),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "R&B Playlist",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Chill your mind",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xffA5A5A5),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                "Your favourites",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset("assets/images/background.png"),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bye Bye",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "2:09",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Marshmello, Juice WRLD",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xffA5A5A5),
                            fontWeight: FontWeight.w400),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

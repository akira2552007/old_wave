import 'package:flutter/material.dart';
import 'package:old_wave/Pages/audioLibrary.dart';
import 'package:old_wave/Pages/items/container.dart';
import 'package:old_wave/Pages/likedsongs.dart';
import 'package:old_wave/Pages/searchpage.dart';
import 'package:old_wave/Pages/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.black,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'MUSIC ',
                      style: TextStyle(
                        fontFamily: 'Nothing_Font',
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      GestureDetector(
                        child: containerNothing('assets/favourites.png'),
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Likedsongs(),
                              ),
                            ),
                      ),
                      GestureDetector(
                        child: containerNothing('assets/music.png'),
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Audiolibrary(),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'RECOMMENDED',
                        style: TextStyle(
                          fontFamily: 'Nothing_Font',
                          color: Color(0XFFbb1b3f),
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 10,
            right: 10,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800]!,
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Searchpage()),
                      );
                    },
                    icon: Icon(Icons.search),
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    splashRadius: 100,
                    tooltip: "Search",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

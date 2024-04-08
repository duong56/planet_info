import 'package:card_swiper/card_swiper.dart';
import 'package:dev_o/constants.dart';
import 'package:dev_o/data.dart';
import 'package:dev_o/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.left,
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                              child: Text(
                            'Solar System',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 24,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ))
                        ],
                        onChanged: (value) {},
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Image.asset('assets/drop_down_icon.png'),
                        ),
                        underline: SizedBox(),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    itemCount: planets.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, a, b) =>
                                      DetailPage(planetInfo: planets[index])));
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(height: 100),
                                Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Text(
                                          planets[index].name,
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 44,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w900),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Solar System',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 23,
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color:
                                                      const Color(0xffe4979e),
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Hero(tag: planets[index].position, child: Image.asset(planets[index].iconImage))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: null, icon: Image.asset('assets/menu_icon.png')),
            IconButton(
                onPressed: null, icon: Image.asset('assets/search_icon.png')),
            IconButton(
                onPressed: null, icon: Image.asset('assets/profile_icon.png'))
          ],
        ),
      ),
    );
  }
}

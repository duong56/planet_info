import 'package:dev_o/constants.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.planetInfo});

  final PlanetInfo planetInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                      ),
                      Text(
                        planetInfo.name,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Solar System',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        planetInfo.description ?? '',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: const Color(0xff868686),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: Colors.black38,
                      )
                    ],
                  ),
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 25,
                      color: const Color(0xff47455f),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(itemCount: planetInfo.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(planetInfo.images[index], fit: BoxFit.cover,),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: -60,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              )
          ),
          Positioned(child: Text(
            '5',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 247,
              color: const Color(0x249f9f9f).withOpacity(0.10),
              fontWeight: FontWeight.w900
            ),
          )),
          IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios))
        ],
      )),
    );
  }
}

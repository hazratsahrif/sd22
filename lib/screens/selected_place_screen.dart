// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd22/models/json.dart';
import 'package:sd22/models/recommended_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedPlaceScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  
  Widget build(BuildContext context) {
    // print(MyJson().recommendationsData.images![0].toString());
    // print(objectlist.images!.length);
    List<String> images = MyJson().recommendationsData[0]['images'];


    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            PageView(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                images.length,
                (index) => Container(
                  margin: EdgeInsets.only(right: 28.8),
                  width: 333.6,
                  height: 218.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        images[index],),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 19.2,
                        left: 19.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.8),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                            child: Container(
                              height: 36,
                              padding:
                                  EdgeInsets.only(left: 16.72, right: 14.4),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                      'assets/svg/icon_location.svg'),
                                  const SizedBox(
                                    width: 9.52,
                                  ),
                                  Text(
                                    MyJson().recommendationsData[index]['name'],
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 16.8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 57,
              width: 57.6,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.6),
                color: Color(0x080a0928),
              ),
              child: SvgPicture.asset('assets/svg/icon_drawer.svg'),
            ),
            Container(
              height: 57,
              width: 57.6,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.6),
                color: Color(0x080a0928),
              ),
              child: SvgPicture.asset('assets/svg/icon_search.svg'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 346.8,
                margin: EdgeInsets.only(left: 28.8, bottom: 48, right: 28.8),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: images.length,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xFF8a8a8a),
                          dotColor: Color(0xFFababab),
                          dotHeight: 4.8,
                          dotWidth: 6,
                          spacing: 4.8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Text(
                        MyJson().recommendationsData[0]['tagLine']??'',
                        maxLines: 2,
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 35.6, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                      ),
                      child: Text(
                        MyJson().recommendationsData[0]['description']??'',
                        maxLines: 3,
                        style: GoogleFonts.lato(
                            fontSize: 19.6,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Start From',
                              style: GoogleFonts.lato(
                                  fontSize: 16.8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              '\$ ${MyJson().recommendationsData[0]['price']}',
                              style: GoogleFonts.lato(
                                  fontSize: 21.8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          height: 62.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.white,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 28.8, right: 28.8),
                              child: Text(
                                'Explore Now >>',
                                style: GoogleFonts.lato(
                                    fontSize: 19.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


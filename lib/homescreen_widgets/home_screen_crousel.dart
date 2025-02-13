import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants/app_images.dart';

final List<String> imgList = [
  AppImages.banner1,
  AppImages.banner2,
  AppImages.banner3,
  AppImages.banner4,
  AppImages.banner5,
  ];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.all(5.0),
        width: 3000,
        child: GestureDetector(
          onTap: (){ print("Banner Pressed");},
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.asset(item, fit: BoxFit.fill),
          ),
        ),
      ),
    )
    .toList();

class HomeScreenCrousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenCrouselState();
  }
}

class _HomeScreenCrouselState extends State<HomeScreenCrousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              height: 180,
              // aspectRatio: 0.626,
              enlargeFactor: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffABABAB), width: 1.5),
                    color: _current != entry.key ? Colors.white : Color(0xffABABAB),),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderHome extends StatefulWidget {
  const CarouselSliderHome({super.key});

  @override
  State<CarouselSliderHome> createState() => _CarouselSliderHomeState();
}

class _CarouselSliderHomeState extends State<CarouselSliderHome> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  final List<String> _imagePaths = [
    'assets/images/carousel_home/slider1.jpg',
    'assets/images/carousel_home/slider2.jpg',
    'assets/images/carousel_home/slider3.jpg',
    'assets/images/carousel_home/slider4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: _imagePaths
                  .map((imagePath) => _buildCarouselItem(imagePath))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16.0),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _imagePaths.length,
        (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: _currentIndex == index ? 12.0 : 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
              borderRadius: BorderRadius.circular(4.0),
            ),
          );
        },
      ),
    );
  }
}

import 'package:fake_store_app/presentation/screens/home_page/carousel_slider/carousel_slider_home.dart';
import 'package:fake_store_app/presentation/screens/home_page/categories/categories_home.dart';
import 'package:fake_store_app/presentation/screens/home_page/for_you_products/for_you_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ids = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 350.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: const CarouselSliderHome(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Categorías',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        // color: Color.fromARGB(255, 178, 98, 0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150.0,
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  child: const CategoriesHome(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  child: Text(
                    'Para Ti',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        // color: Color.fromARGB(255, 178, 98, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500.0,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),

                    // contar los items de los productos
                    // 0 -> -1
                    itemCount: ids.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ForYouCard(
                          id: ids[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

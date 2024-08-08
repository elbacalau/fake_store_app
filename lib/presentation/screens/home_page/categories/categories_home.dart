import 'package:fake_store_app/presentation/screens/products_category_page/products_category.dart';
import 'package:flutter/material.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {
        'name': 'Electronic',
        'image': 'assets/images/categories/electronic.png',
        'category': 'electronics'
      },
      {
        'name': 'Jewelery',
        'image': 'assets/images/categories/jewlery.png',
        'category': 'jewelery'
      },
      {
        'name': 'Men Clothing',
        'image': 'assets/images/categories/menclothe.png',
        'category': 'men\'s clothing'
      },
      {
        'name': 'Women Clothing',
        'image': 'assets/images/categories/womclothe.png',
        'category': 'women\'s clothing'
      },
    ];

    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 201, 255, 226),
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: 120.0,
            margin: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 85.0,
                  width: 90.0,
                  child: Image.asset(
                    category['image']!,
                    fit: BoxFit.contain,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      // backgroundColor: Colors.orange[100],
                      ),
                  child: Text(
                    category['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductsByCategory(
                          category: category['category']!,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

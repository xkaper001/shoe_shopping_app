import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shoe_shopping_app/constants/assets.dart';
import 'package:shoe_shopping_app/constants/palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> shoeCatalogue = [
      Product(
          name: 'Nike Dunk Low',
          cost: '11,895',
          colorsAvailable: 5,
          productImage: AppAssets.nikeDunkLow),
      Product(
          name: 'Ultimashow',
          cost: '5,599',
          colorsAvailable: 3,
          productImage: AppAssets.adidasUltimashow),
      Product(
          name: 'Air Max Scorpian',
          cost: '23,599',
          colorsAvailable: 1,
          productImage: AppAssets.nikeAirMax),
    ];
    List<Brand> brands = [
      Brand(logo: AppAssets.adidas, name: 'Adidas'),
      Brand(logo: AppAssets.nike, name: 'Nike'),
      Brand(logo: AppAssets.pump, name: 'Puma'),
      Brand(logo: AppAssets.reebok, name: 'Reebok'),
      Brand(logo: AppAssets.underArmour, name: 'Under Armor'),
      Brand(logo: AppAssets.fila, name: 'Fila'),
    ];

    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AppAssets.heroBG,
                    fit: BoxFit.fitWidth,
                    // width: double.maxFinite,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      height: 30,
                      onPressed: () {},
                      child: const Text(
                        'Explore',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            const Gap(32),

            // Shop By Brand Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop by Brand',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    return BrandCard(brand: brands[index]);
                  },
                )
              ],
            ),
            const Gap(32),
            // Recommended for you column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended for you',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(16),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: shoeCatalogue.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: shoeCatalogue[index]);
                    },
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class Product {
  final String name;
  final String cost;
  final int colorsAvailable;
  final String productImage;
  Product(
      {required this.name,
      required this.cost,
      required this.colorsAvailable,
      required this.productImage});
}

class Brand {
  final String logo;
  final String name;
  Brand({required this.logo, required this.name});
}

class BrandCard extends StatelessWidget {
  final Brand brand;

  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(brand.logo, height: 40),
          ),
          const Gap(10),
          Text(brand.name),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Gap(5),
          Image.asset(product.productImage, height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("RS ${product.cost}/-"),
              Text("${product.colorsAvailable} Colors"),
            ],
          ),
        ],
      ),
    );
  }
}

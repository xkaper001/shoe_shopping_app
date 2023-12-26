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
          cost: 11895,
          colorsAvailable: 5,
          productImage: AppAssets.nikeDunkLow),
      Product(
          name: 'Ultimashow',
          cost: 5599,
          colorsAvailable: 3,
          productImage: AppAssets.adidasUltimashow),
      Product(
          name: 'Air Max Scorpian',
          cost: 23599,
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
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Palette.grey,
              ),
            ),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop by Brand',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
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
            )
          ],
        ));
  }
}

class Product {
  final String name;
  final int cost;
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              color: Palette.categoryBG,
              padding: const EdgeInsets.all(8),
              child: Expanded(
                child: Image.asset(brand.logo, height: 40),
              ),
            ),
            const Gap(10),
            Text(brand.name),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return const Card();
  }
}

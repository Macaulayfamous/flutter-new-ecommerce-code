import 'package:badges/badges.dart';
import 'package:ecommerce_app/models/clothes.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/provider/products.dart';
import 'package:ecommerce_app/views/screens/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;

  const ProductItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context);

    return Container(
      margin: EdgeInsets.all(
        10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(DetailPage.id, arguments: products.id);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(products.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 15,
                    child: Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.circular(8),
                      badgeContent: Text('New Arriaval',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Text(
                products.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              Text(
                '\$${products.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

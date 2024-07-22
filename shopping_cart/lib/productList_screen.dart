import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_model.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/cart_screen.dart';
import 'package:shopping_cart/db_helper.dart';

class ProductlistScreen extends StatefulWidget {
  const ProductlistScreen({super.key});

  @override
  State<ProductlistScreen> createState() => _ProductlistScreenState();
}

DbHelper dbHelper = DbHelper();

class _ProductlistScreenState extends State<ProductlistScreen> {
  List<String> productName = [
    "Mango",
    "Banana",
    "Orange",
    "Grapes",
    "Cherry",
    "Peach",
    "Mixed Fruit Basket"
  ];
  List<String> productUnit = ["Kg", "Dozen", "Dozen", "Kg", "Kg", "Kg", "Kg"];
  List<int> productPrice = [10, 20, 30, 40, 50, 60, 70];
  List<String> productImage = [
    "https://images.pexels.com/photos/2294471/pexels-photo-2294471.jpeg",
    "https://images.pexels.com/photos/7194914/pexels-photo-7194914.jpeg",
    "https://images.pexels.com/photos/327098/pexels-photo-327098.jpeg",
    "https://images.pexels.com/photos/708777/pexels-photo-708777.jpeg",
    "https://images.pexels.com/photos/162804/cherries-fruits-sweet-cherry-cherry-harvest-162804.jpeg",
    "https://images.pexels.com/photos/1268122/pexels-photo-1268122.jpeg",
    "https://images.pexels.com/photos/6707510/pexels-photo-6707510.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Center(
                  child: badges.Badge(
                    badgeContent: Text(
                      value.getCounter().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              height: 100,
                              width: 100,
                              image: NetworkImage(productImage[index]),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${productUnit[index]} \$${productPrice[index]}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dbHelper
                                    .insert(
                                  Cart(
                                    id: index,
                                    productId: index.toString(),
                                    productName: productName[index],
                                    initialPrice: productPrice[index],
                                    productPrice: productPrice[index],
                                    quantity: 1,
                                    unitTag: productUnit[index],
                                    image: productImage[index],
                                  ),
                                )
                                    .then((value) {
                                  print("Product is added to cart");
                                  cart.addTotalPrice(double.parse(
                                      productPrice[index].toString()));
                                  cart.addCounter();
                                  // Update badge here using context
                                }).onError((error, stackTrace) {
                                  print(error.toString());
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Add To Cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

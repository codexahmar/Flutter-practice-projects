import 'dart:core';
import 'dart:core' as core;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shopping_cart/cart_model.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/db_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DbHelper dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return badges.Badge(
                badgeContent: Text(
                  value.getCounter().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("images/empty-cart.png")),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Explore Products",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                        height: 100,
                                        width: 100,
                                        image: NetworkImage(
                                          snapshot.data![index].image
                                              .toString(),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data![index].productName
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    dbHelper.delete(snapshot.data![index].id!).then((_) {
                                                      cart.removeCounter();
                                                      double productPrice = double.tryParse(snapshot.data![index].productPrice.toString()) ?? 0.0;
                                                      cart.removeTotalPrice(productPrice);
                                                      if (cart.counter == 0) {
                                                        cart.clearCart(); // Clear the cart when the last item is removed
                                                      }
                                                    });
                                                  },
                                                  child: const Icon(Icons.delete),
                                                ),

                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              '${snapshot.data![index].unitTag} \$${snapshot.data![index].productPrice.toString()}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                            int price = snapshot
                                                                .data![index]
                                                                .initialPrice!;
                                                            quantity--;
                                                            int? newPrice =
                                                                quantity *
                                                                    price;

                                                            if (quantity > 0) {
                                                              dbHelper
                                                                  .updateQuantity(
                                                                      Cart(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id!,
                                                                productId: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id!
                                                                    .toString(),
                                                                productName: snapshot
                                                                    .data![
                                                                        index]
                                                                    .productName!,
                                                                initialPrice: snapshot
                                                                    .data![
                                                                        index]
                                                                    .initialPrice!,
                                                                productPrice:
                                                                    newPrice,
                                                                quantity:
                                                                    quantity,
                                                                unitTag: snapshot
                                                                    .data![
                                                                        index]
                                                                    .unitTag
                                                                    .toString(),
                                                                image: snapshot
                                                                    .data![
                                                                        index]
                                                                    .image
                                                                    .toString(),
                                                              ))
                                                                  .then(
                                                                      (value) {
                                                                newPrice = 0;
                                                                quantity = 0;
                                                                double
                                                                    initialPrice =
                                                                    double.tryParse(snapshot
                                                                            .data![index]
                                                                            .initialPrice
                                                                            .toString()) ??
                                                                        0.0;
                                                                cart.removeTotalPrice(
                                                                    initialPrice);
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error
                                                                    .toString());
                                                              });
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                            int price = snapshot
                                                                .data![index]
                                                                .initialPrice!;
                                                            quantity++;
                                                            int? newPrice =
                                                                quantity *
                                                                    price;
                                                            dbHelper
                                                                .updateQuantity(
                                                                    Cart(
                                                              id: snapshot
                                                                  .data![index]
                                                                  .id!,
                                                              productId: snapshot
                                                                  .data![index]
                                                                  .id!
                                                                  .toString(),
                                                              productName: snapshot
                                                                  .data![index]
                                                                  .productName!,
                                                              initialPrice: snapshot
                                                                  .data![index]
                                                                  .initialPrice!,
                                                              productPrice:
                                                                  newPrice,
                                                              quantity:
                                                                  quantity,
                                                              unitTag: snapshot
                                                                  .data![index]
                                                                  .unitTag
                                                                  .toString(),
                                                              image: snapshot
                                                                  .data![index]
                                                                  .image
                                                                  .toString(),
                                                            ))
                                                                .then((value) {
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              double
                                                                  initialPrice =
                                                                  double.tryParse(snapshot
                                                                          .data![
                                                                              index]
                                                                          .initialPrice
                                                                          .toString()) ??
                                                                      0.0;
                                                              cart.addTotalPrice(
                                                                  initialPrice);
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              print(error
                                                                  .toString());
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                    );
                  }
                } else {
                  return const Center(child: Text("Something went wrong"));
                }
              },
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                double totalPrice = value.getTotalPrice();
                double discount = totalPrice * 0.20;
                double finalTotal = totalPrice - discount;
                return Visibility(
                  visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                      ? false
                      : true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ReusableWidget(
                          title: "Sub Total",
                          value:
                              r"$" + value.getTotalPrice().toStringAsFixed(2),
                        ),
                        const ReusableWidget(
                          title: "Discount",
                          value: r"20%",
                        ),
                        ReusableWidget(
                          title: "Total",
                          value:
                              r"$" + finalTotal.toString(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

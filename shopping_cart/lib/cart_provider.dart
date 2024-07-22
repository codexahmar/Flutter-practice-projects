import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/cart_model.dart';
import 'package:shopping_cart/db_helper.dart';

class CartProvider with ChangeNotifier {
  DbHelper dbHelper = DbHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = dbHelper.getCartList();
    return _cart;
  }

  void _setPrefItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("cart_item", _counter);
    sharedPreferences.setDouble("total_price", _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _counter = sharedPreferences.getInt("cart_item") ?? 0;
    _totalPrice = sharedPreferences.getDouble("total_price") ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    if (_counter > 0) {
      _counter--;
    }
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  void addTotalPrice(double productPrice) {
    _totalPrice += productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice -= productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void clearCart() {
    _counter = 0;
    _totalPrice = 0.0;
    _setPrefItems();
    notifyListeners();
  }
}

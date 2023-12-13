import 'package:boba_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // Pearl Milk Tea
    Drink(
      name: "Pearl Milk Tea",
      imagePath: "lib/assets/images/pearl_milk_tea.png",
      price: "£4.80",
    ),
    Drink(
      name: "Taro Milk Tea",
      imagePath: "lib/assets/images/taro_milk_tea.png",
      price: "£5.20",
    ),
    Drink(
      name: "Green Tea",
      imagePath: "lib/assets/images/green_tea.png",
      price: "£6.00",
    ),
    Drink(
      name: "Cream Tea",
      imagePath: "lib/assets/images/cream_tea.png",
      price: "£7.50",
    ),
    Drink(
      name: "Choco Tea",
      imagePath: "lib/assets/images/choco_tea.png",
      price: "£4.30",
    ),
    Drink(
      name: "Mango Tea",
      imagePath: "lib/assets/images/mango_tea.png",
      price: "£5.45",
    ),
    Drink(
      name: "Strawberry Tea",
      imagePath: "lib/assets/images/strawberry_tea.png",
      price: "£5.45",
    ),
    Drink(
      name: "Peach Tea",
      imagePath: "lib/assets/images/peach_tea.png",
      price: "£5.45",
    ),
  ];

  // list of drinks in cart
  final List<Drink> _cart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get users cart
  List<Drink> get cart => _cart;

  // add drink to cart
  void addToCart(Drink drink) {
    _cart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeDrinkFromCart(Drink drink) {
    _cart.remove(drink);
    notifyListeners();
  }
}
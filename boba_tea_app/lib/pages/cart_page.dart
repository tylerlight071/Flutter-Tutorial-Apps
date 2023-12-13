import 'package:boba_tea_app/components/drink_tile.dart';
import 'package:boba_tea_app/models/drink.dart';
import 'package:boba_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeDrinkFromCart(Drink drink) {
    // remove drink from cart
    Provider.of<BubbleTeaShop>(context, listen: false)
        .removeDrinkFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            // heading
            children: [
              const Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      //get individual drink in cart first
                      Drink drink = value.cart[index];

                      // return drink as a tile
                      return DrinkTile(
                        drink: drink,
                        onTap: () => removeDrinkFromCart(drink),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => value.removeDrinkFromCart(drink),
                        ),
                      );
                    }),
              ),
              const Divider(),
              // total price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "£${value.cart.length * 4.99}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //! checkout button
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.payment, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Pay",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

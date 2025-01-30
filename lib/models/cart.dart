import 'shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
// list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom FREAK',
      price: '399',
      description: 'The forward—thinking design of his latest signature shoe.',
      imagePath: 'lib/assets/images/nike3.png',
    ),
    Shoe(
      name: 'air max 270',
      price: '449',
      description:
          'A modern take on the classic Air Max design, offering superior comfort and style.',
      imagePath: 'lib/assets/images/nike4.png',
    ),
    Shoe(
      name: 'air jordan 25',
      price: '999',
      description:
          'The Air Jordan 25 is a tribute to the original Air Jordan 1.',
      imagePath: 'lib/assets/images/nike5.png',
    ),
  ];

// list of items in user cart
  List<Shoe> userCart = [];

// get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

// get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

// add items to cart
  void addItemsToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

// remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class CartService {
  late LocalStorage localStorage;
  late BuildContext _context;
  List<dynamic> cartItemList = [];

  CartService(BuildContext context) {
    _context = context;
    localStorage = LocalStorage('dominos_cart');
    cartItemList = localStorage.getItem('cart') ?? [];
  }

  Future<void> addItemToCart(
    String id,
    String name,
    int qty,
    String type,
  ) async {
    int cartIndex = cartItemList.indexWhere((element) => element['_id'] == id);
    if (cartIndex == -1) {
      Map cartItem = {};
      cartItem.putIfAbsent("_id", () => id);
      cartItem.putIfAbsent("name", () => name);
      cartItem.putIfAbsent("qty", () => qty);
      cartItem.putIfAbsent("type", () => type);
      cartItemList.add(cartItem);
    } else {
      Map cartItem = cartItemList[cartIndex];
      cartItem.update("qty", (value) => cartItem['qty'] + qty);
      cartItemList.replaceRange(cartIndex, cartIndex + 1, [cartItem]);
    }
  }

  Future<void> updateCartItem(
    String id,
    int qty,
    bool update,
  ) async {
    int cartIndex = cartItemList.indexWhere((element) => element['_id'] == id);
    if (cartIndex == -1) {
      Map cartItem = cartItemList[cartIndex];
      if (update) {
        cartItem.update("qty", (value) => qty);
      } else {
        cartItem.update("qty", (value) => cartItem['qty'] + qty);
      }
      cartItemList.replaceRange(cartIndex, cartIndex + 1, [cartItem]);
    }
  }

  List<dynamic> getCartItems() {
    return localStorage.getItem('cart');
  }
}

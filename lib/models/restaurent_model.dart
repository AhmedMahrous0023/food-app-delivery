import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:intl/intl.dart';

class Restaurent extends ChangeNotifier {
  final List<Food> _menue = [
    //burgers
    Food(
        name: 'Classic Cheese Burger',
        describtion:
            'A juicy beef patty with melted chedddar, lettuce,tomato,and a hint of onion and pickle',
        imagePath: 'images/burger/burger1.jpg',
        price: 8.99,
        category: foodCategory.Burger,
        availableAddons: [
          Addon(name: 'Extera Cheese', price: 1.23),
          Addon(name: 'Backon', price: 2.10),
          Addon(name: 'Avocado', price: 3.15)
        ]),
    Food(
        name: 'Chicken Buster',
        describtion:
            'Chicken strips with Buffalo sauce and melted cheddar cheese',
        imagePath: 'images/burger/burger2.jpg',
        price: 15.24,
        category: foodCategory.Burger,
        availableAddons: [
          Addon(name: 'Extera Cheese', price: 1.23),
          Addon(name: 'Backon', price: 2.10),
          Addon(name: 'Avocado', price: 3.15)
        ]),
    Food(
        name: 'Shiitake Mushroom',
        describtion:
            'Sautéed mushroom, cheddar cheese, and creamy mayonnaise spread on top of our pure beef burger patty',
        imagePath:
            'images/burger/black-bean-mushroom-veggie-burgers-website.jpg',
        price: 180,
        category: foodCategory.Burger,
        availableAddons: [
          Addon(name: 'Extera Cheese', price: 1.23),
          Addon(name: 'Backon', price: 2.10),
          Addon(name: 'Avocado', price: 3.15)
        ]),
    Food(
        name: ' Bacon Mushroom Jack',
        describtion:
            'Beef bacon with fresh sautéed mushroom, cheddar cheese, and creamy mayonnaise',
        imagePath: 'images/burger/images.jpeg',
        price: 215,
        category: foodCategory.Burger,
        availableAddons: [
          Addon(name: 'Beef Bacon', price: 4.23),
          Addon(name: 'Backon', price: 2.10),
          Addon(name: 'Avocado', price: 3.15)
        ]),
    //salads
    Food(
        name: 'Green Salad',
        describtion: 'wonderful salad consists of vegtables',
        imagePath: 'images/salads/green-salad.jpg',
        price: 12.12,
        category: foodCategory.salads,
        availableAddons: [Addon(name: 'Tomato', price: 2.12)]),
    Food(
        name: 'Dinner Salad',
        describtion: 'wonderful salad consists of vegtables',
        imagePath: 'images/salads/dinner-salad-recipes-1651260384.jpeg',
        price: 15.12,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Tomato', price: 1.12),
          Addon(name: 'Onion', price: 3.1)
        ]),
    Food(
        name: 'Courgette and Chimichurri Salad',
        describtion: ' salad consists of Courgette',
        imagePath: 'images/salads/Courgette-and-chimichurri-salad-b77053f.jpg',
        price: 19.12,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Tomato', price: 2.12),
          Addon(name: 'Onion', price: 3.1)
        ]),
    Food(
        name: 'Veggie Salad',
        describtion: ' salad consists of Veggie',
        imagePath: 'images/salads/nRainbow-Veggie-Salad-9921.jpg',
        price: 11.12,
        category: foodCategory.salads,
        availableAddons: [
          Addon(name: 'Tomato', price: 4.12),
          Addon(name: 'Onion', price: 3.1)
        ]),
    //desserts
    Food(
        name: 'Gatou ',
        describtion: ' Gatou consists of cub cake,cream',
        imagePath: 'images/desserts/1.jpg',
        price: 25.12,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'cream', price: 4.12),
          Addon(name: 'cake', price: 3.1)
        ]),
    Food(
        name: 'Turkish Cake ',
        describtion: ' Turkish cake consists of cub cake,cream',
        imagePath: 'images/desserts/6.jpg',
        price: 29.12,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'cream', price: 4.12),
          Addon(name: 'cake', price: 3.1)
        ]),
    Food(
        name: 'Cub Cake ',
        describtion: '  consists of cub cake,cream',
        imagePath: 'images/desserts/4.jpg',
        price: 17.12,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'cream', price: 4.12),
          Addon(name: 'cake', price: 3.1)
        ]),
    Food(
        name: 'arabian cake ',
        describtion: ' arabian cake consists of cub cake,cream',
        imagePath: 'images/desserts/2.jpg',
        price: 28.12,
        category: foodCategory.desserts,
        availableAddons: [
          Addon(name: 'cream', price: 4.12),
          Addon(name: 'cake', price: 3.1)
        ]),
    //sides
    Food(
        name: 'Potato Chips ',
        describtion: ' chips  consists of Potato',
        imagePath: 'images/sides/sides1.jpeg',
        price: 9.12,
        category: foodCategory.sides,
        availableAddons: [
          Addon(name: 'chips', price: 1.12),
          Addon(name: 'bread', price: 3.1)
        ]),
    Food(
        name: 'Feelih ',
        describtion: ' Feelih  consists of Feelih',
        imagePath: 'images/sides/sides3.jpeg',
        price: 8.12,
        category: foodCategory.sides,
        availableAddons: [
          Addon(name: 'chips', price: 1.12),
          Addon(name: 'bread', price: 3.1)
        ]),
    Food(
        name: 'Teen ',
        describtion: ' teen  consists of teen',
        imagePath: 'images/sides/sides2.jpg',
        price: 9.12,
        category: foodCategory.sides,
        availableAddons: [
          Addon(name: 'chips', price: 1.12),
          Addon(name: 'bread', price: 3.1)
        ]),
    Food(
        name: 'chofan ',
        describtion: ' chofan  consists of chofan',
        imagePath: 'images/sides/sides5.jpg',
        price: 7.12,
        category: foodCategory.sides,
        availableAddons: [
          Addon(name: 'chips', price: 1.12),
          Addon(name: 'bread', price: 3.1)
        ]),
    //drinks
    Food(
        name: 'Orange juice ',
        describtion: ' Orange juice  consists of Orange and sugar and ice',
        imagePath: 'images/drinks/1.jpeg',
        price: 5.12,
        category: foodCategory.drinks,
        availableAddons: [
          Addon(name: 'cup', price: 1.12),
        ]),
    Food(
        name: 'Strawberry juice ',
        describtion: ' Strawberry juice consists of Strawberryand sugar',
        imagePath: 'images/drinks/5.jpg',
        price: 12.12,
        category: foodCategory.drinks,
        availableAddons: [
          Addon(name: 'cup', price: 1.12),
        ]),
    Food(
        name: 'Limonada juice ',
        describtion: ' Limonada  consists of limon juice',
        imagePath: 'images/drinks/3.jpg',
        price: 9.12,
        category: foodCategory.drinks,
        availableAddons: [
          Addon(name: 'cup', price: 1.12),
        ]),
    Food(
        name: 'Fresh juice ',
        describtion: ' consists of orange and banana juice',
        imagePath: 'images/drinks/2.jpg',
        price: 7.12,
        category: foodCategory.drinks,
        availableAddons: [
          Addon(name: 'cup', price: 1.12),
        ]),
  ];

  // getters
  List<Food> get menu => _menue;
  List<CartItem> get cart => _cart;

  // operations

  // user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item with the same food and with same addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food item is the same
      bool isSameFood = item.food == food;

      //check if the addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    //if item already exists,increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise add cartitem to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get number of items in cart
  int getTotalItemCount() {
    int totalitemCount = 0;
    for (CartItem cartItem in _cart) {
      totalitemCount += cartItem.quantity;
    }
    return totalitemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //helpers

  // generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln('Here is your Receipt.');
    receipt.writeln();

    // format the day to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd MM:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('------------------');
    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity}*${cartItem.food.name}-${_formatPrice(cartItem.food.price)}');
          if (cartItem.selectedAddons.isNotEmpty){
            receipt.writeln(' Addons: ${_formatAddons(cartItem.selectedAddons)}');
          }
          receipt.writeln();
    }
              receipt.writeln('--------------------------');
                        receipt.writeln();
          receipt.writeln('Total Items: ${getTotalItemCount()}');
                    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');
                    return receipt.toString();



  }

  //format double value into money
  String _formatPrice(double price) {
    return '\$ ${price.toStringAsFixed(2)}';
  }

  //formal list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name}${_formatPrice(addon.price)}')
        .join(",");
  }
}

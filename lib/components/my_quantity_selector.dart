import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.background
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //decrease button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(Icons.remove,
            color: Theme.of(context).colorScheme.primary,
            size: 20,),
          ),

          // quantity count 
          Padding(padding: EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 20,
            child: Center(
              child: Text(quantity.toString()),
            ),
          ),),

          // increase button
          GestureDetector(
            onTap: onIncrement,
            child: Icon(Icons.add,
            color: Theme.of(context).colorScheme.primary,
            size: 20,),
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/food_model.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const MyFoodTile({super.key, required this.food, required this.onTap});

  void onTapHandler() {
    if (onTap != null) {
      onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapHandler,
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // food text details
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,style: TextStyle(
                      // color:Colors.indigo[900],
                      fontWeight: FontWeight.w800,
                      fontSize: 17)),
                    Text('\$ ${food.price.toString()}',style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text(food.describtion,style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16))
                  ],
                )),
                SizedBox(width: 15,),
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagePath,height: 120,width: 90,)),
              ],
            ),
          ) ,
        ),
        //divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}

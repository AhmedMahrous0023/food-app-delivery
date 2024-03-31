import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurent_model.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.only(left: 25,right: 25,bottom: 25,top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your order!'),
            const SizedBox(height: 25,),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child:Consumer<Restaurent>(
                builder: (context, restaurent, child) =>Text(restaurent.displayCartReceipt()) ,
              ),
            ),
                        const SizedBox(height: 25,),
Text('Estimated Delivery Time is : 4.10 Pm')
          ],
        ),
      ),
    );
  }
}
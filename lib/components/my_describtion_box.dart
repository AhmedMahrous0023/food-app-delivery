import 'package:flutter/material.dart';

class MyDescribtionBox extends StatelessWidget {
  const MyDescribtionBox({super.key});
  
  @override
  Widget build(BuildContext context) {
    //text style
  TextStyle myPrimaryTextStyle =TextStyle(
    color: Theme.of(context).colorScheme.inversePrimary
  );
  TextStyle mySeconderyTextStyle =TextStyle(
    color: Theme.of(context).colorScheme.primary
  );
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary
          ),
          borderRadius: BorderRadius.circular(8)
        ),
         padding: EdgeInsets.all(25),
         margin: EdgeInsets.only(left: 25,right: 25,bottom: 25),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //delivery fee
            Column(
              children: [
                Text('\$ 0.99',style: myPrimaryTextStyle,),
                Text('Delivery Fee',style: mySeconderyTextStyle,)
              ],
            ),
                    //delivery time 
            Column(
              children: [
                Text('15-30 min',style: myPrimaryTextStyle,),
                Text('Delivery Time',style: mySeconderyTextStyle,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
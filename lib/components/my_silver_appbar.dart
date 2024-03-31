import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';

class MySilverAppbar extends StatelessWidget {
  final Widget child ;
  final Widget title ;

  const MySilverAppbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(onPressed: (){
          // navigate to cart page
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
        }, icon: Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Sunset Dinner'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding:const  EdgeInsets.only(right: 0,left: 0,top: 0),
        expandedTitleScale:1 ,
      ),
    );
  }
}
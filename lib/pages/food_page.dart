import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/models/restaurent_model.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool>selectedAddons ={};
   FoodPage({super.key, required this.food})

   {
    //initialize selected addon to be false
    for ( Addon addon in food.availableAddons) {
      selectedAddons[addon]=false;
      
    }
   }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method add to cart
   addToCart(Food food ,Map<Addon,bool>selectedaddons){
    //close the current food page to go back to menue
    Navigator.pop(context);

    // format the selected addons
    List<Addon>currentSelectedAddons=[];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon]==true){
        currentSelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Restaurent>().addToCart(food, currentSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold ui
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //food image
            Image.asset(widget.food.imagePath),
            //food name
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.food.name,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  // food price
                   Text('\$ ${widget.food.price.toString()}',style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary
                  ),),
                  const SizedBox(height: 10,),
                  //food describtion
                  Text(widget.food.describtion),
                                 const  SizedBox(height: 10,),
                                 Divider(
                                  color: Theme.of(context).colorScheme.secondary,
                                 ),
        
                  //addons
                  Text('Add-Ons',style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),),
                   const SizedBox(height: 10,),
        
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          //get individual addons
                          Addon addon = widget.food.availableAddons[index];
                                
                          //return checkbox ui
                          return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle:  Text('\$ ${addon.price.toString()}',style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon]=value!;
                                });
                              });
                        }),
                  ),
                  // button add to cart
                  MyButton(onTap: ()=>addToCart(widget.food,widget.selectedAddons), text: 'Add to cart'),
                  const SizedBox(height: 25,)
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    // button back
    SafeArea(
      child: Opacity(
        opacity: 0.6,
        child: Container(
          margin: EdgeInsets.only(left: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle
          ),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
      ),
    )
      ],
    );
  }
}

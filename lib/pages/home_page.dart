import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_describtion_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_silver_appbar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/models/restaurent_model.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: foodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // sort out and return food items that belongs to a specific category
  List<Food> _filterMenuByCategory(foodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given ctegory
  List<Widget> _getFoodinThisCategory(List<Food> fullMenu) {
    return foodCategory.values.map((category) {

      // get catgory menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            // get individual food
            final food = categoryMenu[index];

            // return foodtile ui
            return MyFoodTile(food: food, onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodPage(food: food,)));
            });
              });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                MySilverAppbar(
                    title: MyTabBar(tabController: _tabController),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // divider
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        //my current location
                        const MyCurrentLocation(),

                        //describtion
                        const MyDescribtionBox()
                      ],
                    ))
              ]),
          body: Consumer<Restaurent>(
            builder: (context, restaurant, child) =>TabBarView(
              controller: _tabController,
              children: _getFoodinThisCategory(restaurant.menu)) ,
          )),
    );
  }
}

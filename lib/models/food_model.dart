
//food items
class Food {
  final String name;
  final String describtion;
  final String imagePath;
  final double price;
  final foodCategory category ;
  final List<Addon>availableAddons ;


  Food(
      {required this.name,
      required this.describtion,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons
      
      });
}

//food category
enum foodCategory{
  Burger,
  salads,
  sides,
  desserts,
  drinks
}

//food addons
class Addon{
  String name ;
  double price ;
  Addon({required this.name,required this.price});
}

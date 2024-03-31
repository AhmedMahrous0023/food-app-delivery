import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title:const  Text('Your Location'),
              content:const TextField(
                decoration: InputDecoration(hintText: 'Search Address ..'),
              ),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child:const Text('Cancel'),
                ),
                //save button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child:const Text('Save'),
                )
              ],
            ));
  }

  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Text(
                  '6901 Hollywood Bly',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                //drop down menu
               const  Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}

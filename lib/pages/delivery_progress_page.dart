import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';
import 'package:food_delivery_app/models/restaurent_model.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get access to firestore
  final db =FirestoreService();

  @override
  void initState() {
    super.initState();
    // if we get this page submit the order to save in db
    String receipt =context.read<Restaurent>().displayCartReceipt();
    db.saveOrderToDb(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body:const  Column(
        children: [MyReceipt()],
      ),
    );
  }
}

// custom bottom Nav Bar - message/call delivery Driver

Widget _buildBottomNavBar(BuildContext context) {
  return Container(
    height: 100,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius:const  BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    child: Row(
      children: [
        // profile pic of driver
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person))),
        const SizedBox(
          width: 10,
        ),
        // driver details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed Mahrous',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              'Driver',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
// message button
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: Theme.of(context).colorScheme.primary,
                    ))),
            const SizedBox(
              width: 10,
            ),
// call button
            Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon:const  Icon(
                      Icons.call,
                      color: Colors.green,
                    ))),
          ],
        )
      ],
    ),
  );
}

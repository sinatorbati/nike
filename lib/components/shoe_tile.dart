import 'package:flutter/material.dart';
import 'package:nike/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  const ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
      ),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              shoe.imagePath,
            ),
          ),

          //description
          Text(
            shoe.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          //price and ditails
          Row(
            children: [
              Column(
                children: [Text(shoe.name), Text(shoe.price)],
              ),
              Icon(Icons.add),
            ],
          )
          //price
          //name
          //button
        ],
      ),
    );
  }
}

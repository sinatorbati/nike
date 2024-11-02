import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  const ShoeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

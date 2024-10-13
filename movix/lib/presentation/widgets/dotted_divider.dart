import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {

  const DottedDivider({ super.key });

   @override
   Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: List.generate(50, (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.grey : Colors.transparent,
            height: 1,
          ),
        )),
      ),
    );
  }
}
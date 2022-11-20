

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Icon icons;
  
 final void Function()? onPressed;

   const Buttons({
    super.key,
    required this.icons,
    
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icons,
      color: Colors.white,
      iconSize: 27,
    );
  }
}

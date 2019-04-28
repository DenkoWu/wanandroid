import 'package:flutter/material.dart';
class Intel{
  Widget MyInkWell( Widget child) {
   return Material(
     child: Ink(
       child:child,
     ),
   );
  }
}
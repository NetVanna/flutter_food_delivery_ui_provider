import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIconModel {
  final IconData unSelected, selected;

  BottomIconModel({required this.selected, required this.unSelected});
}

List<BottomIconModel> bottomIcons = [
  BottomIconModel(
    selected: Icons.home_filled,
    unSelected: Icons.home_outlined,
  ),
  BottomIconModel(
    selected: CupertinoIcons.chat_bubble_text_fill,
    unSelected: CupertinoIcons.chat_bubble_text,
  ),
  BottomIconModel(
    selected: CupertinoIcons.compass_fill,
    unSelected: CupertinoIcons.compass,
  ),
  BottomIconModel(
    selected: Icons.person_rounded,
    unSelected: Icons.person_outline_rounded,
  ),
];

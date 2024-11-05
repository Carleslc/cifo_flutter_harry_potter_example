import 'package:flutter/material.dart';

bool isLarge(double maxWeight) => maxWeight >= 600;

bool isWideScreen(BuildContext context) =>
    isLarge(MediaQuery.sizeOf(context).width);

bool isVertical(BuildContext context) =>
    MediaQuery.orientationOf(context) == Orientation.portrait;

import 'package:flutter/material.dart';

height(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}

width(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

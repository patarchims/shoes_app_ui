import 'package:flutter/material.dart';
import 'package:shoe_app_flutter/constat.dart';

class ShoeModel {
  final Color color;
  final String assetsImage;
  ShoeModel({
    required this.color,
    required this.assetsImage,
  });
}

class SizeShoe {
  final int size;
  final int stock;
  SizeShoe({
    required this.size,
    required this.stock,
  });
}

List<ShoeModel> listShoe = [
  ShoeModel(
      color: ColorConstant.blueColor, assetsImage: 'assets/blue_shoe.png'),
  ShoeModel(
      color: ColorConstant.yellowColor, assetsImage: 'assets/yellow_shoe.png'),
  ShoeModel(
      color: ColorConstant.greenColor, assetsImage: 'assets/green_shoe.png'),
];

List<SizeShoe> listSizeShoe = [
  SizeShoe(size: 6, stock: 10),
  SizeShoe(size: 7, stock: 7),
  SizeShoe(size: 8, stock: 8),
  SizeShoe(size: 9, stock: 10),
  SizeShoe(size: 10, stock: 13),
  SizeShoe(size: 11, stock: 0),
  SizeShoe(size: 12, stock: 6),
  SizeShoe(size: 13, stock: 0),
];

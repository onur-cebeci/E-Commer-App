import 'package:e_commer/models/api_services/products_model.dart';
import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.listIndex,
    required this.index,
  }) : super(key: key);

  final Products listIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(listIndex.img.toString()),
        ),
      ),
    );
  }
}

import 'package:e_commer/providers/bottom_navigator_widget_provider.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBarWidget extends StatelessWidget {
  const CustomNavigationBarWidget({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 12,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor,
                blurRadius: 4,
                spreadRadius: 1.2,
                blurStyle: BlurStyle.solid)
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              controller.jumpToPage(0);

              Provider.of<BottomNavigatorWidgetProvider>(context, listen: false)
                  .homePageIcon(true);
              Provider.of<BottomNavigatorWidgetProvider>(context, listen: false)
                  .categoryPageIcon(false);
            },
            child: Provider.of<BottomNavigatorWidgetProvider>(context).homeIcon,
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(1);

              Provider.of<BottomNavigatorWidgetProvider>(context, listen: false)
                  .homePageIcon(false);
              Provider.of<BottomNavigatorWidgetProvider>(context, listen: false)
                  .categoryPageIcon(true);
            },
            child: Provider.of<BottomNavigatorWidgetProvider>(context)
                .categoryIcon,
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(2);
            },
            child: const Icon(Icons.shopping_bag_outlined),
          ),
          InkWell(
            onTap: () {
              controller.jumpToPage(3);
            },
            child: const Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}

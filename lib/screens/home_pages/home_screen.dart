import 'package:e_commer/providers/bottom_navigator_widget_provider.dart';
import 'package:e_commer/screens/witgets/categories_menu_widget.dart';
import 'package:e_commer/screens/witgets/home_page_image_slider_widget.dart';
import 'package:e_commer/screens/witgets/random_image_witget.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: size.height - 100,
        child: Column(
          children: [
            CategoriesMenuWidget(),
            SizedBox(height: smallPadding),
            InkWell(
              onTap: () {
                controller.jumpToPage(1);

                Provider.of<BottomNavigatorWidgetProvider>(context,
                        listen: false)
                    .homePageIcon(false);
                Provider.of<BottomNavigatorWidgetProvider>(context,
                        listen: false)
                    .categoryPageIcon(true);
              },
              child: const HomePageImageSlider(),
            ),
            RandomImageWidget(
                title: 'Populer Products',
                subTitle: 'see all',
                controller: controller),
          ],
        ),
      ),
    );
  }
}

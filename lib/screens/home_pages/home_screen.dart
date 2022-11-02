import 'package:e_commer/screens/witgets/categories_menu_widget.dart';
import 'package:e_commer/screens/witgets/home_page_image_slider_widget.dart';
import 'package:e_commer/screens/witgets/random_image_witget.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: size.height - 100,
        child: Column(
          children: const [
            CategoriesMenuWidget(),
            SizedBox(height: smallPadding),
            HomePageImageSlider(),
            RandomImageWidget(),
          ],
        ),
      ),
    );
  }
}

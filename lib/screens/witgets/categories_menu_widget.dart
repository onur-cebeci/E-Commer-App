import 'package:e_commer/models/categories_model.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';

class CategoriesMenuWidget extends StatelessWidget {
  const CategoriesMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 5,
          child: GridView.builder(
              padding: const EdgeInsets.only(top: mediumPadding),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width < 1000 ? 70 : 110,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisExtent: size.width < 800 ? 50 : 90,
                  mainAxisSpacing: 10),
              itemCount: categoryList.length,
              itemBuilder: (_, index) {
                final itemIndex = categoryList[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: kSecondColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(itemIndex.icon),
                        const Spacer(),
                        Text(
                          itemIndex.categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 9,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

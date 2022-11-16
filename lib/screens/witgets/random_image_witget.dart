import 'package:e_commer/data/products_data.dart';
import 'package:e_commer/models/api_services/products_model.dart';
import 'package:e_commer/providers/bottom_navigator_widget_provider.dart';
import 'package:e_commer/screens/products_details_pages/details_page.dart';
import 'package:e_commer/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomImageWidget extends StatelessWidget {
  const RandomImageWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.controller,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: mediumPadding, left: 5, right: 5),
      height: size.height / 3.1,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {},
                child: subTitle.length > 2
                    ? InkWell(
                        onTap: () {
                          controller.jumpToPage(1);

                          Provider.of<BottomNavigatorWidgetProvider>(context,
                                  listen: false)
                              .homePageIcon(false);
                          Provider.of<BottomNavigatorWidgetProvider>(context,
                                  listen: false)
                              .categoryPageIcon(true);
                        },
                        child: Text(
                          subTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: kPrimaryColor, fontSize: 11),
                        ),
                      )
                    : Text(
                        subTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: kPrimaryColor, fontSize: 11),
                      ),
              ),
            ],
          ),
          SizedBox(
              height: (size.height / 3.1) / 1.5,
              child: FutureBuilder(
                future: ProductsApi().readProdutcsJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                      child: Text("${data.error}"),
                    );
                  } else if (data.hasData) {
                    var productsList = data.data as List<Products>;

                    productsList.shuffle();
                    return ListView.builder(
                      controller: ScrollController(keepScrollOffset: false),
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final listIndex = productsList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 650),
                                  pageBuilder: (context, animation, _) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: DetailsPage(
                                        product: listIndex,
                                      ),
                                    );
                                  }),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                  width: size.width / 2.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        listIndex.img,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        listIndex.modelName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: size.width / 2,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ],
      ),
    );
  }
}

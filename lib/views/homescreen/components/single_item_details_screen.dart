
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/router/app_route.dart';
import 'package:sippy/router/navigator.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/utils/constants/widget_extensions.dart';
import 'package:sippy/widget/app_container_widget.dart';
import 'package:sippy/widget/texts.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({super.key, this.editScreen, required this.product});
  final String? editScreen;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ContainerWidget(
        onTap: () {
          AppNavigator.of(context).navigate(
            ProductDetailsRoute(
              product: product,
              showCheckout: true,
            ),
          );
        },
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ContainerWidget(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: AssetImage(product.image), fit: BoxFit.cover),
                      color: appColors.black),
                ),
                Positioned(
                  right: 10,
                  top: 8,
                  child: ContainerWidget(
                    onTap: () {},
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: appColors.white),
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      color: appColors.danger,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            10.hi,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  product.name,
                  size: 12,
                  weight: FontWeight.w700,
                  color: appColors.black,
                ),
                NormalText(
                  product.description,
                  size: 10,
                  height: 12,
                  weight: FontWeight.w400,
                ),
                2.hi,
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/hanpickedItem.png'),
                              fit: BoxFit.cover)),
                    ),
                    4.wi,
                    NormalText(
                      'Chicken Republic',
                      size: 10,
                      color: appColors.grey,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                1.hi,
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/star.svg'),
                    2.wi,
                    NormalText(
                      '4.5',
                      size: 10,
                      color: appColors.grey,
                      weight: FontWeight.w400,
                    ),
                    4.wi,
                    CircleAvatar(
                      radius: 1,
                      backgroundColor: appColors.grey,
                    ),
                    6.wi,
                    SvgPicture.asset('assets/svgs/time-delivery.svg'),
                    3.wi,
                    NormalText(
                      '20-30min',
                      size: 10,
                      color: appColors.grey,
                    ),
                  ],
                ),
              ],
            ).padHorizontal(1),
            // ContainerWidget(

            //   decoration: BoxDecoration(
            //     color:  appColors.white,
            //                boxShadow: const [
            // BoxShadow(
            //   color: Color(0x8E009933),
            //   blurRadius: 39,
            //   offset: Offset(0, 0),
            //   spreadRadius: -14,
            //             ),],),
            //   padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            //   child: Column(
            //     children: [
            //                       10.hi,

            //       Row(
            //         children: [
            //           ContainerWidget(

            //             backgroundColor: Color(0xFFE7F6EC),
            //             borderColor: appColors.armyGreen,
            //             borderThickness: 1,
            //             hasBorder: true,
            //             borderRadius: BorderRadius.circular(8),
            //           height: 56,
            //           width: 119,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 GestureDetector(
            //                   onTap: () {
            //                     removeMoreItem();
            //                   },
            //                   child: Icon(
            //                     Icons.horizontal_rule,
            //                     color: appColors.armyGreen,
            //                     size: 20,
            //                   ),
            //                 ),
            //                 20.wi,
            //                 NormalText(
            //                   cartNumber.toString(),
            //                   color: appColors.black,
            //                   size: 22,
            //                   weight: FontWeight.w700,
            //                 ),
            //                 20.wi,
            //                 GestureDetector(
            //                   onTap: () {
            //                     addMoreItem();
            //                   },
            //                   child: Icon(
            //                     Icons.add,
            //                     color: appColors.armyGreen,
            //                     size: 20,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           16.wi,
            //           Expanded(
            //             child: ContainerWidget(
            //               backgroundColor: appColors.armyGreen,
            //               borderRadius: BorderRadius.circular(8),
            //               height: 56,
            //               child: Center(
            //                 child: NormalText(
            //                   widget.editScreen == 'update'
            //                       ? 'Upadte'
            //                       : 'Add to Cart',
            //                   size: 16,
            //                   weight: FontWeight.w700,
            //                   color: appColors.white,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ).padSymmetric(horizontal:20,),
            //     ],
            //   ),
            // ),
            20.hi,
          ],
        ),
      );
    });
  }
}

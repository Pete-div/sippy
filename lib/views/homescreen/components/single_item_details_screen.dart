import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/utils/constants/widget_extensions.dart';
import 'package:sippy/widget/app_container_widget.dart';
import 'package:sippy/widget/texts.dart';


class SingleItem extends StatefulWidget {
  const SingleItem({super.key, this.editScreen});
  final String? editScreen;
  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  int cartNumber = 1;
  void addMoreItem() {
    setState(() {
      cartNumber++;
    });
  }

  void removeMoreItem() {
    setState(() {
      if (cartNumber != 0) {
        cartNumber--;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Stack(
                  children: [
                        ContainerWidget(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/food-big.png'),
                              fit: BoxFit.cover),
                          color: appColors.black),
                    ),
                
                    Positioned(
                      right: 10,
                      top: 8,
                      child: ContainerWidget(
                        onTap: () {
                         Navigator.of(context).pop();
                        },
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: appColors.white),
                        child:  Icon(
                          Icons.favorite_border_rounded,
                          color: appColors.danger,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
          Expanded(
            child: ListView(
              children: [
              
                12.hi,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      'Chicken Pasta and salad indomie',
                      size: 14,
                      weight: FontWeight.w700,
                      color: appColors.black,
                    ),
                    10.hi,
                    const NormalText(
                      'Mixed with vegetables with avocado and cilantro, served with lemon herb',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    6.hi,
                    6.hi,
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/hanpickedItem.png'),
                                  fit: BoxFit.cover)),
                        ),
                        4.wi,
                        NormalText(
                          'Chicken Republic',
                          size: 13,
                          color: appColors.grey,
                          weight: FontWeight.w400,
                        ),
                        4.wi,
                        CircleAvatar(
                          radius: 1,
                          backgroundColor: appColors.grey,
                        ),
                        4.wi,
                        NormalText(
                          '\u20A6{234} sold',
                          size: 12,
                          color: appColors.greyFBFCFC,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    6.hi,
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/star.svg'),
                        2.wi,
                        NormalText(
                          '4.5',
                          size: 12,
                          color: appColors.grey,
                          weight: FontWeight.w400,
                        ),
                        6.wi,
                        CircleAvatar(
                          radius: 1,
                          backgroundColor: appColors.grey,
                        ),
                        6.wi,
                        SvgPicture.asset('assets/svgs/time-delivery.svg'),
                        6.wi,
                        NormalText(
                          '20-30min',
                          size: 14,
                          color: appColors.greyFBFCFC,
                        ),
                        6.wi,
                        CircleAvatar(
                          radius: 1,
                          backgroundColor: appColors.grey,
                        ),
                        6.wi,
                        SvgPicture.asset('assets/svgs/bicycle-order.svg'),
                        5.wi,
                        NormalText(
                          '\u20A6 3,500',
                          size: 14,
                          color: appColors.grey,
                        ),
                      ],
                    ),
                    12.hi,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          '\u20A6 63,2500',
                          color: appColors.armyGreen,
                          size: 18,
                          weight: FontWeight.w700,
                        ),
                        2.hi,
                        NormalText(
                          '\u20A6 43,540',
                          decoration: TextDecoration.lineThrough,
                          color: appColors.lightGrey,
                          size: 12,
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                  ],
                ).padHorizontal(20),
          
              ],
            ),
          ),
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
  }
}

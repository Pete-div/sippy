import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sippy/model/cart_model.dart';
import 'package:sippy/router/app_route.dart';
import 'package:sippy/router/navigator.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/view_models/cart_view_model.dart';
import 'package:sippy/widget/texts.dart';
import 'package:stacked/stacked.dart';
@RoutePage() 
class CartScreen extends StatelessWidget {
  const CartScreen({super.key,required this.model});
  final CartViewModel model;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const NormalText('shared Cart',size: 20,weight: FontWeight.w600,),surfaceTintColor: Colors.transparent,),
      body: SafeArea(child: CartList(vModel: model,)),);
  }
}


class CartList extends StatelessWidget {
  const CartList({super.key,required this.vModel});
final CartViewModel vModel;
  @override
  Widget build(BuildContext context)  {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                     const  NormalText('Subtotal',
                      size: 14,
                      weight: FontWeight.w400,
                        ),
                      
                      NormalText(
                         "${vModel.cartTotal}",
                          size: 14,
                         weight: FontWeight.w500,
                         color: appColors.black,
                          ),
                    ],
                  ),
                ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                    itemCount: vModel.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = vModel.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: CartItemTile(item: item),
                      );
                    },
                  ),
                ),
              ],
            );
        
     
  }
}

class CartItemTile extends StatelessWidget {
  final CartItem item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        builder: (context, model, child) {
        return CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
             AppNavigator.of(context).navigate(
                ProductDetailsRoute(
                  product: item.product,
                  showCheckout: true,
                ),
              );
            },
            // height: 200,
            child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: Row(children: [
                  10.0.wi,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox.square(
                          dimension: 80,
                          child: Image.asset(item.product.image,
                              fit: BoxFit.cover)),
                    ),
                  ),
                  10.0.wi,
                  Expanded(
                      child: Column(
                    children: [
                      10.0.hi,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                             ),
                          NormalText(
                               '${item.product.amount}',
                              size: 16,
                             color: appColors.primary,),
                        
                        ],
                      ),
                      4.hi,
                      Divider(
                          height: 1, color: appColors.primary, thickness: 0.1),
                                                2.hi,

                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            child: ElevatedButton(
                              onPressed: item.quantity > 1
                                  ? () {
                                    //   context.read<CartCubit>().add(item.copyWith(
                                    //       units: max(1, item.units - 1)));
                                     }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appColors.primary,
                                  shape: const CircleBorder()),
                              child: Icon(Icons.remove,
                                  size: 20, color: appColors.icon),
                            ),
                          ),
                          // 10.0.w,
                          NormalText(item.quantity.toString(),
                          color: appColors.primary,
                             ),
                          SizedBox(
                            height: 20,
                            child: ElevatedButton(
                              onPressed: () {
                                // context
                                //     .read<CartCubit>()
                                //     .add(item.copyWith(units: item.units + 1));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appColors.primary,
                                  shape: const CircleBorder()),
                              child: Icon(Icons.add,
                                  size: 20, color: appColors.icon),
                            ),
                          ),
                       
                          CupertinoButton(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 4.0, bottom: 4.0),
                            onPressed: () {
                             model.removeFromCart(item);
                            },
                            child:
                                // Row(
                                //   children: [
                                Icon(Icons.delete),
                            // Icon(Icons.delete,
                            //     color: context.primaryColor, size: 17),
                            // 10.0.w,
                            // Text('Remove',
                            //     style: context.bodySmall?.copyWith(
                            //         fontSize: 12,
                            //         fontWeight: FontWeight.w500,
                            //         color: context.primaryColor))
                            // ],
                            // ),
                          ),
                        ],
                      ),
                      10.wi,
                                            4.hi,

                      NormalText('Created by: ${item.addedBy}',
                          color: appColors.primary,
                             ),
                                         4.hi,

                   ],
                  )),
                  10.0.wi,
                ])));
      }
    );
  }
}

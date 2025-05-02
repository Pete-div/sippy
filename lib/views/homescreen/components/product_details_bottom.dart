import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/router/app_route.dart';
import 'package:sippy/router/navigator.dart';
import 'package:sippy/utils/locator.dart';
import 'package:sippy/utils/share_preference.dart';
import 'package:sippy/view_models/cart_view_model.dart';
import 'package:sippy/view_models/product_view_model.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/widget/app_dialog.dart';
import 'package:sippy/widget/texts.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsBottom extends StatelessWidget {
  final Product product;
  final bool showCheckout;
  final int quantity;
  const ProductDetailsBottom(
      {super.key,
      required this.product,
      this.showCheckout = true,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
        builder: (context, model, child) {
          return SizedBox(
              height: 130,
              child: Material(
                color: appColors.grey,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0, right: 12.0),
                    child: Row(
                      children: [
                        8.0.wi,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      model.removeMoreItem();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: appColors.icon,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    child: Icon(Icons.remove,
                                        size: 20, color: appColors.aiDeepRed),
                                  ),
                                ),
                                2.0.wi,
                                SizedBox(
                                  height: 20,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      model.addMoreItem();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: appColors.icon,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    child: Icon(Icons.add,
                                        size: 20, color: appColors.armyGreen),
                                  ),
                                ),
                              ],
                            ),
                            4.0.hi,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NormalText(
                                "${model.cartNumber} x ${product.amount}",
                                size: 24,
                              ),
                            ),
                            2.0.hi,
                            if (model.cartNumber != 0)
                              Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: NormalText(
                                    "SubTotal: ${formatNaira(model.cartNumber * product.amount)}",
                                    size: 20,
                                    color: appColors.black282828,
                                  )),
                          ],
                        ),
                        const Spacer(),
                        if (model.cartNumber != 0)
                          GestureDetector(
                            onTap: () async {
                             
                            },
                            child: CartDetails(
                                function: () async {

                                  String currentUserId = await LocalUserService
                                      .getOrCreateUserId();
                                  if (model.cartViewModel.currentSessionId ==
                                      null) {
                                      model.cartViewModel.addToCart(
                                  quantity:  model.cartNumber,
                                  createdBy:  currentUserId,
                                      friends: [],
                                  
                                      product: product,);
                                  final rootContext = context;
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    showDialog(
                                      context: rootContext,
                                      builder: (dialogContext) => AppDialog(
                                        title: 'Added to Cart',
                                        message:
                                            'Checkout or Continue Shopping',
                                        actions: [
                                          DialogAction(title: 'Cancel'),
                                          DialogAction(
                                            title: 'Checkout',
                                            onPressed: (_) {
                                              Navigator.of(dialogContext)
                                                  .pop(); // Close the dialog first
                                              AppNavigator.of(rootContext)
                                                  .navigate( CartRoute(model: serviceLocator<CartViewModel>()));
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                  }
                               
                                },
                                showCheckout: showCheckout,
                                quantity: model.cartNumber,
                                product: product),
                          ),
                        2.0.wi,
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}

class CartDetails extends StatelessWidget {
  final int quantity;
  final Product product;
  final bool showCheckout;
  final Function() function;
  const CartDetails(
      {super.key,
      required this.quantity,
      required this.product,
      required this.function,
      required this.showCheckout});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: appColors.primary, shape: const CircleBorder()),
        child: Row(
          children: [
            SizedBox.square(
                dimension: 19,
                child: SvgPicture.asset(
                  'assets/svgs/shopping-cart.svg',
                  // ignore: deprecated_member_use
                  color: appColors.white,
                )),
            NormalText(
              quantity.toString(),
              color: appColors.white,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sippy/model/product_model.dart';
import 'package:sippy/view_models/product_view_model.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/num_extensions.dart';
import 'package:sippy/views/homescreen/components/product_details_bottom.dart';
import 'package:sippy/widget/texts.dart';
import 'package:stacked/stacked.dart';

@RoutePage() 
class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final bool showCheckout;
  final String name;

  const ProductDetailsScreen(
      {super.key, required this.product, this.showCheckout = true,required this.name});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
       
        builder: (context, model, child) {
        return Scaffold(
             appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
                title:  NormalText(product.name,color: appColors.black,size: 16,weight: FontWeight.w800),
              ),
          backgroundColor: appColors.white,
          bottomNavigationBar:
              ProductDetailsBottom(product: product, showCheckout: showCheckout,quantity:model.cartNumber,)
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 500.ms)
                  .slideY(duration: 400.ms, delay: 500.ms, begin: 1),
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset(
                 product.image,
                 fit: BoxFit.cover,
              ),
              20.0.hi,
          
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(product.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  )),
        
              14.0.hi,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(bottom: 6),
                  child: const NormalText(
                    'Description',
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: NormalText(
                    product.description,
                                        weight: FontWeight.w600,

                  )),
                     8.0.hi,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0)
                      .copyWith(bottom: 6),
                  child: const NormalText(
                    'Price',
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: NormalText(
                    "${product.amount}",
                    weight: FontWeight.w700,
                  )),
              10.0.hi,
            ],
          ),
        );
      }
    );
  }
}

class ProductDepailsPopup extends StatelessWidget {
  final Product product;
  const ProductDepailsPopup({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          color: appColors.lightRed,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.0.hi,
                    const NormalText('Product Details',),
                    40.0.hi,
                   
                    40.0.hi
                  ],
                ),
              ),
              const Positioned(right: 10, top: 10, child: CloseButton())
            ],
          ),
        ));
  }
}

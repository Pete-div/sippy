import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sippy/view_models/product_view_model.dart';
import 'package:sippy/utils/colors.dart';
import 'package:sippy/utils/constants/widget_extensions.dart';
import 'package:sippy/views/homescreen/components/single_item_details_screen.dart';
import 'package:sippy/widget/texts.dart';
import 'package:stacked/stacked.dart';
@RoutePage() 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
       
        builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
            title:  NormalText('Shop With Friends',color: appColors.black,size: 16,weight: FontWeight.w800),
          ),
          body:  GridView.builder(
                itemCount: model.products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
                     mainAxisExtent: 200,
                    mainAxisSpacing: 1,
                              maxCrossAxisExtent: 189,
                    crossAxisSpacing: 16),
                itemBuilder: (BuildContext context, int index) {
                  return  SingleItem(product: model.products[index],);
                },
              ).padHorizontal(8),
            
        );
      }
    );

  }
}
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sippy/views/homescreen/components/single_item_details_screen.dart';
@RoutePage() 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text('Shop With Friends'),
      ),
      body:  GridView.builder(
            itemCount: 30,
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return const SingleItem();
            },
          ),
        
    );

  }
}
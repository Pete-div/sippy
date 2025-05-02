// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sippy/view_models/cart_view_model.dart';


final GetIt serviceLocator = GetIt.I;

Future locatorSetup() async {


  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.registerLazySingleton(() => CartViewModel());



}

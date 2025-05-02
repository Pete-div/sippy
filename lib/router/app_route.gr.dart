// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CartScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InviteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InviteScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailsScreen(
          key: args.key,
          product: args.product,
          showCheckout: args.showCheckout,
          name: args.name,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductScreen(),
      );
    },
    SharedCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SharedCartScreen(),
      );
    },
  };
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<CartRouteArgs> {
  CartRoute({
    Key? key,
    required CartViewModel model,
    List<PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<CartRouteArgs> page = PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final CartViewModel model;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InviteScreen]
class InviteRoute extends PageRouteInfo<void> {
  const InviteRoute({List<PageRouteInfo>? children})
      : super(
          InviteRoute.name,
          initialChildren: children,
        );

  static const String name = 'InviteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    Key? key,
    required Product product,
    bool showCheckout = true,
     String? name,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
            showCheckout: showCheckout,
            name: name ??'',
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const PageInfo<ProductDetailsRouteArgs> page =
      PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.product,
    this.showCheckout = true,
    required this.name,
  });

  final Key? key;

  final Product product;

  final bool showCheckout;

  final String name;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product, showCheckout: $showCheckout, name: $name}';
  }
}

/// generated route for
/// [ProductScreen]
class ProductRoute extends PageRouteInfo<void> {
  const ProductRoute({List<PageRouteInfo>? children})
      : super(
          ProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SharedCartScreen]
class SharedCartRoute extends PageRouteInfo<void> {
  const SharedCartRoute({List<PageRouteInfo>? children})
      : super(
          SharedCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'SharedCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

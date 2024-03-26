// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:milk_points/data/models/customer_model.dart' as _i5;
import 'package:milk_points/presentation/page/customer_detail_page/cusomter_detail_page.dart'
    deferred as _i1;
import 'package:milk_points/presentation/page/home_page/home_page.dart'
    deferred as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CustomerDetailRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<CustomerDetailRouteArgs>(
          orElse: () =>
              CustomerDetailRouteArgs(customer: null));
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.CustomerDetailPage(
            key: args.key,
            customer: args.customer,
          ),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.HomePage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CustomerDetailPage]
class CustomerDetailRoute extends _i3.PageRouteInfo<CustomerDetailRouteArgs> {
  CustomerDetailRoute({
    _i4.Key? key,
    required _i5.CustomerModel? customer,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CustomerDetailRoute.name,
          args: CustomerDetailRouteArgs(
            key: key,
            customer: customer,
          ),
          rawQueryParams: {'customer': customer},
          initialChildren: children,
        );

  static const String name = 'CustomerDetailRoute';

  static const _i3.PageInfo<CustomerDetailRouteArgs> page =
      _i3.PageInfo<CustomerDetailRouteArgs>(name);
}

class CustomerDetailRouteArgs {
  const CustomerDetailRouteArgs({
    this.key,
    required this.customer,
  });

  final _i4.Key? key;

  final _i5.CustomerModel? customer;

  @override
  String toString() {
    return 'CustomerDetailRouteArgs{key: $key, customer: $customer}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

import 'package:coba1/src/core/routeing/route.dart';
import 'package:coba1/src/core/viewmodel/checkout/checkout_vm.dart';
import 'package:coba1/src/ui/add_produk/add_produk_view.dart';
import 'package:coba1/src/ui/checkout/checkout_view.dart';
import 'package:coba1/src/ui/history/history_view.dart';
import 'package:coba1/src/ui/home/home_view.dart';
import 'package:coba1/src/ui/payment/payment_view.dart';
import 'package:coba1/src/ui/qris/qris.view.dart';
import 'package:coba1/src/ui/summary/ringkasan_produk/ringkasan_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    MaterialPageRoute<T>? buildRoute<T>({
      required Widget Function(BuildContext) builder,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      );
    }

    bool argsIsInvalid = false;

    switch (settings.name) {
      case Routes.home:
        return buildRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.checkout:
        return buildRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => CheckoutViewModel(
              subtotal: 0,
              totalDiscount: 0,
              totalPrice: 0,
              totalItems: 0,
            ),
            child: const CheckoutPage(
              selectedProducts: [],
            ),
          ),
        );
      case Routes.payment:
        return buildRoute(
          builder: (_) => const PaymentPage(),
        );
      case Routes.history:
        return buildRoute(
          builder: (_) => const HistoryPage(),
        );

      case Routes.qris:
        return buildRoute(
          builder: (_) => const QRISView(),
        );
      case Routes.ringkasanProduk:
        return buildRoute(
          builder: (_) =>  BestSellingProductsPage(),
        );
      case Routes.addProduk:
        return buildRoute(
          builder: (_) =>  AddProductScreen(),
        );

      default:
        return null;
    }
  }
}

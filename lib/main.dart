import 'package:coba1/router.dart';
import 'package:coba1/src/core/viewmodel/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/ui/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        // Tambahkan provider lain di sini jika diperlukan
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        onGenerateRoute: AppRouter.generateRoute,
        navigatorObservers: [routeObserver],
        home: const HomePage(),
      ),
    );
  }
}

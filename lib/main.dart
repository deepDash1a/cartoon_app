import 'package:cartoon_app/app_router.dart';
import 'package:cartoon_app/core/colors.dart';
import 'package:cartoon_app/logic/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(CartoonApp(router: AppRouter()));
}

class CartoonApp extends StatelessWidget {
  const CartoonApp({
    super.key,
    required this.router,
  });

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartoon App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.myBaseColor3,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          color: AppColor.myBaseColor3,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}

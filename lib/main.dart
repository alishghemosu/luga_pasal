import 'package:eshop/service%20or%20provider/cart_provider.dart';
import 'package:eshop/views/cart%20screen/cart_scren.dart';
import 'package:eshop/views/home%20screen/home_page.dart';
import 'package:eshop/service%20or%20provider/liked_state_provider.dart';
import 'package:eshop/service%20or%20provider/log_in_provider.dart';
import 'package:eshop/service%20or%20provider/product_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ClothingShoppingApp());
}

class ClothingShoppingApp extends StatelessWidget {
  const ClothingShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProductListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/cart': (context) => const CartScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Cloth Shopping',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
      ),
    );
  }
}

import 'package:crafty_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const .symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ProductSearchBar(),
            const SizedBox(height: 16),
            HomeCarouselSlider(),
          ],
        ),
      ),
    );
  }
}

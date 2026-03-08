import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_product_list.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/section_header.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const .symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Categories', onTapSeeAll: () {}),
              const SizedBox(height: 8),
              HomeCategoryList(),
              SectionHeader(title: 'Popular', onTapSeeAll: () {}),
              HomeProductList(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Special', onTapSeeAll: () {}),
              HomeProductList(),
              const SizedBox(height: 16),
              SectionHeader(title: 'New', onTapSeeAll: () {}),
              HomeProductList(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) => _selectedPage.value = index,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: .symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: .circular(8),
                  ),
                  alignment: .center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _selectedPage,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: .center,
              spacing: 4,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value == i
                          ? AppColors.themeColor
                          : Colors.transparent,
                      border: Border.all(
                        color: value == i ? AppColors.themeColor : Colors.grey,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

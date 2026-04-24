import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _selectedPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) => _selectedPage.value = index,
          ),
          items: widget.images.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withAlpha(100),
                  child: AppNetworkImage(
                    url: url,
                    fit: .fitHeight,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedPage,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  for (int i = 0; i < widget.images.length; i++)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: value == i ? AppColors.themeColor : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

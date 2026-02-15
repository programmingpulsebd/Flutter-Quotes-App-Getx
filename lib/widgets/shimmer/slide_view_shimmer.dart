import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SlideViewShimmer extends StatelessWidget {
  const SlideViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
          highlightColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          child:  Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 150,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        autoPlay: true,
      ),
    );
  }
}

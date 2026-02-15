import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerGrid extends StatelessWidget {
  const CategoryShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 13,
        crossAxisSpacing: 13,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
          highlightColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );

      },
    );
  }
}

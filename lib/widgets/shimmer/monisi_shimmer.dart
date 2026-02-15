import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MonisiShimmer extends StatelessWidget {
  const MonisiShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4);
    final highlightColor = Theme.of(context).colorScheme.surface.withOpacity(0.2);

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: baseColor,
                    shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: CircleAvatar(

                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 60,
                  height: 10,
                  decoration: BoxDecoration(
                    color: baseColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

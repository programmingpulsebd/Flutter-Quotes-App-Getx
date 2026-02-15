import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/api/api_url.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../controller/slide_controller/slider_controller.dart';
import '../../widgets/shimmer/slide_view_shimmer.dart';

class SliderView extends StatelessWidget {
  final SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return SlideViewShimmer();
      }

      if (controller.images.isEmpty) {
        return Center(child: Text("No Images Found"));
      }

      return CarouselSlider(
        items: controller.images
            .map((imageUrl) => sliderCard("${ApiUrl.slider_image_url}$imageUrl"))
            .toList(),
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          viewportFraction: 0.85,
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollPhysics: BouncingScrollPhysics(),
        ),
      );
    });
  }



  Widget sliderCard(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }

}

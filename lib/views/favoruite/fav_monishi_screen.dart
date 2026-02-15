import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favourite_controller/monishi_favourite_controller.dart';
import '../../constants/helper/helper.dart';

class FavMonishiScreen extends StatelessWidget {
  FavMonishiScreen({super.key});

  final MonishiFavouriteController favController = Get.put(MonishiFavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (favController.favouriteQuotes.isEmpty) {
          return Center(
            child: Text("no_favourite_quotes".tr),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: favController.favouriteQuotes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final quote = favController.favouriteQuotes[index];

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.format_quote,
                          color: Theme.of(context).primaryColor, size: 28),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          quote,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 0.5),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _actionButton(
                        context,
                        icon: Icons.copy,
                        label: "copy".tr,
                        onTap: () => Helper.copyQuote(quote),
                      ),
                      _actionButton(
                        context,
                        icon: Icons.favorite,
                        label: "remove".tr,
                        onTap: () {
                          favController.toggleFavourite(quote);
                        },
                      ),
                      _actionButton(
                        context,
                        icon: Icons.share,
                        label: "share".tr,
                        onTap: () => Helper.shareQuote(quote),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  Widget _actionButton(BuildContext context,
      {required IconData icon,
        required String label,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.15),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 6),
          Text(label),
        ],
      ),
    );
  }
}

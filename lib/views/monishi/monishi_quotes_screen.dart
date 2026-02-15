import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/controller/favourite_controller/monishi_favourite_controller.dart';
import 'package:get/get.dart';
import '../../constants/helper/helper.dart';
import '../../controller/monishi_controller/monishi_controller.dart';

class MonishiQuotesScreen extends StatelessWidget {
  final String monishiId;
  final String monishiName;

  final MonishiController controller = Get.find<MonishiController>();
  final MonishiFavouriteController favController = Get.put(MonishiFavouriteController());

  MonishiQuotesScreen({
    super.key,
    required this.monishiId,
    required this.monishiName,
  }) {
    controller.quotes_list.clear();
    controller.fethchQuote(monishiId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monishiName),
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.quotes_list.isEmpty) {
          return const Center(child: Text("No Quote Found"));
        }

        return ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: controller.quotes_list.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final quote = controller.quotes_list[index];

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.4),
                  ],
                ),
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
                          quote.quote ?? "No quote available",
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
                        onTap: () => Helper.copyQuote(quote.quote ?? ""),
                      ),
                      Obx(() {
                        bool isFav = favController.isFavourite(quote.quote ?? "");
                        return _actionButton(
                          context,
                          icon: isFav ? Icons.favorite : Icons.favorite_border,

                          label: "favourite".tr,
                          onTap: () => favController.toggleFavourite(quote.quote ?? ""),
                        );
                      }),

                      _actionButton(
                        context,
                        icon: Icons.share,
                        label: "share".tr,
                        onTap: () => Helper.shareQuote(quote.quote ?? ""),
                      ),
                    ],
                  )
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

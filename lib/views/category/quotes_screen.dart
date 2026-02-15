import 'package:flutter/material.dart';
import 'package:flutter_quotes_app_getx/constants/helper/helper.dart';
import 'package:flutter_quotes_app_getx/controller/quote_controller/quote_controller.dart';
import 'package:get/get.dart';

import '../../controller/favourite_controller/category_favourite_controller.dart';

class QuotesScreen extends StatelessWidget {
  final String categoryId;
  String name;
  final QuoteController quoteController = Get.put(QuoteController());
  final CategoryFavouriteController controller = Get.put(CategoryFavouriteController());


  QuotesScreen({super.key, required this.categoryId,required this.name}) {
    quoteController.fetchQuote(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Obx(() {
        if (quoteController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (quoteController.quoteList.isEmpty) {
          return Center(
            child: Text(
              "No Quotes Found".tr,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

          );
        }

        return ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: quoteController.quoteList.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            final quote = quoteController.quoteList[index];

            return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
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
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          quote.quoteText ?? "No quote available",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Divider(thickness: 0.5),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _actionButton(
                        context,
                        icon: Icons.copy,
                        label: "copy".tr,

                        onTap: () => Helper.copyQuote(quote.quoteText ?? ""),
                      ),
                      Obx( () {

                        bool isFavourite = controller.isFav(
                            quote.quoteText ?? "");

                        return _actionButton(
                          context,
                          icon: isFavourite ?  Icons.favorite : Icons.favorite_outline,
                          label: "favourite".tr,
                          onTap: () {

                           controller.toggleFav(quote.quoteText ?? "");

                          },
                        );

                      }),
                      _actionButton(
                        context,
                        icon: Icons.share,
                        label: "share".tr,
                        onTap: () => Helper.shareQuote(quote.quoteText ?? ""),
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
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.15),
            child: Icon(icon,
                color: Theme.of(context).colorScheme.primary, size: 22),
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );



  }


}

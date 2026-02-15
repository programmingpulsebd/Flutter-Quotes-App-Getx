import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdController extends GetxController {
  Rx<BannerAd?> bannerAd = Rx<BannerAd?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAdUnitId();
    });
  }

  /// PHP সার্ভার থেকে Ad Unit ID নিয়ে আসা
  void fetchAdUnitId() async {
    try {
      final response = await http.get(Uri.parse('https://programmingpulse.xyz/quotes_app_api/api/v1/ads/get_banner_ads.php'));
      final data = json.decode(response.body);

      if (data['status'] == 'success') {
        final adUnitId = data['ad_unit_id'];
        loadAdaptiveBannerAd(adUnitId);
      } else {
        print("Error fetching ad: ${data['message']}");
      }
    } catch (e) {
      print("Exception fetching ad: $e");
    }
  }

  /// অ্যাড লোড করা
  void loadAdaptiveBannerAd(String adUnitId) async {
    final context = Get.context;
    if (context == null) return;

    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) return;

    final ad = BannerAd(
      adUnitId: adUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Banner Loaded");
          bannerAd.value = ad as BannerAd;
          isLoading.value = false;
        },
        onAdFailedToLoad: (ad, error) {
          print("Banner Failed: $error");
          ad.dispose();
          isLoading.value = false;
        },
      ),
    );

    await ad.load();
  }
}

import 'package:get/get.dart';
import '../../services/slider_service/slider_service.dart';

class SliderController extends GetxController {
  var isLoading = true.obs;
  var images = <String>[].obs;

  final SliderService service = SliderService();

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  void fetchImages() async {
    try {
      isLoading(true);
      final fetchedImages = await service.fetchImages();
      images.value = fetchedImages;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}

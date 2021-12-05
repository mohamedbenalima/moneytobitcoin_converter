import 'package:bitcoinconverter/model/conversion_data.dart';
import 'package:bitcoinconverter/services/app_services.dart';
import 'package:get/get.dart';

class ConversionController extends GetxController {
  var isLoading = false.obs;
  var isError = false.obs;

  var usdAmount = 0.0.obs;
  var euroAmount = 0.0.obs;
  var gbpAmount = 0.0.obs;

  var service = AppServices();
  var data;
  @override
  void onInit() {
    getPrices();
    // TODO: implement onInit
    super.onInit();
  }

  usdToBitcoin(value) {
    usdAmount((1 / data.usdPrice) * value);
  }

  euroToBitcoin(value) {
    euroAmount((1 / data.euroPrice) * value);
  }

  poundToBitcoin(value) {
    gbpAmount((1 / data.gbpPrice) * value);
  }

  getPrices() async {
    try {
      isLoading(true);
      data = await service.getPrices();
      print(data);
      update();
    } catch (e) {
      print(e);
      Get.snackbar("oops!", "we have some problems to fetch data");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:get/get.dart';

class CODInfoController extends GetxController {
  void onAgreeCOD() {
    // Tambahkan logika saat pengguna menyetujui penggunaan COD
    Get.snackbar("Success", "You agreed to use COD.");
  }
}

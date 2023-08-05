import 'package:get/get.dart';

SnackbarController snackbarWidget({
  required String title,
  required String message,
}) {
  return Get.snackbar(title, message);
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputController extends GetxController {
  final formKey = GlobalKey<FormState>();

  validatePhoneNum(dynamic pNum) {
    if (!GetUtils.isPhoneNumber(pNum ?? '')) {
      return 'This is not a valid phone number.';
    }
    return null;
  }

  validateEmail(dynamic pNum) {
    if (!GetUtils.isEmail(pNum ?? '')) {
      return 'This is not a valid phone number.';
    }
    return null;
  }

  String? validateRequiredField(dynamic text) {
    if (GetUtils.isNullOrBlank(text ?? " ") == true) {
      return "This is a required field";
    }
    return null;
  }

  onSave() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Draft saved successfuly",
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
    } else {
      Get.snackbar(
        "Fail",
        "There are incomplete fields",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}

class FilePickerController extends GetxController {
  Rx<FilePickerResult?> result = Rx<FilePickerResult?>(null);

  void pickFile() async {
    FilePickerResult? pickedResult = await FilePicker.platform.pickFiles();
    result.value = pickedResult;
    print(result.value);
  }
}

import 'dart:io';

import 'package:erp_homepage/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:file_picker/file_picker.dart';

class Dropdown extends StatelessWidget {
  Dropdown({
    super.key,
    required this.boxName,
    required this.requiredBox,
    required this.items,
  });
  final String boxName;
  final bool requiredBox;
  final List<dynamic> items;
  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredBox ? Text("$boxName*") : Text(boxName),
        SizedBox(
          height: 14,
        ),
        CustomDropdown(
          items: items,
          onChanged: null,
          hintText: "Please Select",
          decoration: CustomDropdownDecoration(
            closedBorderRadius: BorderRadius.circular(10),
            closedBorder: Border.all(color: Colors.black),
            expandedBorderRadius: BorderRadius.circular(10),
            expandedBorder: Border.all(color: Colors.indigo),
          ),
          validator: (text) => controller.validateRequiredField(text),
        ),
      ],
    );
  }
}

class Dropdown2 extends StatelessWidget {
  Dropdown2({
    super.key,
    required this.boxName,
    required this.requiredBox,
    required this.items,
  });
  final String boxName;
  final bool requiredBox;
  final List<DropdownMenuItem<dynamic>> items;
  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: items.first,
      items: items,
      onChanged: null,
    );
  }
}

class TextEntryBox extends StatelessWidget {
  TextEntryBox({
    super.key,
    required this.boxName,
    required this.requiredBox,
  });
  final String boxName;
  final bool requiredBox;

  final InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width / 3,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          requiredBox ? Text("$boxName*") : Text(boxName),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Enter here",
                suffixIcon: Icon(Icons.edit_outlined),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.indigo))),
            validator: (text) => controller.validateRequiredField(text),
          ),
        ],
      ),
    );
  }
}

class FilePickerBox extends StatelessWidget {
  FilePickerBox({
    super.key,
    required this.boxName,
    required this.requiredBox,
  });
  final String boxName;
  final bool requiredBox;
  final FilePickerController controller = Get.find<FilePickerController>();

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          requiredBox ? Text("$boxName*") : Text(boxName),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => GestureDetector(
              onTap: controller.pickFile,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                height: 57, // !!! could cause problems,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      () {
                        if (controller.result.value == null) {
                          return const Text(
                            "Only pdf,jpg",
                            style: TextStyle(color: Colors.grey),
                          );
                        } else {
                          return Text(
                              controller.result.value!.files.first.name);
                        }
                      }(),
                      const Icon(Icons.upload_file_outlined)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

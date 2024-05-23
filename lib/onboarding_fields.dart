import 'package:flutter/material.dart';

class TextEntryBox extends StatelessWidget {
  const TextEntryBox({
    super.key,
    required this.boxName,
    required this.requiredBox,
  });
  final String boxName;
  final bool requiredBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          () {
            if (requiredBox) {
              return Text("$boxName*");
            } else {
              return Text(boxName);
            }
          }(),
          SizedBox(
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
            validator: (value) {
              if (requiredBox) {
                if (value == null || value.isEmpty) {
                  return "This field cannot be empty";
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_template_app/utils/extensions.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.title,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
    this.txtFieldKey,
  });
  final TextEditingController? controller;
  final String hintText;
  final String title;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final Key? txtFieldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          key: txtFieldKey,
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }
}

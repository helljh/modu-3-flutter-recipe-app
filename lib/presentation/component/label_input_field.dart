import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class LabelInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final Function(String)? onValueChange;
  const LabelInputField({
    super.key,
    required this.label,
    required this.placeholder,
    this.value,
    this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: value ?? '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 55,
          child: TextField(
            controller: controller,
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: placeholder,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorStyles.gray4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: ColorStyles.primary80),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

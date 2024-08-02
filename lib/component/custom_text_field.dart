import 'package:calendar_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.isTime,
      required this.onSaved,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            cursorColor: Colors.grey,
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            keyboardType:
                isTime ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTime
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade300,
              suffixText: isTime ? '시' : null,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class FieldTile extends StatelessWidget {
  final String label;
  final String description;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function onChanged;
  final bool obscure;
  final bool isOk;
  final String errorText;
  final List<TextInputFormatter> formatters;

  FieldTile(
      {@required this.label,
      this.description,
      this.controller,
      this.placeholder,
      this.keyboardType,
      this.onChanged,
      this.obscure,
      this.isOk,
      this.errorText,
      this.formatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SimpleText(
          label,
          size: 16,
          color: Colors.grey[700],
          bold: true,
          align: TextAlign.left,
          padding: EdgeInsets.only(top: 8),
        ),
        SimpleText(
          description ?? '',
          size: 12,
          color: Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          inputFormatters: formatters,
          style: TextStyle(fontSize: 16),
          obscureText: obscure ?? false,
          decoration: InputDecoration(
            hintText: placeholder,
            errorText: errorText,
            suffixIcon: suffixChecker,
            contentPadding: EdgeInsets.all(14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            isDense: true,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget get suffixChecker {
    if (isOk == null) {
      return null;
    }

    return Icon(
      isOk ? Icons.check_circle_rounded : Icons.error,
      color: isOk ? Colors.green : Colors.red,
      size: 26,
    );
  }
}

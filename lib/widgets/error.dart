import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class ErrorBox extends StatelessWidget {
  final String message;

  ErrorBox(this.message);

  @override
  Widget build(BuildContext context) {
    if (message == null || message.isEmpty) {
      return Container();
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: SimpleText(
              'Oops! $message',
              size: 14,
              bold: true,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

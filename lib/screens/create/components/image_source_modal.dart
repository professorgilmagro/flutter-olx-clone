import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class ImageSourceModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return _buildForAndroid();
    }

    return _buildForIOS(context);
  }

  _buildForAndroid() => BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: null,
              child: TextSubtitle(
                'Câmera',
                color: Theme.of(context).primaryColor,
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: null,
              child: TextSubtitle(
                'Galeria',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      );

  _buildForIOS(context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {},
            child: TextSubtitle(
              'Galeria',
              color: Theme.of(context).primaryColor,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {},
            child: TextSubtitle(
              'Galeria',
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
}

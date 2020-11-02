import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/drawer/tile.dart';
import 'package:xlo_mobx/stores/page.dart';

class PageSection extends StatelessWidget {
  final pageStore = GetIt.I<PageStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        children: [
          PageTile(
            label: 'Anúncios',
            iconData: Icons.list,
            active: pageStore.page == 0,
            onTap: () {
              pageStore.setPage(0);
            },
          ),
          PageTile(
            label: 'Incluir Anúncios',
            iconData: Icons.edit,
            active: pageStore.page == 1,
            onTap: () {
              pageStore.setPage(1);
            },
          ),
          PageTile(
            label: 'Chat',
            iconData: Icons.chat,
            active: pageStore.page == 2,
            onTap: () {
              pageStore.setPage(2);
            },
          ),
          PageTile(
            label: 'Favoritos',
            iconData: Icons.favorite,
            active: pageStore.page == 3,
            onTap: () {
              pageStore.setPage(3);
            },
          ),
          PageTile(
            label: 'Minha conta',
            iconData: Icons.person,
            active: pageStore.page == 4,
            onTap: () {
              pageStore.setPage(4);
            },
          )
        ],
      ),
    );
  }
}

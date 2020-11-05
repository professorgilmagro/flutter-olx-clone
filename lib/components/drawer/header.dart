import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/login/login.dart';
import 'package:xlo_mobx/stores/page.dart';
import 'package:xlo_mobx/stores/user_manager.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class CustomDrawerHeader extends StatelessWidget {
  final userStore = GetIt.I<UserManagerStore>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (userStore.isLoggedIn) {
          return GetIt.I<PageStore>().setPage(4);
        }
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        height: 100,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userStore.isLoggedIn
                        ? userStore.user.name
                        : 'Acesse seu conta agora!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  SimpleText(
                    userStore.isLoggedIn ? userStore.user.email : 'Clique aqui',
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

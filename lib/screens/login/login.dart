import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/signup/register.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleText(
                    'Acessar com E-mail',
                    color: Colors.grey[900],
                    align: TextAlign.center,
                    size: 18,
                  ),
                  SimpleText(
                    'Email',
                    size: 16,
                    color: Colors.grey[700],
                    bold: true,
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SimpleText(
                        'Email',
                        size: 16,
                        color: Colors.grey[700],
                        bold: true,
                        padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      ),
                      SimpleText(
                        'Esqueceu sua senha?',
                        decoration: TextDecoration.underline,
                        size: 14,
                        color: Colors.green[900],
                        onTap: () {},
                      ),
                    ],
                  ),
                  TextField(
                    style: TextStyle(fontSize: 16),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      isDense: true,
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(top: 20, bottom: 12),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.orange,
                      child: SimpleText(
                        'ENTRAR',
                        size: 14,
                        bold: true,
                      ),
                      textColor: Colors.white,
                      elevation: 0,
                      onPressed: () {},
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SimpleText(
                        'Não tem um conta?',
                        size: 16,
                        color: Colors.grey[900],
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      SimpleText(
                        'Cadastra-se?',
                        decoration: TextDecoration.underline,
                        size: 16,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        color: Colors.green[900],
                        onTap: () {
                          final pageRoute = MaterialPageRoute(
                            builder: (_) => RegisterScreen(),
                          );
                          Navigator.push(context, pageRoute);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

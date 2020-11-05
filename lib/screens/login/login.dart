import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/screens/signup/register.dart';
import 'package:xlo_mobx/stores/login.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginStore = LoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction((_) => loginStore.signIn, (isLogged) {
      if (isLogged) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: 'Sucesso!',
          text: 'Login efetuado com sucesso!',
          onConfirmBtnTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      }
    });
  }

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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  TextFormField(
                    onChanged: loginStore.setEmail,
                    validator: loginStore.emailValidator,
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
                        'Senha',
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
                  Observer(
                    builder: (_) => TextField(
                      style: TextStyle(fontSize: 16),
                      obscureText: !loginStore.showPass,
                      onChanged: loginStore.setPassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginStore.showPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: loginStore.toggleVisibility,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => Container(
                      margin: EdgeInsets.only(top: 20, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.black,
                            child: loginStore.loading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(),
                                  )
                                : SimpleText(
                                    'ENTRAR',
                                    size: 14,
                                    bold: true,
                                  ),
                            textColor: Colors.white,
                            elevation: 0,
                            onPressed:
                                loginStore.canSubmit ? loginStore.login : null,
                          ),
                          loginStore.error.isNotEmpty
                              ? SimpleText(
                                  loginStore.error,
                                  size: 14,
                                  align: TextAlign.center,
                                  bold: true,
                                  color: Colors.red,
                                  padding: EdgeInsets.only(top: 5),
                                )
                              : Container()
                        ],
                      ),
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

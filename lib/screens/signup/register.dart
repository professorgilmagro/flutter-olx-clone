import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/login/login.dart';
import 'package:xlo_mobx/screens/signup/components/field.dart';
import 'package:xlo_mobx/stores/register.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class RegisterScreen extends StatelessWidget {
  final store = RegisterStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTile(
                      label: 'Apelido',
                      placeholder: 'Exemplo: João S.',
                      description: 'Nome que será exibido no seu anúncio',
                      onChanged: store.setName,
                      isOk: store.name.isEmpty ? null : store.isNameValid,
                    ),
                    FieldTile(
                      label: 'E-mail',
                      description: 'Enviaremos um e-mail de confirmação',
                      placeholder: 'Exemplo: joao@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: store.setEmail,
                      isOk: store.email.isEmpty ? null : store.isMailValid,
                    ),
                    FieldTile(
                      label: 'Celular',
                      formatters: store.phoneFormatters,
                      isOk: store.isPhoneOk,
                      onChanged: store.setPhone,
                      placeholder: '(11) 99999-9999',
                      keyboardType: TextInputType.phone,
                      description: 'Proteja sua conta',
                    ),
                    FieldTile(
                      label: 'Senha',
                      onChanged: store.setPassword,
                      isOk: store.password.isEmpty ? null : store.isPassValid,
                      description:
                          'Use números, letras maiúsculas e minúsculas',
                      obscure: true,
                    ),
                    FieldTile(
                      label: 'Confirmar Senha',
                      description: 'Repita a senha',
                      onChanged: store.setConfirmPass,
                      isOk: store.confirm.isEmpty ? null : store.passConfirmed,
                      obscure: true,
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(top: 10, bottom: 12),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black,
                        child: store.loading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              )
                            : SimpleText(
                                'Cadastre-se',
                                size: 14,
                                bold: true,
                              ),
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: store.canSubmit ? store.register : null,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        SimpleText(
                          'Já tem um conta?',
                          size: 16,
                          color: Colors.grey[900],
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        SimpleText(
                          'Entrar',
                          decoration: TextDecoration.underline,
                          size: 16,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          color: Colors.green[900],
                          onTap: () {
                            final route = MaterialPageRoute(
                                builder: (_) => LoginScreen());
                            Navigator.push(context, route);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

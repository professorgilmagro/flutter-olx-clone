import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/login/login.dart';
import 'package:xlo_mobx/screens/signup/components/field.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class RegisterScreen extends StatelessWidget {
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
                  FieldTile(
                    label: 'Apelido',
                    placeholder: 'Exemplo: João S.',
                    description: 'Nome que será exibido no seu anúncio',
                  ),
                  FieldTile(
                    label: 'E-mail',
                    description: 'Enviaremos um e-mail de confirmação',
                    placeholder: 'Exemplo: joao@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FieldTile(
                    label: 'Celular',
                    placeholder: '(11) 99999-9999',
                    keyboardType: TextInputType.phone,
                    description: 'Proteja sua conta',
                  ),
                  FieldTile(
                    label: 'Senha',
                    description: 'Use letras, números e caracteres especiais',
                    obscure: true,
                  ),
                  FieldTile(
                    label: 'Confirmar Senha',
                    description: 'Repita a senha',
                    obscure: true,
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
                          final route =
                              MaterialPageRoute(builder: (_) => LoginScreen());
                          Navigator.push(context, route);
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

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/drawer/drawer.dart';
import 'package:xlo_mobx/screens/create/components/images_field.dart';
import 'package:xlo_mobx/widgets/texts.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: TextSubtitle('Criar anúncio'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Column(
            children: [
              ImagesField(),
              TextFormField(
                decoration: fieldDecoration('Título *'),
              ),
              TextFormField(
                maxLength: null,
                decoration: fieldDecoration('Descrição *'),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                decoration: fieldDecoration('CEP *'),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(centavos: true),
                ],
                keyboardType: TextInputType.number,
                decoration: fieldDecoration('Preço *', prefixText: 'R\$ '),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fieldDecoration(String label, {String prefixText}) => InputDecoration(
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(),
        disabledBorder: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 12, 10),
        labelText: label,
        prefixText: prefixText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.grey,
          fontSize: 18,
        ),
      );
}

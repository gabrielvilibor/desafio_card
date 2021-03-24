import 'package:desafio_card/models/card_model.dart';
import 'package:desafio_card/repositories/widget/button.dart';
import 'package:desafio_card/repositories/widget/input_text.dart';
import 'package:flutter/material.dart';

class CardFormPage extends StatefulWidget {

  Cards? card;
  CardFormPage({this.card});

  @override
  _CardFormPageState createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {

  Cards? get c => widget.card;

  var controllerTitulo = TextEditingController();
  var controllerConteudo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 18, 50, 1),
        title: Text(c != null ? 'Card: ${c!.id}' : 'Card: Novo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
      ),
      body: Container(
        child: _form(c),
      ),
    );
  }

  _form(Cards? c) {
    return SingleChildScrollView(
      child: Form(
        key: UniqueKey(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InputText('Título', controllerTitulo, color: Color.fromRGBO(0, 18, 50, .8), maxLines: 1,),
              SizedBox(height: 20,),
              InputText('Conteúdo', controllerConteudo, color: Color.fromRGBO(0, 18, 50, .8), maxLines: 20,),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 200, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Button(_onClickSalvar, 'Cadastrar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onClickSalvar() {
    print('salvo');
  }
}
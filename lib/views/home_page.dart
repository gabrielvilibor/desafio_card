import 'package:desafio_card/controllers/cards_controller.dart';
import 'package:desafio_card/models/card_model.dart';
import 'package:desafio_card/views/card/card_form_page.dart';
import 'package:desafio_card/widgets/alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animated = false;

  late Future<List<Cards>?> cards;

  String user = "";
  String email = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onCreated();
  }

  _onCreated() async {
    cards = CardsController().fetch();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email').toString(); // recupera os dados
    user = prefs.getString('user').toString();
  }

  _onRefresh() async {
    cards = (await CardsController().fetch()) as Future<List<Cards>?>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 18, 50, 1),
        title: Text(
          'Cards',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return CardFormPage();
                }));
              },
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: FutureBuilder<List<Cards>?>(
          future: cards,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar a API'),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _list(snapshot.data!);
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 18, 50, 1),
              ),
              accountName: Text(
                user.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5, color: Colors.white),
              ),
              accountEmail: Text(email.toString(), style: TextStyle(color: Colors.white),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromRGBO(43, 56, 91, .9),
                child: Icon(
                  Icons.person,
                  color: Color.fromRGBO(225, 110, 14, 1),
                  size: 42,
                ),
              ),
            ),
            ListTile(
              onTap: () async {

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('conectado', false);

                setState(() {
                  animated = !animated;
                });


                Navigator.of(context).pushReplacementNamed('/login');
              },
              leading: Icon(Icons.logout),
              title: AnimatedDefaultTextStyle(
                child: Text('Sair'),
                style: animated
                    ? TextStyle(
                        color: Colors.redAccent,
                        fontSize: 26,
                      )
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                duration: Duration(milliseconds: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _list(List<Cards> cards) {
    return Container(
      child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            Cards card = cards[index];
            return Container(
              height: 340,
              padding: EdgeInsets.all(8),
              child: Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: Color.fromRGBO(225, 110, 14, 1),
                    width: 4.0,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black26, width: 3))),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color.fromRGBO(225, 110, 14, 1),
                                border: Border.all(
                                    color: Color.fromRGBO(0, 18, 50, 1),
                                    width: 2),
                              ),
                              child: Text('${card.id}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Flexible(
                              child: Text(card.title.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 24)),
                            )
                          ],
                        ),
                      ), // fim container da column
                      Container(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 4, right: 4),
                          height: 150,
                          child: SingleChildScrollView(
                            child: Text(
                              card.content.toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          )),
                      ButtonBarTheme(
                        key: UniqueKey(),
                        data: ButtonBarThemeData(),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white, width: 1),
                              ),
                              child: const Text(
                                'Editar',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: .6),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return CardFormPage(
                                    card: card,
                                  );
                                }));
                              },
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red, width: 1),
                                  backgroundColor: Colors.red[300]),
                              child: const Text(
                                'Remover',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              onPressed: () async {
                                bool resposta = await CardsController()
                                    .deleteCard(card.id!);
                                if (!resposta) {
                                  alert(context, 'Erro ao deletar', resposta);
                                }
                                alert(
                                    context, 'Deletado com sucesso!', resposta);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

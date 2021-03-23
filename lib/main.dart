import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Card - GrowDev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Desafio Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 18, 50, 1),
        title: Text('Cards', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, size: 32, color: Colors.white,),
          )
        ],
      ),
      body: _list(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 18, 50, 1),
                ),
                accountName: Text('Nome do Usuário', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5),),
                accountEmail: Text('E-mail@doUsuário'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromRGBO(43, 56, 91, .9),
                  child: Icon(Icons.person, color: Color.fromRGBO(225, 110, 14, 1), size: 42,),
                ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  animated = !animated;
                });
              },
              leading: Icon(Icons.logout),
              title: AnimatedDefaultTextStyle(
                child: Text('Sair'),
                style : animated ? TextStyle(
                  color: Colors.redAccent,
                  fontSize: 26,
                ) : TextStyle(
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

  _list() {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
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
                                    color: Colors.black26,
                                    width: 3
                                )
                            )
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color.fromRGBO(225, 110, 14, 1),
                                border: Border.all(color: Color.fromRGBO(0, 18, 50, 1), width: 2),
                              ),
                              child: Text('${index+1}', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 24,),
                            Flexible(
                              child: Text("Titulo Qualquer para um card beasdasdsadasdasd",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 24)),
                            )
                          ],
                        ),
                      ), // fim container da column
                      Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                          height: 150,
                          child: SingleChildScrollView(
                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent a sollicitudin erat. "
                                " Pellentesque blandit vulputate augue ac feugiat. "
                                " Praesent sodales, ipsum pharetra fringilla euismod, mauris massa finibus elit, nec imperdiet ex turpis ut mauris."
                                " Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. "
                                "Donec mattis dui quis magna scelerisque, vitae fringilla est pharetra. Nulla dui lorem, dictum "
                                "quis tincidunt nec, venenatis at justo. Interdum et malesuada fames ac ante ipsum primis in faucibus."
                                " Curabitur tristique nec ex eget ultrices. Aenean consectetur laoreet metus, congue tincidunt tortor."
                                " Ut fermentum cursus dolor, porta gravida nisl sollicitudin id. Morbi pellentesque lectus a viverra molestie. Aenean ut sapien ex.",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                          )
                      ),
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
                              child: const Text('Editar', style: TextStyle(color: Colors.black, fontSize: 15, letterSpacing: .6),),
                              onPressed:(){},
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red, width: 1),
                                backgroundColor: Colors.red[300]
                              ),
                              child: const Text('Remover', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                              onPressed:(){},
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

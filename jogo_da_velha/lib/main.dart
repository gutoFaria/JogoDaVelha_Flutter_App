import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({super.key});

  int jogadas = 0;

  List grade = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    Container c1 = Container(
      height: 50,
      child: const Center(
        child: Text(
          'Jogo da Velha',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.orange, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
    );

    Container c2 = Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.white,
              child: const Text(
                'Player X',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white,
              child: const Text(
                'Player O',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));

    Container c4 = Container(
      height: 300,
      width: 300,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButton(index: 0),
            myButton(index: 1),
            myButton(index: 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButton(index: 3),
            myButton(index: 4),
            myButton(index: 5),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButton(index: 6),
            myButton(index: 7),
            myButton(index: 8),
          ],
        )
      ]),
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: Column(
            children: <Widget>[c1, c2, c4],
          )),
        ));
  }

  Widget myButton({required index}) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              click(index: index);
            });
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            grade[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }

  void click({required index}) {
    bool resultado;
    if (jogadas % 2 == 0 && grade[index] == '') {
      jogadas++;
      grade[index] = 'X';
      resultado = verificaJogador(jogador: 'X', index: index);
      if (resultado) {
        showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:const Text('Material Dialog'),
            content:const Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    null;
                  },
                  child:const Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  null;
                },
                child: const Text('HelloWorld!'),
              )
            ],
          );
        });
      }
    } else if (jogadas % 2 != 0 && grade[index] == '') {
      jogadas++;
      grade[index] = 'O';

      resultado = verificaJogador(jogador: 'O', index: index);
      if (resultado) {}
    }
  }

  bool verificaJogador({required String jogador, required int index}) {
    if (grade[0] == grade[1] && grade[1] == grade[2] && grade[0] != '') {
      return true;
    } else if (grade[3] == grade[4] && grade[4] == grade[5] && grade[3] != '') {
      return true;
    } else if (grade[6] == grade[7] && grade[7] == grade[8] && grade[6] != '') {
      return true;
    } else if (grade[0] == grade[3] && grade[3] == grade[6] && grade[0] != '') {
      return true;
    } else if (grade[1] == grade[4] && grade[4] == grade[7] && grade[1] != '') {
      return true;
    } else if (grade[2] == grade[5] && grade[5] == grade[8] && grade[2] != '') {
      return true;
    } else if (grade[0] == grade[4] && grade[4] == grade[8] && grade[0] != '') {
      return true;
    } else if (grade[2] == grade[4] && grade[4] == grade[6] && grade[2] != '') {
      return true;
    }

    return false;
  }

  void resetar() {
    for (var i = 0; i < grade.length; i++) {
      grade[i] = '';
    }

    Widget finalJogo({required String jogador}) {
      return AlertDialog(
          title: const Text('Vencedor'),
          content: Text(
            "Player $jogador venceu a partifa",
          ),
          actions: [
            ElevatedButton(
              child: const Text("Continue"),
              onPressed: () {
                for (var i = 0; i < grade.length; i++) {
                  grade[i] = '';
                }
              },
            ),
          ]);
    }
  }
}

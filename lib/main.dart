import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_db_module/domain/get_words_uc.dart';
import 'package:test_db_module/domain/insert_word_uc.dart';
import 'locator_service.dart' as di;

void main() => _runner();

void _runner() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo DataBase'),
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
  @override
  Widget build(BuildContext context) {
    GetAllWordsUseCase _getAllWordsUc =
        GetIt.instance.get<GetAllWordsUseCase>();
    InsertWordUseCase _insertWordUc = GetIt.instance.get<InsertWordUseCase>();

    final myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            StreamBuilder<List<String>>(
                stream: _getAllWordsUc.call(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  List<String>? words = snapshot.data;
                  if (words == null) {
                    return Center(
                      child: Text("Что-то видимо пошло не так :("),
                    );
                  } else if (words.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(36),
                      child: Center(
                        child: Text(
                            "Тут пока ничего нет. Добавь новое слово, чтобы оно появилось на экране"),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: words.length,
                      itemBuilder: (BuildContext context, int indx) {
                        return Container(
                          child: Center(
                            child: Text(words[indx]),
                          ),
                        );
                      },
                    );
                  }
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: myController,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _insertWordUc.call(myController.text);
                        },
                        child: Text("Add"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

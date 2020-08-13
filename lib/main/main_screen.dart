import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutterapp/list/list_screen.dart';
import 'package:flutterapp/utils/singletons.dart';

import 'main_view_model.dart';

void main() {
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _viewModel = MainViewModel(repository: Singletons.characterRepository);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            FlatButton(
              color: Colors.amber,
              splashColor: Colors.pink,
              highlightColor: Colors.green,
              child: Observer(
                builder: (_) {
                  if (_viewModel.character == null || _viewModel.character.status == FutureStatus.pending) {
                    return CircularProgressIndicator(backgroundColor: Colors.white,);
                  } else {
                    return Text("Buscar Personagem");
                  }
                },
              ),
              onPressed: () {
                _viewModel.onButtonPressed();
              },
            ),
            Observer(
              builder: (_) {
                if (_viewModel.character?.status == FutureStatus.fulfilled) {
                  return Text(
                    '${_viewModel.character?.value?.name}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (_viewModel.character?.error != null) {
                  return Text("fodeu");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Observer(builder: (_) {
              return Text('${_viewModel.value}');
            }),
            FlatButton(
              color: Colors.blue,
              splashColor: Colors.black,
              child: Text("Go list"),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

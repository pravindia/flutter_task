import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final model = ListModel();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<ListModel>.value(value: model),
              ],
              child: MyWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List data = [];
  late ListModel _model;

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _model = Provider.of<ListModel>(context);
    return SingleChildScrollView(
      primary: true,
      physics: ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () => _model.imageUpload(),
            child: const Text("Start timer"),
          ),
          TextField(
            controller: textController,
          ),
          TextButton(
            onPressed: () {
              _model.dataUpload(textController.text);
              textController.text = '';
            },
            child: const Text("Submit Form"),
          ),
          Consumer<ListModel>(builder: (context, _, child) {
            return ListView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _model.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(_model.list[index].toString());
              },
            );
          }),
        ],
      ),
    );
  }
}

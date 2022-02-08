import 'package:flutter/material.dart';
import 'handlers/test.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final TextEditingController _controller = TextEditingController();

  Future<Test>? _futureTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: (_futureTest == null) ? keyNotInserted() : keyInserted(),
      ),
    );
  }



  Column keyNotInserted() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'key'),
        ),
        ElevatedButton(
            onPressed: () => setState(() {
                  _futureTest = createTest(_controller.text);
                }),
            child: const Text('created Data'))
      ],
    );
  }

  FutureBuilder<Test> keyInserted() {
    return FutureBuilder<Test>(
      future: _futureTest,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futureTest = null;
                      });
                    },
                    child: Text('go back')),
                Text(snapshot.data!.key),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${snapshot.error}'),
                ElevatedButton(
                    onPressed: () => setState(() {
                      _futureTest = null;
                    }),
                    child: Text('go back')),
              ],
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

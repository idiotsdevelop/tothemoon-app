import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketPage extends StatefulWidget {
  const SocketPage({Key? key}) : super(key: key);

  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {

  final channel = IOWebSocketChannel.connect('wss://pubwss.bithumb.com/pub/ws');
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is the socket"),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                print(snapshot);
                return Text(snapshot.hasData ? '${snapshot.data}': '${snapshot.error}');
              },
            ),
            FloatingActionButton(
              onPressed: _setChannel,
            )
          ],
        ),
      ),
    );
  }

  void _setChannel() {
      channel.sink.add('{"type":"ticker","symbols":["BTC_KRW","ETH_KRW"],"tickTypes":["1H"]}');
  }

  @override
  void dispose() {
    channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}


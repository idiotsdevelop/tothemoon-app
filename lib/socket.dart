import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moon/main.dart';
import 'package:moon/model/coin.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:sprintf/sprintf.dart';

class SocketPage extends StatefulWidget {
  const SocketPage({Key? key}) : super(key: key);

  @override
  _SocketPageState createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  List<String> coin = ["BTC", "ETH"];

  final channelBTC =
      IOWebSocketChannel.connect('wss://pubwss.bithumb.com/pub/ws');
  final channelETH =
      IOWebSocketChannel.connect('wss://pubwss.bithumb.com/pub/ws');

  // String btcInfo = '';
  String btcInfo = '{"content" : {"openPrice" : "0"}}';

  // StreamController<dynami>

  // final channel = IOWebSocketChannel.connect('wss://pubwss.bithumb.com/pub/ws');
  // final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    channelBTC.sink.add('{"type":"ticker","symbols":["BTC_KRW"],"tickTypes":["24H"]}');

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is the socket"),
            StreamBuilder(
              stream: channelBTC.stream,

              builder: (context, snapshot) {

                btcInfo = snapshot.data.toString();

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.hasData
                        ? '${json.decode(btcInfo)["content"]["symbol"]} : ${json.decode(btcInfo)["content"]["closePrice"]}'
                        : '${snapshot.error}'),
                  ],
                );
              },
            ),
            StreamBuilder(
              stream: channelETH.stream,
              builder: (context, snapshot) {

                return Text(snapshot.hasData
                    ? '${snapshot.data}'
                    : '${snapshot.error}');
              },
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _setChannel();
              }),
              child: Text("비코"),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _setETHChannel();
              }),
              child: Text("이더리움"),
            ),
          ],
        ),
      ),
    );
  }

  void _setChannel() {
    channelBTC.sink
        .add('{"type":"ticker","symbols":["BTC_KRW"],"tickTypes":["24H"]}');
  }

  void _setETHChannel() {
    channelETH.sink
        .add('{"type":"ticker","symbols":["ETH_KRW"],"tickTypes":["24H"]}');
  }

  @override
  void dispose() {
    channelBTC.sink.close();
    channelETH.sink.close();
    // _controller.dispose();
    super.dispose();
  }
}

// class Coin {
//   final String type;
//   final List<Map<String, dynamic>> content;
//
//   Coin({required this.type, required this.content});
//   factory Coin.fromJson(Map<String, dynamic> json) {
//     return Coin(
//       type: json['type'],
//       content: json['content']
//     );
//   }
// }

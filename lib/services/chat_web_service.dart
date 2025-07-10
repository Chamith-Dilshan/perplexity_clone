import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

// This class use Singleton pattern to ensure only one instance of the WebSocket connection exists
// and can be accessed globally.
class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocketChannel? _socketChannel;

  factory ChatWebService() => _instance;

  ChatWebService._internal();
  // Stream controllers to manage the streams for search results and content
  // use StreamController.boradcast() if you want to allow multiple listeners
  // to the same stream.
  final _searchResutlController = StreamController<Map<String,dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String,dynamic>> get searchResultStream =>
      _searchResutlController.stream;
  Stream<Map<String, dynamic>> get contentStream =>
      _contentController.stream;

  void connect() async {
    // Establish a socket connection
    _socketChannel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:8000/ws/chat'),
    );

    await _socketChannel!.ready;

    _socketChannel!.stream.listen((message) {
      final data = json.decode(message);
      if(data['type'] == 'search_results') {
        print('Search results received: ${data['data']}');
        _searchResutlController.add(data);
      } else if(data['type'] == 'content') {
        print('Content received: ${data['data']}');
        _contentController.add(data);
      }
      // log('Received message: ${data['type']} - ${data['data']}');
      // _socketChannel!.sink.add('received!');
      // _socketChannel!.sink.close(status.goingAway);
    });
  }

  void chat(String query) {
    _socketChannel!.sink.add(json.encode({'query': query}));
  }

  void disconnect() {}
}

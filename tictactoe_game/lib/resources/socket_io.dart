import 'package:socket_io_client/socket_io_client.dart' as IO;

// creating a Singleton class design.
class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.1.4:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket!.connect();
    socket!.onConnect(
        (data) => print('connection successfull ${data.toString()}'));
  }

  static SocketClient? get instance {
    _instance ??= SocketClient._internal();
    return _instance;
  }
}

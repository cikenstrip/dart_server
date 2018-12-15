import 'dart:async';
import 'dart:io';

Future main() async {
  HttpServer serverBasic = await HttpServer.bind(
    '127.0.0.1', 4000
  );
  
  print('Listening: ${serverBasic.address}:${serverBasic.port}');

  serverBasic.listen((HttpRequest req) {
    req.response
      ..write('Welcome!')
      ..close();
  } );
}

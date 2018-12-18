import 'dart:async';
import 'dart:io';
import 'package:rpc/rpc.dart';

class Restaurant {
  String name;
}

@ApiClass(name:'foodAPI', version:'v1')
class RestaurantService {
  @ApiMethod(method:'GET', path:'profile/{name}')
  Restaurant profile(String name){
    return new Restaurant()..name = name;
  }
}

Future<Null> main() async {
  ApiServer apiServer = new ApiServer();
  apiServer.addApi(new RestaurantService());
  HttpServer server = await HttpServer.bind('127.0.0.1', 4000);
  print("Listening to ${server.address}:${server.port}");
  server.listen(apiServer.httpRequestHandler);
} 

import 'dart:io';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'app/app_module.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = '0.0.0.0'; /*InternetAddress.anyIPv4;*/

  // Configure a pipeline that logs requests.
  // final _handler = Pipeline()
  //     .addMiddleware(logRequests())
  //     .addHandler(Modular(module: AppModule()));

  final _handler = (Modular(module: AppModule()));

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, ip, port);

  print('Server listening on port ${server.port}');
}

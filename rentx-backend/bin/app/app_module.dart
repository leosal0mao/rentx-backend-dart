import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf/shelf.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        Route.resource('/resource', resource: TestResources()),
        Route.module('/', module: TestModule())
      ];
}

class TestResources extends Resource {
  @override
  List<Route> get routes => [
        Route.get(
          '/:id',
          (Request req, Injector inj, ModularArguments args) {
            print(args.queryParams);
            // print(args.queryParamsAll);
            print(args.params);
            // print(args.queryParams);
            return Response.ok('Hello, Resource!\n');
          },
        )
      ];
}

class TestModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get(
          '/',
          (Request req, Injector inj, ModularArguments args) {
            return Response.ok('Hello, Module!\n');
          },
        )
      ];
}

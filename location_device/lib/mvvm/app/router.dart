import 'package:auto_route/auto_route_annotations.dart';
import '../screens/home.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: Home, initial: true),
  ],
)
class $Router {}

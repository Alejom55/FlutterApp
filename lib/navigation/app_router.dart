import 'package:go_router/go_router.dart';
import 'package:myapp/pages/home/home_screen.dart';

final router = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
    path: '/home/:index',
    name: "home",
    builder: (context, state) {
      final index = int.parse(state.pathParameters['index'] ?? '0');

      return HomeScreen(
        currentIndex: index,
      );
    },
  )
]);

import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

// class RouteConfig {
//   static GoRouter returnRouter() {
//     return GoRouter(
//       initialLocation: '/',
//       routes: [
//         GoRoute(
//           path: '/',
//           name: RouteNames.home,
//           pageBuilder: (context, state) {
//             return MaterialPage(child: HomeScreen());
//           },
//           routes: [],
//         ),
//       ],
//     );
//   }
// }

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/buttons', builder: (context, state) => ButtonsScreen()),
    GoRoute(path: '/cards', builder: (context, state) => CardsScreen()),
  ],
);

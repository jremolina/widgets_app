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
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
  ],
);

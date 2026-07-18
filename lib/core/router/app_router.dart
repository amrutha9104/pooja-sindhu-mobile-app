import 'package:go_router/go_router.dart';
import 'package:pooja_sindhu/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);

// TODO(day2+): add routes for auth, home, ritual, pandit, booking, payment,
// profile, panchang, festival, horoscope as each feature lands.


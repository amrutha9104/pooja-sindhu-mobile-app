import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pooja_sindhu/core/constants/route_constants.dart';
import 'package:pooja_sindhu/core/network/auth_state_notifier.dart';
import 'package:pooja_sindhu/features/auth/domain/auth_state.dart';
import 'package:pooja_sindhu/features/auth/presentation/screens/login_screen.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/booking_confirmation_screen.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/booking_flow_screen.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/my_bookings_screen.dart';
import 'package:pooja_sindhu/features/splash/presentation/screens/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateNotifierProvider);
  final authNotifier = ref.watch(authStateNotifierProvider.notifier);
  final refresh = _RouterRefreshNotifier(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: refresh,
    redirect: (context, state) {
      if (!authNotifier.bootstrapped && state.matchedLocation == '/') {
        return null;
      }

      final isLoggedIn = authState is AuthAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const _HomeStubScreen(),
      ),
      GoRoute(
        path: Routes.myBookings,
        builder: (context, state) => const MyBookingsScreen(),
      ),
      GoRoute(
        path: Routes.booking,
        builder: (context, state) => BookingFlowScreen(
          ritualId: state.uri.queryParameters['ritualId'] ?? '',
        ),
      ),
      GoRoute(
        path: '${Routes.bookingConfirmation}/:bookingId',
        builder: (context, state) => BookingConfirmationScreen(
          bookingId: state.pathParameters['bookingId']!,
        ),
      ),
    ],
  );
});

class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(this._ref) {
    _subscription = _ref.listen<AuthState>(
      authStateNotifierProvider,
      (_, __) => notifyListeners(),
    );
  }

  final Ref _ref;
  late final ProviderSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

class _HomeStubScreen extends StatelessWidget {
  const _HomeStubScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Signed in')),
    );
  }
}

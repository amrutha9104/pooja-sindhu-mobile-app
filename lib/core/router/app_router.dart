import 'package:go_router/go_router.dart';
import 'package:pooja_sindhu/core/constants/route_constants.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/booking_confirmation_screen.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/booking_flow_screen.dart';
import 'package:pooja_sindhu/features/booking/presentation/screens/my_bookings_screen.dart';
import 'package:pooja_sindhu/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(path: Routes.myBookings, builder: (_, __) => const MyBookingsScreen()),
    GoRoute(path: Routes.booking, builder: (_, state) => BookingFlowScreen(ritualId: state.uri.queryParameters['ritualId'] ?? '')),
    GoRoute(path: '${Routes.bookingConfirmation}/:bookingId', builder: (_, state) => BookingConfirmationScreen(bookingId: state.pathParameters['bookingId']!)),
  ],
);

// TODO(day2+): add routes for auth, home, ritual, pandit, booking, payment,
// profile, panchang, festival, horoscope as each feature lands.


import 'package:frontend/screens/homescreen.dart';
import 'package:frontend/screens/login.dart';
import 'package:frontend/screens/product.dart';
import 'package:frontend/screens/register_certifier.dart';
import 'package:frontend/screens/register_distributer.dart';
import 'package:frontend/screens/register_producer.dart';
import 'package:go_router/go_router.dart';

final globalRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/register_certifier',
      builder: (context, state) => const RegisterCertifier(),
    ),
    GoRoute(
      path: '/register_producer',
      builder: (context, state) => const RegisterProducer(),
    ),
    GoRoute(
      path: '/register_distributer',
      builder: (context, state) => const RegisterDistributer(),
    ),
    GoRoute(
      path: '/view_product',
      builder: (context, state) => const ViewProduct(productId: ''),
    ),
    GoRoute(
      path: '/view_product/:product_id',
      builder: (context, state) =>
          ViewProduct(productId: state.pathParameters['product_id']!),
    ),
    GoRoute(
      path: '/dashboard/:userType',
      builder: (context, state) =>
          Homescreen(userType: state.pathParameters['userType']!),
    )
  ],
);

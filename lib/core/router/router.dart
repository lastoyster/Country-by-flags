import 'package:flags_app/core/models/flag/flag.dart';
import 'package:flags_app/core/models/quiz/answer.dart';
import 'package:flags_app/core/models/quiz/question.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flags_app/ui/pages/confirm_forgot_password_page/confirm_forgot_password_page.dart';
import 'package:flags_app/ui/pages/detail_flag_page/detail_flag_page.dart';
import 'package:flags_app/ui/pages/flags_page/flags_page.dart';
import 'package:flags_app/ui/pages/forgot_password_page/forgot_password_page.dart';
import 'package:flags_app/ui/pages/history_page/history_page.dart';
import 'package:flags_app/ui/pages/home_page/home_page.dart';
import 'package:flags_app/ui/pages/login_page/login_page.dart';
import 'package:flags_app/ui/pages/profile_page/profile_page.dart';
import 'package:flags_app/ui/pages/quiz_page/quiz_page.dart';
import 'package:flags_app/ui/pages/register_page/register_page.dart';
import 'package:flags_app/ui/pages/results_quiz_page/results_quiz_page.dart';
import 'package:flags_app/ui/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

final getIt = GetIt.instance;

const _authPath = [
  '/login',
  '/register',
  '/splash',
  '/forgot-password',
  '/confirm-forgot-password',
];

final router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
  redirect: (context, state) {
    final store = getIt.get<Store<AppState>>();
    final authState = store.state.authState;
    final path = state.fullPath;

    if (!authState.isLoggedIn && !_authPath.contains(path)) return '/login';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/flags',
      builder: (context, state) => const FlagsPage(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryPage(),
    ),
    GoRoute(
      path: '/quiz',
      builder: (context, state) => const QuizPage(),
    ),
    GoRoute(
      path: '/results-quiz',
      builder: (context, state) =>
          ResultsQuizPage(answers: state.extra as Map<Question, Answer>),
    ),
    GoRoute(
      path: '/detail-flag',
      builder: (context, state) => DetailFlagPage(
        flag: state.extra as Flag,
      ),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/confirm-forgot-password',
      builder: (context, state) => const ConfirmForgotPasswordPage(),
    ),
  ],
);

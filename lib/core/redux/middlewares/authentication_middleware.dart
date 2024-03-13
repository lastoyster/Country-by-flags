import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flags_app/core/extensions/extensions.dart';
import 'package:flags_app/core/models/authentication/user.dart' as u;
import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/core/redux/states/app_state.dart';
import 'package:flags_app/core/router/navigation_destination.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is SubmitRegisterAction) {
      _onSubmitRegisterAction(store, action);
    } else if (action is LogoutAction) {
      _onLogoutAction(store, action);
    } else if (action is SubmitLoginAction) {
      _onSubmitLoginAction(store, action);
    } else if (action is GetCurrentLoginAction) {
      _onGetCurrentLoginAction(store, action);
    } else if (action is SubmitForgotPasswordAction) {
      _onSubmitForgotPasswordAction(store, action);
    }
    next(action);
  }

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<void> _onSubmitRegisterAction(
    Store<AppState> store,
    SubmitRegisterAction action,
  ) async {
    try {
      if (action.registerUser.isEmpty) {
        store.dispatch(
          const ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Error',
              message: 'mohon lengkapi semua data',
            ),
          ),
        );
        return;
      }

      store.dispatch(
        const ShowDialogAction(
          barrierDismissible: false,
          destination: LoadingDialogDestination(),
        ),
      );

      final response = await auth.createUserWithEmailAndPassword(
        email: action.registerUser.email,
        password: action.registerUser.password,
      );

      final usersCollection = firestore.collection('users');
      final user = u.User(
        id: response.user!.uid,
        email: action.registerUser.email,
        fullName: action.registerUser.fullName,
      );

      await usersCollection.doc(user.id).set(
            user.toJson(),
          );

      store.dispatches([
        SetUserAction(user: user),
        const NavigateToRootAction(
          path: '/',
        ),
      ]);
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> _onLogoutAction(
    Store<AppState> store,
    LogoutAction action,
  ) async {
    try {
      auth.signOut();

      store.dispatch(
        const NavigateToRootAction(
          path: '/login',
        ),
      );
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> _onSubmitLoginAction(
    Store<AppState> store,
    SubmitLoginAction action,
  ) async {
    try {
      if (action.login.isEmpty) {
        store.dispatch(
          const ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Error',
              message: 'email dan password harus diisi.',
            ),
          ),
        );
        return;
      }

      store.dispatch(
        const ShowDialogAction(
          barrierDismissible: false,
          destination: LoadingDialogDestination(),
        ),
      );
      final response = await auth.signInWithEmailAndPassword(
        email: action.login.email,
        password: action.login.password,
      );

      final usersCollection = firestore.collection('users');

      final user = await usersCollection.doc(response.user!.uid).get();

      if (user.data() == null) {
        throw 'User data ${response.user!.uid} not found';
      }

      store.dispatches([
        SetUserAction(
          user: u.User.fromJson(user.data()!),
        ),
        const NavigateToRootAction(
          path: '/',
        ),
      ]);
    } on FirebaseAuthException catch (ex) {
      String message = ex.message ?? 'error';
      switch (ex.code.toLowerCase()) {
        case 'user-not-found':
          message = 'email belum terdaftar';
          break;
        case 'wrong-password':
          message = 'password salah';
          break;
        case 'invalid_login_credentials':
          message = 'email atau password salah';
          break;
      }
      store.dispatches(
        [
          const NavigateBackAction(),
          ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Error',
              message: message,
            ),
          ),
        ],
      );
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> _onGetCurrentLoginAction(
    Store<AppState> store,
    GetCurrentLoginAction action,
  ) async {
    try {
      final currentUser = auth.currentUser;

      if (currentUser == null) {
        store.dispatch(
          const NavigateToRootAction(
            path: '/',
          ),
        );
        return;
      }

      final user = await getUser(currentUser.uid);

      store.dispatches([
        SetUserAction(user: user),
        const NavigateToRootAction(
          path: '/',
        ),
      ]);
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<u.User> getUser(String uid) async {
    final usersCollection = firestore.collection('users');

    final user = await usersCollection.doc(uid).get();

    if (user.data() == null) {
      throw 'User data $uid not found';
    }

    return u.User.fromJson(user.data()!);
  }

  Future<void> _onSubmitForgotPasswordAction(
    Store<AppState> store,
    SubmitForgotPasswordAction action,
  ) async {
    try {
      if (action.email.isEmpty) {
        store.dispatch(
          const ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Error',
              message: 'email harus diisi.',
            ),
          ),
        );
        return;
      }

      store.dispatch(
        const ShowDialogAction(
          barrierDismissible: false,
          destination: LoadingDialogDestination(),
        ),
      );

      await auth.sendPasswordResetEmail(
        email: action.email,
      );

      store.dispatches(
        [
          const NavigateBackAction(),
          ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Sukses',
              message:
                  'Berhasil mengirim email lupa password, cek email ${action.email} untuk melanjutkan proses lupa password',
              onTap: () => store.dispatch(
                const NavigateToRootAction(path: '/login'),
              ),
            ),
          ),
        ],
      );
    } on FirebaseAuthException catch (ex) {
      String message = ex.message ?? 'error';
      switch (ex.code.toLowerCase()) {
        case 'user-not-found':
          message = 'email belum terdaftar';
          break;
        case 'wrong-password':
          message = 'password salah';
          break;
        case 'invalid_login_credentials':
          message = 'email atau password salah';
          break;
      }
      store.dispatches(
        [
          const NavigateBackAction(),
          ShowDialogAction(
            destination: InfoDialogDestination(
              title: 'Error',
              message: message,
            ),
          ),
        ],
      );
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

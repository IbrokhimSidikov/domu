import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domu/features/auth/cubit/auth_state.dart';
import 'package:domu/features/auth/data/auth_manager.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthManager _authManager;

  AuthCubit(this._authManager) : super(const AuthState.initial());

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    try {
      final isAuth = await _authManager.isAuthenticated();
      if (isAuth) {
        final userId = await _authManager.getCurrentUserId();
        if (userId != null) {
          emit(AuthState.authenticated(userId: userId));
        } else {
          emit(const AuthState.unauthenticated());
        }
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(const AuthState.loading());
    try {
      await _authManager.signIn(email, password);
      final userId = await _authManager.getCurrentUserId();
      if (userId != null) {
        emit(AuthState.authenticated(userId: userId));
      } else {
        emit(const AuthState.error(message: 'Failed to get user ID'));
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    try {
      await _authManager.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }
}
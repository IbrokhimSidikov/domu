import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domu/features/splash/cubit/splash_state.dart';
import 'package:domu/features/auth/data/auth_manager.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthManager _authManager;

  SplashCubit(this._authManager) : super(const SplashState.initial());

  Future<void> initialize() async {
    emit(const SplashState.loading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      
      final isAuthenticated = await _authManager.isAuthenticated();
      if (isAuthenticated) {
        final userId = await _authManager.getCurrentUserId();
        if (userId != null) {
          emit(const SplashState.authenticated());
        } else {
          emit(const SplashState.unauthenticated());
        }
      } else {
        emit(const SplashState.unauthenticated());
      }
    } catch (e) {
      emit(SplashState.error(message: e.toString()));
    }
  }
}

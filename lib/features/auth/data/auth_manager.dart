class AuthManager {
  Future<String?> getCurrentUserId() async {
    return null;
  }

  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<bool> isAuthenticated() async {
    return false;
  }
}

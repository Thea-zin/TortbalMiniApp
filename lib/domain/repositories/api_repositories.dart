abstract class ApiRepositories {
  Future<void> login(String username, String password);
  Future<void> signInWithGmail(String username, String password);
  // Future<void> signInWithFacebook(String username, String password);
  // Future<void> matching(userID);
}

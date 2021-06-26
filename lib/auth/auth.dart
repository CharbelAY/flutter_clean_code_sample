class Authentication {
  static const LOGGED_IN = 'logged in';
  static const LOGGED_OUT = 'logged out';

  String getUserStatus(){
    return LOGGED_IN;
  }
}

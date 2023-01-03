class Network {
  static Map<String, String> getheaders(token) {
    return {
      "Content-Type": "application/json; charset=UTF-8",
      'token': token,
    };
  }
}

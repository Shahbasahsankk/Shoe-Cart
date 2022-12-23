import 'dart:io';

class InternetChecking {
  Future<bool> internetCheck() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}

class NoNetworkException {
  final String message;
  NoNetworkException({required this.message});
}

// No used in this application but written to refer in the future.
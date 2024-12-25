class AppExceptions {
  final _message;
  final _perfix;

  AppExceptions([this._message, this._perfix]);

  String toStrings() {
    return '$_message $_perfix';
  }
}

class InterNetExceptions extends AppExceptions {
  InterNetExceptions([String? message]) : super(message, 'No Internet');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Server Exception');
}

class InValidURLException extends AppExceptions {
  InValidURLException([String? message])
      : super(message, 'In Valid URL Exception');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error while communication');
}

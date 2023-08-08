class Http_Exception implements Exception {
  final String msg;
  final int statusCode;
  const Http_Exception(this.msg, this.statusCode);
  @override
  String toString() {
    return msg;
    }
  
}
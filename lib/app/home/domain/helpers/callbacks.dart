class Callbacks {
  static final List<String> _callbacksValids = ['devmaua.com', 'maua.br'];
  static bool verificaDominio(String url) {
    Uri? uri = Uri.tryParse(url);

    if (uri == null || uri.host.isEmpty) {
      return false;
    }

    return _callbacksValids.contains(uri.host);
  }
}

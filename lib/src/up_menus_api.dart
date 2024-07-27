
part of up_menus;

/// Accesspoint for the api
///
/// Example usage:
/// ```dart
///   var up_menus = UPMenusApi();
///   var establishment = up_menus.establishments.get('id');
///   var establishments = up_menus.establishments.list();
///   ...
/// ```
class UPMenusApi {
  late http.Client _client;
  late String _baseUrl;

  late Establishments _establishments;
  Establishments get establishments => _establishments;

  //constructor calling the default http client, and can receive a custom baseUrl to set the api url
  UPMenusApi({String? baseUrl, http.Client? client}) {
    _client = client ?? http.Client();
    _baseUrl = baseUrl ?? 'http://ementas.sas.up.pt:3000/api';

    _establishments = Establishments(this);
  }

  Future<String> _get(String path) {
    return _getImpl('$_baseUrl/$path');
  }

  Future<String> _getImpl(String url) async {
    return await _requestWrapper(() async =>
        await _client.get(Uri.parse(url)));
  }

  Future<String> _requestWrapper(
      Future<http.Response> Function() request) async {
    try {
      var response = await request();

      final responseBody = utf8.decode(response.bodyBytes);
      if (response.statusCode >= 400) {
        //final jsonMap = json.decode(responseBody);
        //final error = jsonMap['error'];

        //(thePeras): Create a custom package exception
        throw Exception('Could not complete request');
      }
      return responseBody;
    } catch (ex) {
      throw Exception('Could not complete request');
    }
  }

}
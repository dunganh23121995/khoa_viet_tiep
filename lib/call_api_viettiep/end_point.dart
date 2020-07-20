import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class EndPoint {
  String _host = "apps.soft.com.vn", _subpath = "viettiepapi/api";

  String _getEnveloper(String bodysoap, String action) {
    return '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
  <$action xmlns="http://tempuri.org/">
  $bodysoap
  </$action>
  </soap:Body>
</soap:Envelope>
''';
  }

  Future<http.Response> getResponse(
      {@required String moduleService = "",
        @required String action = "",
        @required String bodyaction = ""}) {
    return http.post(
        "https://" +
            _host +
            "/" +
            _subpath +
            "/" +
            moduleService +
            "?op=" +
            action,
        headers: {
          "Host": "$_host",
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/$action"
        },
        body: _getEnveloper(bodyaction, action));
  }

}

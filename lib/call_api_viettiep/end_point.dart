import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

abstract class EndPoint {
  String _host = "apps.soft.com.vn", _subpath = "viettiepapi/api";

   String action();
  String bodysoap();
  String nameModuleService();

  String _getEnveloper() {
    return '''
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
  <${action()} xmlns="http://tempuri.org/">
  ${bodysoap()}
  </${action()}>
  </soap:Body>
</soap:Envelope>
''';
  }

  Future<http.Response> getResponse() {
    return http.post(
        "https://" +
            _host +
            "/" +
            _subpath +
            "/" +
            nameModuleService()+".asmx" +
            "?op=" +
            action(),
        headers: {
          "Host": "$_host",
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://tempuri.org/${action()}"
        },
        body: _getEnveloper());
  }

   getJsonBodyfromResponse(http.Response response){
    Xml2Json xml = new Xml2Json();
    xml.parse(response.body);
    var json = xml.toParker();
    return jsonDecode(json)['soap:Envelope']['soap:Body'];
  }

}

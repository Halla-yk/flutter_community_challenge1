import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'products.dart';

class JsonServices {


  Future<Products> loadJson() async {
    var data = await http.get("https://run.mocky.io/v3/188d9248-9464-4241-ba24-e2d"
        "a025f373e?fbclid=IwAR0IbVcKbSfdZwMfT"
        "X0s9vjM-BGP0XvnJJzCqtEZzpX7DrKYRgCL5WKDnyg");
    var jasonData = json.decode(data.body);
    Products p = Products.fromJson(jasonData);

   return p;
  }
}
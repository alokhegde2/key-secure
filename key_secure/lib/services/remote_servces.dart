import 'package:key_secure/models/password.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Password>> fetchPasswords() async {
    var response = await client.get(Uri.parse("http://192.168.1.101:3000/api/v1/password/allPass"));

    if(response.statusCode == 200){
      var jsonString = response.body;
      return passwordFromJson(jsonString); //this is ceated in models/product.dart for json parsing

    }else{
      print(response.statusCode);
      //show error message
      return null;
    }
  }
}
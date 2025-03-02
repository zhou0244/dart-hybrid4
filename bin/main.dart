import 'package:main/user_class.dart' as user_class;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var userDecode = convert.jsonDecode(response.body);
      List<dynamic> userList;

      if (userDecode is List) {
        userList = userDecode;
      } else {
        userList = [userDecode];
      }

      for (var user in userList) {
        var userClass = user_class.User(
          id: user['id'].toString(),
          firstName: user['first_name'],
          lastName: user['last_name'],
        );

        userClass.printUser();
      }
    } else {
      print('Request failed: ${response.statusCode}');
    }
  } catch (err) {
    print(err);
  }
}

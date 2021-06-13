import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cbkmobil/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;

  Future userLogin() async {
    setState(() {
      visible = true;
    });
    String username = userController.text;
    String password = passwordController.text;

    var url = 'https://ogrenci.cagdasbilim.k12.tr/dist/mobildb.php/';
    var data = {
      "uid": "EwGsDaAJw2eU7jyizRrDO9WZj5LqQEwm",
      "username": username,
      "password": password,
    };

    var response = await http.post(Uri.parse(url),
        body: data, headers: {"Accept": "application/json"});
    if (jsonDecode(response.body)[0]['username'] == username) {
      final String isim = jsonDecode(response.body)[0]['adi'];
      final String soyisim = jsonDecode(response.body)[0]['soyadi'];

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(isim, soyisim)),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Hata'),
          content: const Text('hata'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Column(children: [
        Image.asset(
          'assets/images/logo1.png',
          width: 200,
          height: 200,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Öğrenci Bilgi Sistemi",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ]),
    );

    final email = TextFormField(
      controller: userController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Kullanıcı adınız",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Şifreniz",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          userLogin();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text(
          'Giriş',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}

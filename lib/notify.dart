import 'package:flutter/material.dart';

import 'api.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: FutureBuilder(
            future: bildirimgetir(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<dynamic> snap = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("hata"),
                );
              }
              return ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
                itemCount: snap.length,
                itemBuilder: (context, int index) {
                  var bildirimyazi = snap[index]["yazi"];
                  return Container(
                    height:60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/notificationprofile.png'))),
                        ),
                        title: bildirimyazi.length > 20
                            ? Text(
                                bildirimyazi.substring(0, 70) + "...",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              )
                            : Text(
                                bildirimyazi,
                                style:
                                    TextStyle(color: Colors.black, fontSize: 15),
                              ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                          child: Text("${snap[index]["tarih"]}"),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

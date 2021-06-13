import 'package:flutter/material.dart';
import 'odevDetay.dart';

import 'api.dart';

class Takvim extends StatefulWidget {
  @override
  _TakvimState createState() => _TakvimState();
}

class _TakvimState extends State<Takvim> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Gelecek Ödevler'),
                          Tab(text: 'Geçmiş Ödevler'),
                        ],
                      ),
                    ),
                    Container(
                      height: 400, //height of TabBarView
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: TabBarView(
                        children: <Widget>[
                          FutureBuilder(
                            future: Gelecekodevgetir(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              List<dynamic> snap = snapshot.data;

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.black,
                                ),
                                itemCount: snap.length,
                                itemBuilder: (context, int index) {
                                  var dersadi = "${snap[index]["ders"]}";
                                  var dersbitis = "${snap[index]["odevbitis"]}";

                                  return GestureDetector(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.yellow,
                                                  width: 4)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dersadi,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              dersbitis,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child:
                                              Icon(Icons.arrow_forward_rounded),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 5,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OdevDetay(
                                                  dersadi, dersbitis)));
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          FutureBuilder(
                            future: Gecmisodevgetir(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              List<dynamic> snap = snapshot.data;

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("ders"),
                                );
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) => Divider(
                                  color: Colors.black,
                                ),
                                itemCount: snap.length,
                                itemBuilder: (context, int index) {
                                  var dersadi = "${snap[index]["ders"]}";
                                  var dersbitis = "${snap[index]["odevbitis"]}";
                                  var check = snap[index]["ders"];
                                  return GestureDetector(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: check == "1"
                                                    ? Color(0xFF5BBA30)
                                                    : Color(0xFFFF0000),
                                                width: 4),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dersadi,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              dersbitis,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child:
                                              Icon(Icons.arrow_forward_rounded),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 5,
                                          color: check == "1"
                                              ? Color(0xFF5BBA30)
                                              : Color(0xFFFF0000),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OdevDetay(
                                                  dersadi, dersbitis)));
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

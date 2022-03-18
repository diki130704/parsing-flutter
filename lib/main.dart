import 'dart:convert';

import 'package:ppdb/sample_json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppdb/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfilePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      // _jsonContent = sample.toString();
      _name = sample.name.toString();
      _age = sample.age.toString();
      _gender = sample.gender.toString();
      _hobi = sample.hobi!.toList();
      _github = sample.github!.toString();
      _articles = sample.articles.toString();
      _contact = sample.contact.toString();
    });
  }

  // late String _jsonContent = "";
  late String _name = "";
  late String _age = "";
  late String _gender = "";
  List _hobi = [];
  late String _github = "";
  late String _articles = "";
  late String _contact = "";

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Json'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _loadSampleJson();
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.lightBlueAccent,
                          Colors.blueAccent
                        ]),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Read JSON File"),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 12.0),
              //   child: Text(
              //     _jsonContent,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Nama : " + _name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Umur : " + _age,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Jenis Kelamin : " + _gender,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _hobi.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.lightBlueAccent,
                          height: 20,
                          width: 400,
                          child: Text(_hobi[index].toString()),
                        ),
                      );
                    },
                  ),
                ],
              ),

              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Github : " + _github,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Articles : " + _articles,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent]),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "Contact : " + _contact,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
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

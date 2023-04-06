import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './asyncTesting.dart';

class CharsPage extends StatefulWidget {
  @override
  State<CharsPage> createState() => _CharsPageState();
}

class _CharsPageState extends State<CharsPage> {
  List chars = [];
  var tt = true;

  Future<void> getAllChars() async {
    var charArr = await getChars();
    setState(() {
      chars = charArr['results'];
    });
  }

  void initData() async {
    await getAllChars();
  }

  void toggleTt() {
    setState(() {
      tt = !tt;
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    String str = '';
    if (tt == true) {
      str = 'true';
    } else {
      str = 'false';
    }
    return ListView(
      semanticChildCount: 3,
      padding: const EdgeInsets.all(20),
      children: [
        ElevatedButton(
            onPressed: () {
              toggleTt();
            },
            child: Text(str)),
        for (var char = 0; char <= chars.length - 1; char++)
          Column(
            children: [
              Image.network(chars[char]['image'].toString()),
              SizedBox(width: 20),
              Text(chars[char]['name'].toString()),
            ],
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:httpreq/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var url = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    final response = await http.get(url);
    data = jsonDecode(response.body);
    // print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Fetch Data'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Constants.prefs.setBool('loggedIn', false);
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: data != null
            ? ListView.builder(
                // itemCount: data.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text('ID: ${data[index]['id']}'),
                    leading: Image.network(data[index]['url']),
                  ),
                );
              })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

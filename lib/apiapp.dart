import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List users = [];
  bool isloading = false;

  Future<void> fatchUsers() async {
    setState(() {
      isloading = true;
    });
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() {
      isloading = false;
    });
    if (response.statusCode == 200) {
      users = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("User List"),
          centerTitle: true,
        ),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          user['name'][0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        user['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'UserName : ${user['username']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Email : ${user['email']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Phone : ${user['phone']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Website : ${user['website']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'Address : ${user['address']['city']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}

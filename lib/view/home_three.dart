import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/model/users_model.dart';
import 'package:http/http.dart' as http;

class HomeThree extends StatefulWidget {
  const HomeThree({super.key});

  @override
  State<HomeThree> createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
  List<UsersModel> userList = [];

  Future<List<UsersModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print("==========$i");
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReusbaleRow(
                                  title: 'Name',
                                  value: snapshot.data![index].name.toString()),
                              ReusbaleRow(
                                  title: 'Username',
                                  value: snapshot.data![index].username.toString()),
                              ReusbaleRow(
                                  title: 'email',
                                  value: snapshot.data![index].email.toString()),
                              ReusbaleRow(
                                  title: 'Address',
                                  value: snapshot.data![index].address!.city.toString()),
                              ReusbaleRow(title: 'Lat Lng', value: snapshot.data![index].address!.geo!.lat.toString() + "  " + snapshot.data![index].address!.geo!.lng.toString())

                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, value;

  ReusbaleRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}

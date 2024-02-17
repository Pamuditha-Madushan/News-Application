// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final List<UserDetails> _searchResult = [];
  final List<UserDetails> _userDetails = [];
  TextEditingController controller = TextEditingController();

  // Get json result and convert it to model. Then add
  Future<void> getUserDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map user in responseJson) {
        _userDetails.add(UserDetails.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  Widget _buildUsersList() {
    return ListView.builder(
      itemCount: _userDetails.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                _userDetails[index].profileUrl,
              ),
            ),
            title: Text(
                '${_userDetails[index].firstName} ${_userDetails[index].lastName}'),
          ),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, i) {
        return Card(
          margin: const EdgeInsets.all(0.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                _searchResult[i].profileUrl,
              ),
            ),
            title: Text(
                '${_searchResult[i].firstName} ${_searchResult[i].lastName}'),
          ),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
            color: Theme.of(context).primaryColor, child: _buildSearchBox()),
        Expanded(
            child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                ? _buildSearchResults()
                : _buildUsersList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in _userDetails) {
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) _searchResult.add(userDetail);
    }

    setState(() {});
  }
}

const String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) {
    return UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}

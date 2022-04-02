import 'dart:math';

import 'package:charity/screens/charity_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/charity.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
  static const routeName = '/User-page';
}

class _UserPageState extends State<UserPage> {
  late List<Charity> charityList;
  TextEditingController? searchFieldController;

  List<Charity> _foundCharitys = [];

  @override
  void initState() {
    super.initState();
    charityList = Provider.of<Charitys>(context, listen: false).items;
    searchFieldController = TextEditingController();
    _foundCharitys = charityList;

  }

  @override
  Widget build(BuildContext context) {
    void _runFilter(String enteredValue) {
      List<Charity> results = [];
     if(enteredValue.isEmpty){
       results = charityList;
     }else {
       results = charityList.where((element) {
         final nameSearch = element.name.toLowerCase();
         final citySearch = element.location.toLowerCase();
         final tagSearch = element.tag.toLowerCase();
         return  nameSearch.contains(enteredValue.toLowerCase()) | citySearch.contains(enteredValue.toLowerCase()) | tagSearch.contains(enteredValue.toLowerCase());

       }).toList();
     }
     setState(() {
       _foundCharitys = results;
     });


    }

    return Scaffold(
        body: Container(
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              controller: searchFieldController,
              decoration: InputDecoration(
                  labelText: 'search',
                  hintText: 'search...(name, city, tag)',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
        ),
        Expanded(
          child: _foundCharitys.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: _foundCharitys.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 10,
                      shadowColor: Colors.orange,
                      child: ListTile(
                        title:
                            Text('charityName: ${_foundCharitys[index].name}'),
                        subtitle: Column(children: [
                          Align(
                            child: Text(
                                'tag: ${_foundCharitys[index].tag}'),
                            alignment: Alignment.centerLeft,
                          ),
                        Align(
                            child: Text(
                                'City: ${_foundCharitys[index].location}'),
                          alignment: Alignment.centerLeft,
                          ),
                        ],),
                        leading:
                            CircleAvatar(child: Icon(Icons.account_balance)),
                        trailing: Image.asset(
                          'assets/arrowright.png',
                          height: 35,
                          width: 35,
                        ),
                        onTap: () => Navigator.of(context).pushNamed(
                            CharityDetail.routeName,
                            arguments: <String, dynamic>{
                              'role': 'User',
                              'id': _foundCharitys[index].id
                            }),
                      ),
                    );
                  })
              : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
        ),
      ]),
    ));
  }
}

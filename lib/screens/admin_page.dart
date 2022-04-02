import 'package:charity/models/donations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charity/screens/addCharity.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
  static const routeName = 'Admin-page';
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    List<DonationInfo> donations = Provider.of<Donations>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin page'),
      ),
      body: ListView.builder(
         itemCount: donations.length,
          itemBuilder: (context, index){
            return Material(
              elevation: 10,
              shadowColor: Colors.orange,
              child: ListTile(
                title:
                Text('contributerName: ${donations[index].contributerName}'),
                subtitle: Column(children: [
                  Align(
                    child: Text(
                        'charityName: ${donations[index].charityName}'),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(
                        'donationAmount: ${donations[index].donationAmount}'),
                    alignment: Alignment.centerLeft,
                  ),
                ],),
                leading:
                CircleAvatar(child: Icon(Icons.person)),

              ),
            );
          }

      ),
      floatingActionButton: FloatingActionButton(

        elevation: 10,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, AddCharity.routeName);
        },
      ),
    );
  }
}

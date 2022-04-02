import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charity/models/charity.dart';

import 'donation_page.dart';

class CharityDetail extends StatefulWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  _CharityDetailState createState() => _CharityDetailState();
  static const routeName = '/charity-detail';
}

class _CharityDetailState extends State<CharityDetail> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final loadedCharity =
        Provider.of<Charitys>(context, listen: false).findByid(args['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'charityName: ${loadedCharity.name}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/charity.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Align(
              child: Text(
                'we are: ${loadedCharity.name}Charity',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.orange),
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('workField: ${loadedCharity.tag}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.orange)),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('city: ${loadedCharity.location}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.orange)),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 10,),
            Align(
              child: Text(
                'amount of donation: \$${loadedCharity.amountOfDonation.toString()}',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  fontSize: 20,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(children: [
                Align(
                  child: Text(
                    'about Charity :',
                    style: TextStyle(
                        fontSize: 16,
                        backgroundColor: Colors.orange,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Text(
                  loadedCharity.about,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),

              OutlinedButton(
                    child: Text(
                      'click for Donation',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, DonationPage.routeName, arguments: args['id']);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                  )

          ],
        ),
      ),
    );
    ;
  }
}

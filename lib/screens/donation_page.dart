import 'package:charity/screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charity/models/charity.dart';
import 'package:charity/models/donations.dart';
import 'dart:math';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
  static const routeName = 'Donation_page';
}

class _DonationPageState extends State<DonationPage> {
  double _currentSliderValue = 20;
  TextEditingController nameController = TextEditingController();
  TextEditingController charityNameController = TextEditingController();
  TextEditingController sliderController = TextEditingController();
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final charityId = ModalRoute.of(context)!.settings.arguments as dynamic;
    final charity =
        Provider.of<Charitys>(context, listen: false).findByid(charityId);
    setState(() {
      charityNameController.text = charity.name;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('donate for ${charity.name} charity'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'your name',
                    hintText: 'enter your name'),
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (value.contains(',') ||
                      value.contains(RegExp(r'[0-9]'))) {
                    return 'Invalid name';
                  } else
                    return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_balance),
                  labelText: 'charityName',
                  hintText: 'charity name',
                ),
                controller: charityNameController,
                readOnly: true,
              ),
              SizedBox(
                height: 100,
              ),
              Align(
                child: Text(
                  'choose your donation amount between 0-200 \$',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.centerLeft,
              ),
              Slider(
                value: _currentSliderValue,
                onChanged: (double newValue) {
                  setState(() {
                    _currentSliderValue = newValue;
                  });
                },
                divisions:20,
                label: '\$$_currentSliderValue',
                min: 0.0,
                max: 200.0,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final String userName = nameController.text;
                    final String charityname = charityNameController.text;
                     double donationAmount = _currentSliderValue;

                    if (formKey!.currentState!.validate()) {
                      Random random = Random();
                      Provider.of<Donations>(context, listen: false)
                          .addDonation(DonationInfo(
                              id: random.nextInt(200),
                              contributerName: userName,
                              charityName: charityname,
                              donationAmount: donationAmount));
                      Provider.of<Charitys>(context, listen: false)
                          .amountOfDonation(charityId, donationAmount);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'ThankYou ${userName} for your donation , god bless you!'), backgroundColor: Colors.blue,),
                      );


                        Navigator.pushNamed(context, UserPage.routeName);



                    }
                  },
                  child: Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}

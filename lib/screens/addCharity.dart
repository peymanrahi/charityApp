import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/charity.dart';

class AddCharity extends StatefulWidget {
  const AddCharity({Key? key}) : super(key: key);

  @override
  _AddCharityState createState() => _AddCharityState();
  static const routeName = 'Add-charity';
}

class _AddCharityState extends State<AddCharity> {
  TextEditingController charityNameController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TextEditingController aboutController = TextEditingController();
  GlobalKey<FormState>? formKey;
  double _currentSliderValue =100;

  @override
  void initState() {
    formKey =  GlobalKey<FormState>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('add Charity'),),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [

              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.account_balance),
                    labelText: 'charity name',
                    hintText: 'enter charity name'),
                controller: charityNameController,
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
                    icon: Icon(Icons.title),
                    labelText: 'tagName',
                    hintText: 'enter tag name'),
                controller: tagController,
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
                    icon: Icon(Icons.add_location_alt),
                    labelText: 'city name',
                    hintText: 'enter city name'),
                controller: locationController,
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
              SizedBox(height: 20,),

              Align(
                child: Text(
                  'choose initial budjet between 0-500 \$',
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
                divisions:50,
                label: '\$$_currentSliderValue',
                min: 0.0,
                max: 500.0,
              ),

              // TextFormField(
              //   decoration: InputDecoration(
              //       icon: Icon(Icons.volunteer_activism),
              //       labelText: 'amount of donation',
              //       hintText: 'enter amount of donation'),
              //   controller: amountOfDonationController,
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "* Required";
              //     } else
              //       return null;
              //   },
              // ),

              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'about charity',
                    hintText: 'write about charity'),
                controller: aboutController,
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

              ElevatedButton(
                  onPressed: () async{

                    final charityName  = charityNameController.text;
                    final tag = tagController.text;
                    final location = locationController.text;
                   dynamic amountOfDonation = _currentSliderValue;
                   final aboutCharity = aboutController.text;

                   if(formKey!.currentState!.validate()){
                     Random random = Random();
                     Provider.of<Charitys>(context, listen: false).addCharity(Charity(id: random.nextInt(300), name: charityName, tag: tag, location: location, amountOfDonation: amountOfDonation, about: aboutCharity ));



                     ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                       content: Text(' ${charityName} added as a charity sucessfully !'), backgroundColor: Colors.blue,),
                     );


                     Navigator.of(context).pop();

                   }


                  },
                  child: Text('addCharity')
              )

            ],
          ),
        ),
      ),
    );
  }
}

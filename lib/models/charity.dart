
import 'dart:math';


import 'package:flutter/cupertino.dart';

class Charity{
  final dynamic id;
  final String name;
  final String tag;
  final String location;
  dynamic amountOfDonation;
  final String about;

  Charity( {required this.id ,required this.name, required this.tag,required this.location,required this.amountOfDonation, required this.about});


}

class Charitys with ChangeNotifier{

  List<Charity> _items = [
    Charity(
    id: 'ch1',
    name: 'madar' ,
    tag: 'marriage' ,
    location: 'shiraz',
    amountOfDonation: 225,
      about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch2',
        name: 'aftab' ,
        tag: 'children' ,
        location: 'boushehr',
        amountOfDonation: 545,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch3',
        name: 'mahak' ,
        tag: 'cancer' ,
        location: 'tehran',
        amountOfDonation: 400,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch4',
        name: 'ordibehesht' ,
        tag: 'job' ,
        location: 'tabriz',
        amountOfDonation: 225,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch5',
        name: 'bahar' ,
        tag: 'womansRight' ,
        location: 'semnan',
        amountOfDonation: 155,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch6',
        name: 'payiizz' ,
        tag: 'humansRight' ,
        location: 'zanjan',
        amountOfDonation: 252,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),

    Charity(
        id: 'ch7',
        name: 'mehr' ,
        tag: 'animalsRight' ,
        location: 'kerman',
        amountOfDonation: 852,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch8',
        name: 'aban' ,
        tag: 'climate' ,
        location: 'bandarAbbas',
        amountOfDonation: 456,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch9',
        name: 'shahrivar' ,
        tag: 'earthquake' ,
        location: 'mashhad',
        amountOfDonation: 987,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),
    Charity(
        id: 'ch10',
        name: 'farvardin' ,
        tag: 'food' ,
        location: 'ahvaz',
        amountOfDonation: 225,
        about: 'this chairty is baseed on make better life for all who need that and we are so happy to cliam that vlkmfdlkvkdv'
    ),



  ];
  List<Charity> get items {
    return [..._items];
}

Charity findByid(dynamic id){
    return _items.firstWhere((element) => element.id == id);
}

void addCharity(Charity charity){
    _items.add(charity);
    notifyListeners();
}

void amountOfDonation(dynamic id,dynamic amount){

   findByid(id).amountOfDonation += amount;

}

// double get totalAmount{
//
// }

}

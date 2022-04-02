import 'package:flutter/cupertino.dart';

class DonationInfo{
  final dynamic id;
  final String contributerName;
  final String charityName;
  dynamic donationAmount;
  DonationInfo({required this.id, required this.contributerName, required this.charityName, required this.donationAmount});
}

class Donations with ChangeNotifier{
  List<DonationInfo> _items= [];
  List<DonationInfo> get items {
    return [..._items];
  }

  void addDonation(DonationInfo donation){
    _items.add(donation);
    notifyListeners();
  }


}
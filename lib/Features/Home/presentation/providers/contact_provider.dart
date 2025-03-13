import 'package:flutter/material.dart';
import 'package:payonz/Features/Home/data/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [
    Contact(name: 'Bala', profilePic: ''),
    Contact(name: 'Bharathi', profilePic: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGD0BcxwuvdI1H-S35GmT43vP2MBIdCgyeIA&s'),
    Contact(name: 'Ram', profilePic: ''),
    Contact(name: 'Karthik', profilePic: ''),
    Contact(name: 'Muthu', profilePic: ''),
    Contact(name: 'Mani', profilePic: ''),
    Contact(name: 'Abi', profilePic: ''),
  ];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
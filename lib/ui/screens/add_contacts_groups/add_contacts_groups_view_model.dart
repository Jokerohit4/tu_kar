import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tu_kar/services/storage/firebase_storage.dart';

class AddContactsGroupsViewModel extends ChangeNotifier {

  List<Contact> get userContacts => _userContacts;
  List<Contact> get notUserContacts => _notUserContacts;



  List<Contact>? _contacts;
  final List<Contact> _userContacts = [];
  final List <Contact> _notUserContacts = [];
  final _firebaseStorage = FirebaseStorage();


  Future<void> getContacts() async {
    // Attempt to load cached contacts first
    final prefs = await SharedPreferences.getInstance();
    final String? cachedContactsJson = prefs.getString('cachedContacts');
   //  if (cachedContactsJson != null) {
   //    debugPrint("adswaezsxcftgbyhunji");
   //    debugPrint(cachedContactsJson);
   //    List<dynamic>  decoded = json.decode(cachedContactsJson);
   //    debugPrint(decoded.toString());
   //    debugPrint("99999999999999999999");
   //    _contacts = decoded;
   // //  _contacts = decoded.map<Contact>((e) => Contact.fromMap(Map<String, dynamic>.from(e))).toList();
   //    notifyListeners(); // Notify listeners to rebuild the UI with cached contacts
   //  }

    // Fetch contacts from the device
    Iterable<Contact> contactsIterable = await ContactsService.getContacts();
    _contacts = contactsIterable.toList();
    final friendPhoneNumber = await _firebaseStorage.fetchFriendPhoneNumbers().then((friendPhoneNumbers) {
      if (_contacts != null) {
        for (var contact in _contacts!) {
          if (contact.phones != null) {
            for (var phoneNumber in contact.phones!) {
              if (friendPhoneNumbers.contains(phoneNumber.value)) {
                _userContacts.add(contact);
              }
              else {
                _notUserContacts.add(contact);
              }
            }
          }
        }
      }
    });
    // Cache the newly fetched contacts
    final String encoded = json.encode(
        _contacts!.map((e) => e.toMap()).toList());
    await prefs.setString('cachedContacts', encoded);

    notifyListeners(); // Notify listeners to rebuild the UI with fresh contacts
  }


  bool get  isChecked => _isChecked;
  bool _isChecked =  false;

  void onTapContact(bool val, bool isGroup,bool toBeInvited){
   toBeInvited ?  isGroup ? _onTapGroup(val) : _onTapFriend() : _inviteTheBuddy();
  }


  void _onTapGroup(bool val){
    _isChecked = val;
    notifyListeners();
  }

  void _onTapFriend(){

  }

  void _inviteTheBuddy(){

  }




}
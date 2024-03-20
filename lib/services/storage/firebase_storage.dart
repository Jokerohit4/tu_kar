

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';

class FirebaseStorage{

  static CollectionReference users = FirebaseFirestore.instance.collection(StringConstants.user);
  CollectionReference friends = users.doc().collection(StringConstants.friends);


  void addTask(Map task) {
    CollectionReference tasks = friends.doc().collection(StringConstants.task);
    tasks
        .add(task)
        .then((value) => debugPrint("Task Added"))
        .catchError((error) => debugPrint("Failed to add task: $error"));
  }

  void addUser(Map user){
    users
        .add(user)
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  void addFriend(Map friend) {
    friends
        .add(friend)
        .then((value) => debugPrint("Friend Added"))
        .catchError((error) => debugPrint("Failed to add friend: $error"));
  }


  Future<Set<String>> fetchFriendPhoneNumbers() async {
    final querySnapshot = await FirebaseFirestore.instance.collection(StringConstants.user).get();
    final phoneNumbers = <String>{};

    for (var doc in querySnapshot.docs) {
      final phoneNumber = doc.data()['contact no.'] as String?;
      if (phoneNumber != null) {
        phoneNumbers.add(phoneNumber);
      }
    }

    return phoneNumbers;
  }



}
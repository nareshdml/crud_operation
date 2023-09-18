import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../view/data_model.dart';

class Detailspage extends ChangeNotifier {
  //fetching data
  List<ReadData> newDataList = [];
  Future<List<ReadData>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("MyStudents").get();
    newDataList.clear();
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      final newData = ReadData.fromJson(data);
      newDataList.add(newData);
    }
    notifyListeners();
    return newDataList;
  }

  //delete
  deleteDate(String? sid) {
    DocumentReference deleteDocumentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(sid);
    deleteDocumentReference.delete().whenComplete(
          () => (),
        );
  }
}

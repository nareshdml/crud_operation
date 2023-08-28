import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/modules/features/home/view/data_model.dart';
import 'package:flutter/material.dart';

// import '../view/data_model.dart';

class CreateData extends ChangeNotifier {
  createData(String studentNames, String studentID, String studyProgramID,
      double studentGPA) async {
    // print("Created");
    CollectionReference createDocumentReference =
        FirebaseFirestore.instance.collection("MyStudents");
    Map<String, dynamic> students = {
      'studentName': studentNames,
      'studentId': studentID,
      'studyProgramId': studyProgramID,
      'studentGpa': studentGPA,
    };

    DocumentReference doc = await createDocumentReference.add(students);

    String docID = doc.id;
    students["sid"] = docID;
    await doc.update(students);
  }

  //read
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
  //

  //delete
  deleteDate(String? sid) {
    DocumentReference deleteDocumentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(sid);
    deleteDocumentReference.delete().whenComplete(
          () => (),
        );
  }
}

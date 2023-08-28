import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<dynamic> newDataList = [];
  fetchData() {
    FirebaseFirestore.instance
        .collection("MyStudents")
        .snapshots()
        .listen((event) {
      for (var data in event.docs) {
        newDataList.add(data);
      }
    });
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

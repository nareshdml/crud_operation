import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData extends ChangeNotifier {
  Future<void> updateData(
      String sid,
      String updateStudentName,
      String updateStudentId,
      String updateStudyProgramId,
      double updateStudentGpa) async {
    try {
      // Get a reference to the document you want to update
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("MyStudents").doc(sid);

      await docRef.update({
        "studentName": updateStudentName,
        "studentId": updateStudentId,
        "studyProgramId": updateStudyProgramId,
        "studentGpa": double.tryParse(updateStudentGpa.toString()),
      });

      print("Data updated successfully");
    } catch (e) {
      print("Error updating data: $e");
    }
  }
}

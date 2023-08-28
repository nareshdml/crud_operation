import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/updatepage_viewmodel.dart';

class UpdatePage extends StatefulWidget {
  String? studentName;
  String? studentId;
  String? studyProgramId;
  String? studentGpa;
  String? sid;
  UpdatePage({
    this.studentName,
    this.studentId,
    this.studyProgramId,
    this.studentGpa,
    this.sid,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController updateStudentNameController =
      TextEditingController(text: widget.studentName);
  late TextEditingController updateStudentIdController =
      TextEditingController(text: widget.studentId);
  late TextEditingController updateStudyProgramIdController =
      TextEditingController(text: widget.studyProgramId);
  late TextEditingController updateStudentGpaController =
      TextEditingController(text: widget.studentGpa);
  @override
  Widget build(BuildContext context) {
    final providerUpdateData = Provider.of<UpdateData>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Update Student Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: updateStudentNameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: updateStudentIdController,
                decoration: const InputDecoration(
                  labelText: "Student ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: updateStudyProgramIdController,
                decoration: const InputDecoration(
                  labelText: "Study Program ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: updateStudentGpaController,
                decoration: const InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(
                    16,
                  ),
                ),
              ),
              onPressed: () async {
                await providerUpdateData.updateData(
                  widget.sid ?? "",
                  updateStudentNameController.text,
                  updateStudentIdController.text,
                  updateStudyProgramIdController.text,
                  double.parse(updateStudentGpaController.text),
                );
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}

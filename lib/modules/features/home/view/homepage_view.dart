import 'package:crud_operation/app/routes/routes_constant.dart';
import 'package:crud_operation/modules/features/home/view_model/homepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<CreateData>(context, listen: false);
    });
    super.initState();
  }

// creating TextEditingController
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studyProgramIdController = TextEditingController();
  TextEditingController studentGpaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerCreateData = Provider.of<CreateData>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Flutter Colleague"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              //textformField
              child: TextFormField(
                controller: studentNameController,
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
                controller: studentIdController,
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
                controller: studyProgramIdController,
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
                controller: studentGpaController,
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
            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(
                        16,
                      ),
                    ),
                  ),
                  onPressed: () {
                    providerCreateData.createData(
                      studentNameController.text,
                      studentIdController.text,
                      studyProgramIdController.text,
                      double.parse(studentGpaController.text),
                    );
                    studentNameController.clear();
                    studentIdController.clear();
                    studentGpaController.clear();
                    studyProgramIdController.clear();
                  },
                  child: const Text("Register Student"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(
                        16,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // await providerCreateData.fetchData();
                    Navigator.pushNamed(context, AppRoutesConstant.detailsPage);
                  },
                  child: const Text("Student List"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

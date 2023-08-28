import 'package:crud_operation/app/routes/routes_constant.dart';
import 'package:crud_operation/modules/features/home/view_model/homepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constant/constant.dart';

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

  //update

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
                  child: const Text("Create"),
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
                  onPressed: () async {
                    await providerCreateData.fetchData();
                  },
                  child: const Text("Read"),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: providerCreateData.newDataList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Student Name: ${providerCreateData.newDataList[index].studentName}",
                                style: textBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Student ID: ${providerCreateData.newDataList[index].studentId}",
                                style: textBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Study Program ID: ${providerCreateData.newDataList[index].studyProgramId}",
                                style: textBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Student GPA: ${providerCreateData.newDataList[index].studentGpa}",
                                style: textBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(16),
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                          16,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AppRoutesConstant.updatePage,
                                          arguments: {
                                            'sid': providerCreateData
                                                .newDataList[index].sid,
                                            'studentName': providerCreateData
                                                .newDataList[index].studentName,
                                            'studentId': providerCreateData
                                                .newDataList[index].studentId,
                                            'studyProgramId': providerCreateData
                                                .newDataList[index]
                                                .studyProgramId,
                                            'studentGpa': providerCreateData
                                                .newDataList[index].studentGpa,
                                          });
                                    },
                                    child: const Text("Edit"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: const EdgeInsets.all(16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                          16,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await providerCreateData.deleteDate(
                                          providerCreateData
                                              .newDataList[index].sid);
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constant/constant.dart';
import '../../../../app/routes/routes_constant.dart';
import '../view_model/detailspage_viewmodel.dart';

class MyFlutterColleaguesDetail extends StatefulWidget {
  const MyFlutterColleaguesDetail({super.key});

  @override
  State<MyFlutterColleaguesDetail> createState() =>
      _MyFlutterColleaguesDetailState();
}

class _MyFlutterColleaguesDetailState extends State<MyFlutterColleaguesDetail> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<Detailspage>(context, listen: false).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerDetailsData = Provider.of<Detailspage>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter Colleague Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: providerDetailsData.newDataList.length,
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
                              "Student Name: ${providerDetailsData.newDataList[index].studentName}",
                              style: textBold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Student ID: ${providerDetailsData.newDataList[index].studentId}",
                              style: textBold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Study Program ID: ${providerDetailsData.newDataList[index].studyProgramId}",
                              style: textBold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Student GPA: ${providerDetailsData.newDataList[index].studentGpa}",
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
                                          'sid': providerDetailsData
                                              .newDataList[index].sid,
                                          'studentName': providerDetailsData
                                              .newDataList[index].studentName,
                                          'studentId': providerDetailsData
                                              .newDataList[index].studentId,
                                          'studyProgramId': providerDetailsData
                                              .newDataList[index]
                                              .studyProgramId,
                                          'studentGpa': providerDetailsData
                                              .newDataList[index].studentGpa,
                                        });
                                    providerDetailsData.fetchData();
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
                                    await providerDetailsData.deleteDate(
                                        providerDetailsData
                                            .newDataList[index].sid);
                                    providerDetailsData.fetchData();
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
          ),
        ],
      ),
    );
  }
}

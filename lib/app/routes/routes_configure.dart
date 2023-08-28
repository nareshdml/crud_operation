import 'package:crud_operation/app/routes/routes_constant.dart';
import 'package:crud_operation/modules/features/home/view_model/updatepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules/features/home/view/homepage_view.dart';
import '../../modules/features/home/view/update_view.dart';
import '../../modules/features/home/view_model/homepage_viewmodel.dart';

class AppRoutesConfiure {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesConstant.homePAge:
        return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (create) => CreateData(),
              ),
            ],
            child: const MyApp(),
          ),
        );
      case AppRoutesConstant.updatePage:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (create) => UpdateData(),
                      ),
                    ],
                    child: UpdatePage(
                      studentName: arg["studentName"],
                      studentId: arg["studentId"],
                      studyProgramId: arg["studyProgramId"],
                      studentGpa: arg["studentGpa"].toString(),
                      sid: arg["sid"],
                    )));
      default:
        return MaterialPageRoute(
          builder: (_) => const MyApp(),
        );
    }
  }
}

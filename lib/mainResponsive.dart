import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/views/admin.dart';

class MainResponsiveScaleFactor extends StatelessWidget {
  const MainResponsiveScaleFactor({super.key});

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final double textScaleFactor = query.textScaleFactor.clamp(0.8, 1.4);
    return MediaQuery(data: query.copyWith(
      textScaler: TextScaler.linear(textScaleFactor.clamp(0.8, 1.4),),

    ), child: Theme(data: ThemeData.light(), child: Admin()));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'package:inventorio_web/admin/listeners/sizeSideMenu.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/visualStats.dart';

import '../listeners/sideBarHeight.dart';
import '../widgetsAdmin/activityStats/activityStats.dart';
import '../widgetsAdmin/header.dart';
import '../widgetsAdmin/appBar.dart';
import '../widgetsAdmin/sideMenu.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  SideBarHeightListener sideBarHeightListener = SideBarHeightListener();
  ChangeSizeSideMenu changeSizeSideMenu = ChangeSizeSideMenu();
  BreakPoint breakPoint = BreakPoint();
  double containerSideMenuWidth = 200;
  bool expandedMenu = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 150),
            width: breakPoint.valor!= 1 && breakPoint.valor != 2 ? 0 :  expandedMenu ? containerSideMenuWidth : 80,
            child: SideMenu(
              containerSideMenuWidth: containerSideMenuWidth,
              sideBarHeightListener: sideBarHeightListener,
              changeSizeSideMenu: changeSizeSideMenu,
              breakPoint: breakPoint,
            ),
          ),
          Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  color: Colors.transparent,child:
              AppBarAdmin(
                breakPoint: breakPoint,
                onAsignHeightHeader: (heigthHeader) {
                setState(() {
                  sideBarHeightListener.setValue(heigthHeader!);

                });
              },
                onChangeSizeSideMenu: (changeSize) {
                  setState(() {
                    expandedMenu = changeSize;
                    changeSizeSideMenu.setValue(changeSize);
                  });

              },),),
               Flexible(
                   child: SingleChildScrollView(
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Flexible(
                         child: Header(
                           breakPoint: (breakPoint) {
                           this.breakPoint.setValue(breakPoint);
                         },)),
                     Flexible(
                         child: VisualStats(
                           breakPoint: breakPoint
                     )),
                     Flexible(
                         child: Activitystats(
                           breakPoint: breakPoint
                     )),
                   ],
                 ),
               ))
            ],
          )),
        ],
      ));
  }
}

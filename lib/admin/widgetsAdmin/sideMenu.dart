import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'package:inventorio_web/admin/listeners/sideBarHeight.dart';
import 'package:inventorio_web/admin/listeners/sizeSideMenu.dart';

class SideMenu extends StatefulWidget {
  final SideBarHeightListener sideBarHeightListener;
  final ChangeSizeSideMenu changeSizeSideMenu;
  final BreakPoint breakPoint;
  final double containerSideMenuWidth;
  const SideMenu({super.key, required this.sideBarHeightListener, required this.changeSizeSideMenu, required this.breakPoint, required this.containerSideMenuWidth});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  double? sideMenuHeight;
  bool expandedSideMenu = true;
  int breakPoint = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.sideBarHeightListener.registrarObservador((value) {
      setState(() =>sideMenuHeight = value);});
    widget.changeSizeSideMenu.registrarObservador((changeSize) {
      setState(() =>expandedSideMenu = changeSize);});
    widget.breakPoint.registrarObservador((breakPoint) {
      if(this.breakPoint != breakPoint && breakPoint != 0){
        this.breakPoint = breakPoint;
        setState(() => this.breakPoint = breakPoint);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains){
      return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: breakPoint != 1 && breakPoint != 2 ? 0 :  expandedSideMenu ? widget.containerSideMenuWidth : 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Colors.black54.withOpacity(0.1),
              width: 1.2,
            ),
            right: BorderSide(
              color: Colors.black54.withOpacity(0.1),
              width: 1.2,
            ),
            bottom: BorderSide(
              color: Colors.black54.withOpacity(0.1),
              width: 1.2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: sideMenuHeight ?? 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black54.withOpacity(0.1),
                      width: 1.2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_alarm_rounded),
                      SizedBox(width: expandedSideMenu ? 10 : 0,),
                      if (expandedSideMenu)
                      const Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            'KodaSolv',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  )

              ),
            Visibility(
              visible: breakPoint != 1 ? breakPoint != 2 ? false : true : true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: expandedSideMenu ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                          return states.contains(WidgetState.hovered) ? Colors.blue : Colors.black;
                        }),
                      ),
                      child: Builder(
                        builder: (context) {
                          final color = DefaultTextStyle.of(context).style.color ?? Colors.black;
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.menu, color: color), // Asegura que el icono tome el color correcto
                              SizedBox(width: 5),
                              Visibility(
                                visible: expandedSideMenu ? true : false,
                                child: Text('Menu'),),],);},),),],),),),],),);});
  }
}

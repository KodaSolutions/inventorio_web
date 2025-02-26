import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'dart:math' as math;

class AppBarAdmin extends StatefulWidget {
  final Function(double?) onAsignHeightHeader;
  final Function(bool) onChangeSizeSideMenu;
  final BreakPoint breakPoint;
  const AppBarAdmin({super.key, required this.onAsignHeightHeader, required this.onChangeSizeSideMenu, required this.breakPoint});

  @override
  State<AppBarAdmin> createState() => _AppBarAdminState();
}

class _AppBarAdminState extends State<AppBarAdmin> with SingleTickerProviderStateMixin {

  late AnimationController aniController;
  late Animation<double> rotation;
  double? heightContainer;
  bool expandedSideMenu = true;
  final GlobalKey _keyContainer = GlobalKey();
  int breakPoint = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aniController = AnimationController(vsync: this, duration:  const Duration(milliseconds: 4900),);
    rotation = Tween(begin: 0.0, end:  4.0 * math.pi).animate(aniController);
    WidgetsBinding.instance.addPostFrameCallback((_){
      heightContainer = _keyContainer.currentContext!.size!.height;
      widget.onAsignHeightHeader(heightContainer);
    });
    widget.breakPoint.registrarObservador((breakPoint) {
      if(this.breakPoint != breakPoint && breakPoint != 0){
        this.breakPoint = breakPoint;
        aniController.forward();
        setState(() => this.breakPoint = breakPoint);
      }
    });
    aniController.addListener((){
      if(aniController.status == AnimationStatus.completed){
        aniController.repeat();
      }
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains){
      return Container(
        key: _keyContainer,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                SizedBox(width: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    expandedSideMenu ? expandedSideMenu = false : expandedSideMenu = true;
                    widget.onChangeSizeSideMenu(expandedSideMenu);

                  });
                }, icon: Icon(Icons.menu)),
                Visibility(
                  visible:  breakPoint != 3 && breakPoint != 4,
                  child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  width: constrains.maxWidth * 0.35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,
                        color: Colors.black.withOpacity(0.3),),
                      hintText: 'Buscar',
                      hintStyle: TextStyle(
                        color: Colors.black54.withOpacity(0.3),
                      ),
                      filled: true,
                      fillColor: Colors.blue[50],
                      isCollapsed: true,
                      contentPadding: EdgeInsets.only(
                        top: 11.5,
                        bottom: 11.5,
                        left: 11.5,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black54.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black54.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black54.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black54.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),),
              ],
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(height: 60,),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.nights_stay_outlined)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.email)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.zoom_out_map)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                SizedBox(width: 10,),
                const CircleAvatar(
                    radius: 15
                ),
                SizedBox(width: 10,),
                AnimatedBuilder(
                    animation: aniController,
                    child: IconButton(
                        onPressed: (){}, icon: const Icon(CupertinoIcons.gear,
                    size: 28)),
                    builder: (context, gearRot){
                  return Transform.rotate(angle: rotation.value, child: gearRot);
                }),
                const SizedBox(width: 10,),
              ],
            )
          ],
          //Flexible(child: IconButton(onPressed: (){}, icon: Icon(Icons.menu))),
          //Spacer(),
        ),
      );
    });
  }
}

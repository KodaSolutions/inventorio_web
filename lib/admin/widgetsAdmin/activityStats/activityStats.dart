import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'package:inventorio_web/admin/widgetsAdmin/activityStats/widgets/recentCustomers.dart';
import 'package:inventorio_web/admin/widgetsAdmin/activityStats/widgets/recentOrders.dart';
import 'package:inventorio_web/admin/widgetsAdmin/activityStats/widgets/salesActivity.dart';


class Activitystats extends StatefulWidget {
  final BreakPoint breakPoint;
  const Activitystats({super.key, required this.breakPoint});

  @override
  State<Activitystats> createState() => _ActivitystatsState();
}

class _ActivitystatsState extends State<Activitystats> {

  late int breakPoint = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.breakPoint.registrarObservador((breakPoint) {
        if(breakPoint != 0 && mounted){
          setState(()=> this.breakPoint = breakPoint);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(breakPoint == 0){
      return const CircularProgressIndicator();
    } else if (breakPoint == 1){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: RecentCustomers()),
            spaceHorizontal(),
            Flexible(child: SalesActivity()),
            spaceHorizontal(),
            Flexible(child: RecentOrders()),
          ],
        ),
      );
    }else if(breakPoint == 2) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(child: RecentCustomers()
                )]),
            spaceVertical(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SalesActivity()),
                spaceHorizontal(),
                const Expanded(child: RecentOrders()),
              ],
            ),
          ],
        ),
      );
    } else if(breakPoint == 3 || breakPoint == 4){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: RecentCustomers()
                  )]),
            spaceVertical(),
            const Row(
                children: [
                  Expanded(child: SalesActivity()
                  )]),
            spaceVertical(),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: RecentOrders()),
              ],
            ),
          ],
        ),
      );
    }
    else {
      return CircularProgressIndicator();
    }
    /*return breakPoint == 0 ? CircularProgressIndicator() :
    Container(
      padding: EdgeInsets.all(25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: RecentCustomers()),
          spaceHorizontal(),
          Flexible(child: SalesActivity()),
          spaceHorizontal(),
          Flexible(child: RecentOrders()),
        ],
      ),
    );*/
  }

  Widget spaceHorizontal (){
    return SizedBox( width: 10,);
  }
  Widget spaceVertical (){
    return SizedBox( height: 25);
  }
}

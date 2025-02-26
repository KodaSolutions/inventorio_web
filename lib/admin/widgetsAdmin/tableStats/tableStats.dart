import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'package:inventorio_web/admin/widgetsAdmin/tableStats/recentEarnings.dart';
import 'package:inventorio_web/admin/widgetsAdmin/tableStats/topClients.dart';

class TableStats extends StatefulWidget {
  final BreakPoint breakPoint;
  const TableStats({super.key, required this.breakPoint});

  @override
  State<TableStats> createState() => _TableStatsState();
}

class _TableStatsState extends State<TableStats> {

  int breakPoint = 0;


  @override
  void initState() {
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
    } else if(breakPoint == 1 || breakPoint == 2){
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20,
          vertical: breakPoint == 2 ? 25 : 0,
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: TopClients(),
            ),
            Expanded(child: RecenteEarnings(),
            ),
          ],
        ),
      );
    } else if (breakPoint == 3 || breakPoint ==4){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:  25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopClients(),
            spaceVertical(),
            const RecenteEarnings(),
          ],
        ),
      );
    }else {
      return const CircularProgressIndicator();
    }
  }
  Widget spaceVertical (){
    return const SizedBox(
      height: 25,
    );
  }
}

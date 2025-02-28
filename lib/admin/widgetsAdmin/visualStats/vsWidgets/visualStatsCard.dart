import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/listeners/listenerCardsHeight.dart';
import '../../infoWidgets/visualStatsInfo.dart';

class StatsCard extends StatefulWidget {
  final Function (double) onAsignHeightStatsCard;
  final CardsHeight cardsHeight;
  final VisualStatsInfo visualStatsInfo;
  final double? heightBreakPointed;

  const StatsCard({super.key, required this.visualStatsInfo, required this.onAsignHeightStatsCard, required this.cardsHeight, this.heightBreakPointed});

  @override
  _StatsCardState createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> {
  final GlobalKey _keyCardStats = GlobalKey();
  double? finalHeight;

  @override
  void initState() {
    super.initState();
    widget.heightBreakPointed != null ? finalHeight = widget.heightBreakPointed : null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _keyCardStats.currentContext?.size?.height != null) {
        widget.onAsignHeightStatsCard(_keyCardStats.currentContext!.size!.height);
      }
    });
    widget.cardsHeight.registrarObservador((finalHeight) {
      this.finalHeight = finalHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: _keyCardStats,
      color: Colors.white,
      elevation: 5,
      child: Container(
        height: finalHeight,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.visualStatsInfo.orderStatus.data.title, style: _titleStyle),
            const SizedBox(height: 10),
            Text(
              widget.visualStatsInfo.orderStatus.data.subtitle,
              style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildStatusColumn(
                  widget.visualStatsInfo.orderStatus.data.subdata_1!.title,
                  widget.visualStatsInfo.orderStatus.data.subdata_1!.subtitle,
                  widget.visualStatsInfo.orderStatus.data.subdata_1!.color,
                ),
                const SizedBox(width: 30),
                buildStatusColumn(
                  widget.visualStatsInfo.orderStatus.data.subdata_2!.title,
                  widget.visualStatsInfo.orderStatus.data.subdata_2!.subtitle,
                  widget.visualStatsInfo.orderStatus.data.subdata_2!.color,
                ),
                const SizedBox(width: 30),
                buildStatusColumn(
                  widget.visualStatsInfo.orderStatus.data.subdata_3!.title,
                  widget.visualStatsInfo.orderStatus.data.subdata_3!.subtitle,
                  widget.visualStatsInfo.orderStatus.data.subdata_3!.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatusColumn(String number, String status, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(number, style: _titleStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            const SizedBox(width: 5),
            Text(status),
          ],
        ),
      ],
    );
  }

  static const TextStyle _titleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
}

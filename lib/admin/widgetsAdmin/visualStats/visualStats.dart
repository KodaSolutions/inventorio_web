import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/listeners/breakPoint.dart';
import 'package:inventorio_web/admin/widgetsAdmin/infoWidgets/visualStatsInfo.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/vsWidgets/imgStatsCard.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/listeners/listenerCardsHeight.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/vsWidgets/visualStatsCard.dart';

class VisualStats extends StatefulWidget {
  final BreakPoint breakPoint;
  const VisualStats({super.key, required this.breakPoint});

  @override
  State<VisualStats> createState() => _VisualStatsState();
}

class _VisualStatsState extends State<VisualStats> {

  VisualStatsInfo visualStatsInfo = VisualStatsInfo();
  final CardsHeight cardsHeight = CardsHeight();
  double? heightImage;
  double? cardStatsHeight;
  double? cardImgHeight;
  double? finalHeight;
  bool isImageLoaded = false;
  int breakPoint = 0;
  double? imgScale = 6;

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void onAsignHeightImgCard (double cardImgHeight){
    this.cardImgHeight = cardImgHeight;
    if(finalHeight == null && cardStatsHeight != null && this.cardImgHeight != null){
      _measureAfterImageLoad();
    }
  }

  void onAsignHeightStatsCard (double cardStatsHeight){
    this.cardStatsHeight = cardStatsHeight;
    if(finalHeight == null && this.cardStatsHeight != null && cardImgHeight != null){
      _measureAfterImageLoad();
    }
  }

  void _measureAfterImageLoad() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
            cardImgHeight = cardImgHeight!;
            finalHeight = cardStatsHeight! > cardImgHeight! ? cardStatsHeight : cardImgHeight;
            cardsHeight.setValue(finalHeight!);
        });
      }
    });
    widget.breakPoint.registrarObservador((breakPoint) {
      if(this.breakPoint != breakPoint && breakPoint != 0){
        this.breakPoint = breakPoint;
        _measureAfterImageLoad();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return breakPoint == 0 ? const CircularProgressIndicator() :
    Container(
      child: breakPoint == 1 ? Container(
        padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: StatsCard(
                    heightBreakPointed: finalHeight,
                    cardsHeight: cardsHeight,
                    visualStatsInfo: visualStatsInfo, onAsignHeightStatsCard: onAsignHeightStatsCard)),
            spaceHorizontal(),
            ImageCard(
                heightBreakPointed: finalHeight,
                cardsHeight: cardsHeight,
                visualStatsInfo: visualStatsInfo, imgScale: imgScale!, onAsignHeightImgCard: onAsignHeightImgCard)
          ],
        )
      ) : Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
            children: [
              StatsCard(
                  heightBreakPointed: finalHeight,
                  cardsHeight: cardsHeight,
                  visualStatsInfo: visualStatsInfo, onAsignHeightStatsCard: onAsignHeightStatsCard),
              const SizedBox(width: 10),
              spaceVertical(),
              ImageCard(
                  heightBreakPointed: finalHeight,
                  cardsHeight: cardsHeight,
                  visualStatsInfo: visualStatsInfo, imgScale: imgScale!, onAsignHeightImgCard: onAsignHeightImgCard)])
      ));}

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

  Widget spaceVertical (){
    return const SizedBox(height: 25);
  }
  Widget spaceHorizontal (){
    return const SizedBox(width: 15);
  }

  static const TextStyle _titleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
}

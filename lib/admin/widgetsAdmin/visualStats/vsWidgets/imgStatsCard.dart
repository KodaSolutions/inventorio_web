import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/widgetsAdmin/visualStats/listeners/listenerCardsHeight.dart';

import '../../infoWidgets/visualStatsInfo.dart';

class ImageCard extends StatefulWidget {

  final VisualStatsInfo visualStatsInfo;
  final double imgScale;
  final Function (double) onAsignHeightImgCard;
  final CardsHeight cardsHeight;
  final double? heightBreakPointed;
  const ImageCard({
    super.key,
    required this.visualStatsInfo,
    required this.imgScale, required this.onAsignHeightImgCard, required this.cardsHeight, this.heightBreakPointed,
  });

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final GlobalKey _keyCardImg = GlobalKey();
  final GlobalKey _keyImage = GlobalKey();
  double? heightImage;
  double? heightCardStats;
  double? heightCardImg;
  double? finalHeight;
  bool isImageLoaded = false;
  int breakPoint = 1;
  double? imgScale = 6;

  ///TODO las medidas ya salen correctas, solo es asegurarse que lleguen a visualStats y trabajarlas correctamente

  @override
  void initState() {
    super.initState();
    widget.heightBreakPointed != null ? finalHeight = widget.heightBreakPointed : null;
    widget.cardsHeight.registrarObservador((finalHeight) {
      setState(() => this.finalHeight = finalHeight);
    });
  }

  void onImageLoad(ImageInfo imageInfo, bool synchronousCall) {
    if (mounted && !isImageLoaded) {
      setState(() {
        isImageLoaded = true;
        final height = _keyCardImg.currentContext?.size?.height;
        if (height != null) {
          widget.onAsignHeightImgCard(height);
        }
      });
    }
  }

  void _measureAfterImageLoad() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
          widget.onAsignHeightImgCard(_keyCardImg.currentContext!.size!.height);
      }
    });
  }

  void _onImageLoad(ImageInfo imageInfo, bool synchronousCall) {
    isImageLoaded = false;
    if (mounted && !isImageLoaded) {
      setState(() {
        heightImage = imageInfo.image.height.toDouble() / imgScale!;
        isImageLoaded = true;
        _measureAfterImageLoad();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      key: _keyCardImg,
      color: Colors.white,
      elevation: 5,
      child: Container(
        height: finalHeight,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                maxLines: 1,
                widget.visualStatsInfo.salesInfoByType.data.title, style: _titleStyle),
            const SizedBox(height: 10),
            Text(
              widget.visualStatsInfo.salesInfoByType.data.subtitle,
              style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                widget.visualStatsInfo.salesInfoByType.data.imgPath!,
                key: _keyImage,
                scale: imgScale,
              )..image.resolve(const ImageConfiguration()).addListener(
                ImageStreamListener(_onImageLoad)))])));}

  static const TextStyle _titleStyle = TextStyle(
    overflow: TextOverflow.ellipsis,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
}
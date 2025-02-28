import 'package:flutter/material.dart';

class VisualStatsInfo {
  late WidgetInfo<OrderStatusData> orderStatus;
  late WidgetInfo<OrderStatusData> salesInfoByType;

  VisualStatsInfo() {
    orderStatus = WidgetInfo(
      "orderStatus",
      OrderStatusData(
        title: "ORDER STATUS",
        subtitle: "Order Status Tracking. Track your order from ship date to arrival. To begin, enter your order number",
        subdata_1: SubData(
          title: "123,111",
          subtitle: "Succes",
          color: Colors.blue,
        ),
        subdata_2: SubData(
          title: "123,111",
          subtitle: "Pending",
          color: Colors.red,
        ),subdata_3: SubData(
          title: "348,593",
          subtitle: "Failed",
          color: Colors.yellowAccent,
        ),));

    salesInfoByType = WidgetInfo('salesbyType',
        OrderStatusData(
          title: 'SALES REVENUE BY CUSTOMERS IN YUCATÁN',
          subtitle: 'Sales Performance of all states in the Country',
          imgPath: 'assets/admin/mapa_yuc.png',
    ));
  }
}

class WidgetInfo<T> {
  String name;
  T data;

  WidgetInfo(this.name, this.data);
}

class OrderStatusData {
  String title;
  String subtitle;
  SubData? subdata_1;
  SubData? subdata_2;
  SubData? subdata_3;
  String? imgPath;

  OrderStatusData({
    required this.title,
    required this.subtitle,
    this.subdata_1,
    this.subdata_2,
    this.subdata_3,
    this.imgPath,
  });
}

class SubData {
  String title;
  String subtitle;
  Color color;

  SubData({
    required this.title,
    required this.subtitle,
    required this.color,
  });
}
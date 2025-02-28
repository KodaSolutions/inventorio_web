import 'package:flutter/material.dart';
import 'package:inventorio_web/admin/widgetsAdmin/infoWidgets/visualStatsInfo.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            color: Colors.white,
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('RECENT ORDERS', style: titlestyle,),
                  spaceVertical(),
                  Text('An order is an investor\'s instructions to a broker or brokerage firm to purchase or sell',
                    style: textBody),
                  spaceVertical(),
                  Image.asset(
                    scale: 7,
                    VisualStatsInfo().salesInfoByType.data.imgPath!,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Delivered'),
                      Text('Canceled'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('5312', style: titlestyle),
                      Text('2134', style: titlestyle,),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Last 6 months', style: textBody),
                      Text('Last 6 months', style: textBody),
                    ],
                  ),
                ],
              ),
            )
        ),
        const SizedBox(height: 25),
        Card(
          elevation: 5,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(20),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Total sales', style: textBody,),
                    Text('Active Users', style: textBody,),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Column(
                      children: [
                        Text('\$6,123', style: bigertitlestyle),
                      ],
                    ),
                    Column(
                      children: [
                        Text('\$7,123', style: bigertitlestyle)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  static const TextStyle titlestyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w700
  );

  static const TextStyle bigertitlestyle = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w700
  );

  static const TextStyle textBody = TextStyle(
      fontSize: 14,
      color: Colors.black54,
      fontWeight: FontWeight.normal
  );
  Widget spaceVertical (){
    return SizedBox( height: 9,);
  }
  Widget spaceVerticalScroll (){
    return SizedBox( height: 7,);
  }
  Widget spaceHorizontal (){
    return SizedBox( width: 15,);
  }
}

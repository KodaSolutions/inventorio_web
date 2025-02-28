import 'package:flutter/material.dart';

class SalesActivity extends StatelessWidget {
  const SalesActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
            left: 20,
            bottom: 20,
            top: 20,
          right: 5
            ),
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('SALES ACTIVITY', style: titlestyle,),
            spaceVertical(),
            Text('Sales activities are the tactics that salespeople use to achieve their goals and objective',
            style: TextStyle(
              color: Colors.black54
            ),),
            spaceVertical(),
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Container(
                      padding: const EdgeInsets.only(right: 15),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                          ),
                          spaceHorizontal(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text('Title', style: titlestyle,),
                              spaceVerticalScroll(),
                              const Text('1.3 k New Products', style: TextStyle(
                                color: Colors.black54,
                              ),),
                            ],
                          ),
                          const Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '3 days\n\n',
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          )),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      )
    );
  }
  Widget spaceVertical (){
    return SizedBox( height: 12,);
  }
  Widget spaceVerticalScroll (){
    return SizedBox( height: 7,);
  }
  Widget spaceHorizontal (){
    return SizedBox( width: 15,);
  }
  static const TextStyle titlestyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w700
  );
}

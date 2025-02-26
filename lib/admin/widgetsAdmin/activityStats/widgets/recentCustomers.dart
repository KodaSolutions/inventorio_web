import 'package:flutter/material.dart';

class RecentCustomers extends StatelessWidget {
  const RecentCustomers({super.key});

  @override
  Widget build(BuildContext context) {

    Widget spaceVertical (){
      return SizedBox( height: 9,);
    }
    Widget spaceVerticalScroll (){
      return SizedBox( height: 7,);
    }
    Widget spaceHorizontal (){
      return SizedBox( width: 15,);
    }

    return Card(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('RECENT CUSTOMERS', style: titlestyle),
            spaceVertical(),
            Text('A customer is an individual or business that purchases the goods service has envolved to include real-time',
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
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: Colors.black54.withOpacity(0.3),
                        ))
                      ),
                      margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
                      padding: EdgeInsets.only(bottom: 15),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            spaceHorizontal(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name of the client', style: titlestyle),
                                spaceVerticalScroll(),
                                Text('User ID: #1456', style: TextStyle(
                                  color: Colors.black54
                                ),),
                                spaceVerticalScroll(),
                                Text('Paid or Pending', style: TextStyle(
                                  color: Colors.green
                                ),),
                              ],
                            )
                          ],
                        ),
                      )
                    );
                  }),
            )
          ],
        ),
      )
    );
  }

  static const TextStyle titlestyle = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w700
  );
}

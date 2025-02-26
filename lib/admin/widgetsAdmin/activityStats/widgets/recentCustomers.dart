import 'package:flutter/material.dart';

class RecentCustomers extends StatelessWidget {
  const RecentCustomers({super.key});

  @override
  Widget build(BuildContext context) {

    Widget spaceVertical (){
      return SizedBox( height: 9,);
    }
    Widget spaceVerticalLV (){
      return SizedBox( height: 4);
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
            const Text('RECENT CUSTOMERS', style: titlestyle),
            spaceVertical(),
            const Text('A customer is an individual or business that purchases the goods service has envolved to include real-time',
            style: TextStyle(
              color: Colors.black54
            ),),
            spaceVertical(),
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black54.withOpacity(0.3),
                                    )
                                )
                            ),
                            margin: const EdgeInsets.only(right: 15, left: 15),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  hoverColor: Colors.blue[50],
                                  onTap: () {
                                    // Acción al hacer clic si es necesario
                                  },
                                  child:  Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                  ),
                                  spaceHorizontal(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      spaceVertical(),
                                      const Text('Name of the client', style: titlestyle),
                                      spaceVerticalScroll(),
                                      const Text('User ID: #1456', style: TextStyle(
                                          color: Colors.black54
                                      ),),
                                      spaceVerticalScroll(),
                                      const Text('Paid or Pending', style: TextStyle(
                                          color: Colors.green
                                      ),),
                                      spaceVerticalLV(),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    );
                  }
              ),
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

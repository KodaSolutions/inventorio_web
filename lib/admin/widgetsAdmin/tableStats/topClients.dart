import 'package:flutter/material.dart';

class TopClients extends StatelessWidget {
  const TopClients({super.key});

  @override
  Widget build(BuildContext context) {

    Widget spaceVertical (){
      return SizedBox(
        height: 10,
      );
    }

    List<Map<String, dynamic>> clients = [
      {'name': 'Client A', 'revenue': '10,000'},
      {'name': 'Client B', 'revenue': '8,500'},
      {'name': 'Client C', 'revenue': '7,200'},
      {'name': 'Client C', 'revenue': '7,200'},
      {'name': 'Client C', 'revenue': '7,200'},
    ];


    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your top clients'.toUpperCase(), style: title),
              spaceVertical(),
              Text('Sales performance renevue based by country', style: label),
              spaceVertical(),
              spaceVertical(),
              //aqui va la table de dos columnas y X filas, con sus respectivos bordes
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              child: Text('name client'.toUpperCase(), style: title,),
                            ),
                            SizedBox(
                              child: Text('revenue'.toUpperCase(), style: title),
                            ),
                          ],
                        ),
                      ),
                      //aqui iria el row.generate
                      Column(
                        children: List.generate(clients.length, (index) {
                          final earning = clients[index];
                          final rowColor = index.isEven ? Colors.blue[50] : Colors.white;
                          return Container(
                            color: rowColor,
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(earning['name'], style: dateStlyle ,textAlign: TextAlign.center),
                                Text('\$${earning['revenue']}', style: amouthStyle, textAlign: TextAlign.center),
                              ],
                            ),
                          );
                        }),
                      ),

                    ],
                  )),
            ],
          )
      ),
    );
  }

  static const TextStyle title = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle amouthStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle dateStlyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle revenue = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle name = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}


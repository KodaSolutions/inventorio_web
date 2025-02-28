import 'package:flutter/material.dart';

class RecenteEarnings extends StatelessWidget {
  const RecenteEarnings({super.key});

  @override
  Widget build(BuildContext context) {

    Widget spaceVertical (){
      return SizedBox(
        height: 10,
      );
    }

    double spaceTable1 = 60.0;

    List<Map<String, dynamic>> recentEarnigs = [
      {
        'date': '05 Dec 2019',
        'salesCount': '34',
        'earnings': '532.43',
        'taxWitheld': '2343.12'
      },
      {
        'date': '12 Dec 2019',
        'salesCount': '28',
        'earnings': '480.15',
        'taxWitheld': '1980.50'
      },
      {
        'date': '20 Dec 2019',
        'salesCount': '50',
        'earnings': '920.00',
        'taxWitheld': '2500.00'
      },
      {
        'date': '02 Jan 2020',
        'salesCount': '45',
        'earnings': '750.60',
        'taxWitheld': '2200.10'
      },
      {
        'date': '15 Jan 2020',
        'salesCount': '60',
        'earnings': '1045.75',
        'taxWitheld': '2705.30'
      },
      {
        'date': '22 Jan 2020',
        'salesCount': '39',
        'earnings': '675.45',
        'taxWitheld': '2450.00'
      },
      {
        'date': '01 Feb 2020',
        'salesCount': '53',
        'earnings': '890.10',
        'taxWitheld': '2580.75'
      }
    ];

    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your most recent earnings'.toUpperCase(), style: title),
              spaceVertical(),
              Text('This is your most recent earnings for today\'s date.', style: label),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Text('date'.toUpperCase(), style: title,),
                              ),
                              SizedBox(
                                child: Text('sales count'.toUpperCase(), style: title),
                              ),
                              SizedBox(
                                child: Text('earnigs'.toUpperCase(), style: title),
                              ),
                              SizedBox(
                                child: Text('tax witheld'.toUpperCase(), style: title),
                              ),
                            ],
                          ),
                        ),
                        //aqui iria el row.generate
                        Column(
                          children: List.generate(recentEarnigs.length, (index) {
                            final earning = recentEarnigs[index];
                            final rowColor = index.isEven ? Colors.blue[50] : Colors.white;

                            return Container(
                              color: rowColor,
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(earning['date'], style: dateStlyle ,textAlign: TextAlign.center),
                                  Text(earning['salesCount'], style: amouthStyle, textAlign: TextAlign.center),
                                  Text('\$${earning['earnings']}', style: amouthStyle, textAlign: TextAlign.center),
                                  Text('\$${earning['taxWitheld']}', style: amouthStyle,textAlign: TextAlign.center),
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
}

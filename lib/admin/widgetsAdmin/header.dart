import 'dart:async';

import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Function(int) breakPoint;
  const Header({super.key, required this.breakPoint});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  double? spaceContainer;
  double containerHeightFijo = 155.0;
  int edoBreakPoint = 0;

  final List<Map<String, dynamic>> cardData = [
    {
      'amount': '2913',
      'title': 'Hola mundo',
      'description': 'Buenas tardes mundo',
      'colors': [Color(0xFF80D8FF), Color(0xFF2196F3), Color(0xFF2197f3),],
    },
    {
      'amount': '5500',
      'title': 'Bienvenidos',
      'description': '¡Que tal el día!',
      'colors': [Color(0xFFFF5722), Color(0xFFE91E63), Color(0xFFE8165D)],
    },
    {
      'amount': '1200',
      'title': 'Descuento',
      'description': 'Aprovecha la oferta',
      'colors': [Color(0xFFa7da6c), Color(0xFF89C83F), Color(0xFF89c542)],
    },
    {
      'amount': '7400',
      'title': 'Ofertas especiales',
      'description': 'Solo por hoy',
      'colors': [Color(0xFF2196F3), Color(0xFF303F9F), Color(0xFF2c3ca4)],
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.breakPoint(edoBreakPoint);
    });
  }

  void updateBreakPoint(double width) {
    int newBreakPoint = getBreakPoint(width);
    if (newBreakPoint != edoBreakPoint) {
      setState(() {
        edoBreakPoint = newBreakPoint;
        widget.breakPoint(edoBreakPoint);
      });
    }
  }


  int getBreakPoint(double width) {
    if (width >= 1186) {
      return 1;
    } else if (width >= 960 && width < 1185) {
      return 2;
    } else if (width >= 717 && width < 958) {
      return 3;
    } else if (width < 716) {
      return 4;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidthResponsive = constraints.maxWidth * 0.24;
        WidgetsBinding.instance.addPostFrameCallback((_){
          double windowWidth = MediaQuery.of(context).size.width;
          updateBreakPoint(windowWidth);
          //setState(()=> updateBreakPoint(windowWidth));
        });

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                children: [
                  spacerHorizontal(),
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hi, welcome back!', style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),),
                      const Text('Sales monitoring dashboard template.', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),),
                      if(edoBreakPoint == 4)...[
                        Column(
                            children: [
                              const SizedBox(height: 25,),
                              lateralInfo(false),],
                        ),
                      ]
                    ],
                  ),),
                  if(edoBreakPoint != 4)...[
                    lateralInfo(true),
                  ],
                  spacerHorizontal(),
                ],
            ),
            const SizedBox(height: 20,),
            if(edoBreakPoint == 2 || edoBreakPoint == 3)...[
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 25),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    mainAxisExtent: 155,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final card = cardData[index];
                    return containerColored(
                      card['amount'],
                      card['title'],
                      card['description'],
                      card['colors'],
                      containerWidthResponsive,
                      containerHeightFijo,
                    );}
              )
            ]
            else if(edoBreakPoint == 1) ... [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(cardData.length, (index) {
                    final card = cardData[index];
                    return containerColored(
                      card['amount'],
                      card['title'],
                      card['description'],
                      card['colors'],
                      containerWidthResponsive,
                      containerHeightFijo,
                    );
                  }),
                ),
              )
            ]
            else if(edoBreakPoint == 4)...[
                GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const NeverScrollableScrollPhysics(), // Evita scroll interno
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      mainAxisExtent: 155,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final card = cardData[index];
                      return containerColored(
                        card['amount'],
                        card['title'],
                        card['description'],
                        card['colors'],
                        containerWidthResponsive,
                        containerHeightFijo,
                      );}
                )
              ]
          ],
        );
      },
    );
  }

  Widget containerColored (String amuount, String title, String description, List<Color> colors, double width, double height,) {
    assert(colors.length == 3, 'La lista de colores debe contener exactamente 3 colores.');
    return Container(
      height: height,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.black54.withOpacity(0.4)),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: const [
              0.1, 0.9, 0.5
            ],
          colors: colors),),
        child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),),
                    Text('\$$amuount', style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),),
                    Text(description, style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal,
                        fontSize: 14, height: 2.0))]),
              const Row(
                children: [
                  Icon(Icons.arrow_circle_up_rounded, color: Colors.white,),
                  Text('+426', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18))])])])
    );
  }
  Widget lateralInfo (bool up){
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customer Ratings', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),),
                    Row(
                      children: [
                        Icon(Icons.star_outlined, color: Colors.orange,),
                        Icon(Icons.star_half_rounded, color: Colors.orange),
                        Icon(Icons.star_outline_sharp, color: Colors.orange),
                        Text(' (14,123)',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(width: 15,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Online sales', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),),
                    Text('120,123', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Offline sales', style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),),
                    Text('543,123', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget spacerHorizontal (){
    return const SizedBox(width: 20);
  }

}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override

  //setState() will rebuild whole page
  Widget build(BuildContext context) {

    //will check if data is empty or not, if fresh build it will not use result from setState
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; //Get data from other page
    print(data);

    //Set background
    String bgImage = data['isDaytime'] ? 'day2.png' : 'night2.png';
    Color? bgColor = data['isDaytime'] ? Colors.pinkAccent : Colors.blue[900];
    Color? textColor = data['isDaytime'] ? Colors.black54 : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: textColor,
                          size: 20.0,
                      ),
                      label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.0,
                          ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      data['time'],
                    style: TextStyle(
                      color: textColor,
                      fontSize: 66.0,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

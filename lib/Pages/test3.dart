import "package:flutter/material.dart";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  Text("Multi Page Application"),
        ),
        body:  Checkbox(
            value: false,
            onChanged: (bool value) {
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (context) =>  SecondScreen()),
              );
            }));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text("Multi Page Application Page - 1"),
      ),
      body:  Checkbox(
          value: false,
          onChanged: (bool newValue) {
            Navigator.push(
              context,
               MaterialPageRoute(builder: (context) =>  FirstScreen()),
            );
          }),
    );
  }
}

/*
SizedBox(
                  child: Row(
                children: [
                  SizedBox(width: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2, right: 0, bottom: 0, top: 0),
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          child: Image.network(
                            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        )),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    child: Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Obai\n',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontStyle: FontStyle.normal,
                            fontSize: 17,
                          )),
                      TextSpan(
                          text: newNumber,
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ])),
                  )
                ],
              )),
*/

              



  
import 'package:flutter/material.dart';

class FoundCourses extends StatefulWidget {
  @override
  _FoundCoursesState createState() => _FoundCoursesState();
}

class _FoundCoursesState extends State<FoundCourses> {
  // bool _applied = false;
  // ignore: deprecated_member_use
  List<int> selectedIndexList = new List<int>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // What do i do here?
                  if (!selectedIndexList.contains(index)) {
                    selectedIndexList.add(index);
                  } else {
                    selectedIndexList.remove(index);
                  }
                  setState(() {});
                },
                child: Container(
                  height: 350,
                  width: 150,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Color(0xff940D5A)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 15.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: 100,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2020/07/05/09/59/groningen-5372387_960_720.jpg',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          )), 
                       Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Company Name \nCustom Description",
                          style: TextStyle(
                            color: Color(0xff00315C),
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
            ],
          );
       // );
      },
    ));
  }
}

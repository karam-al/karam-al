import "package:flutter/material.dart";

class SpecializationComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFFFFB74D);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:PrimaryColor ,
        title: Text('Specialization'),),
     // debugShowCheckedModeBanner: false,
      body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(height: 20),
          SizedBox(
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 0, bottom: 0, top: 0),
                child: SizedBox(
                    height: 130,
                    width: 160,
                    child: ClipRRect(
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, bottom: 60, top: 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, bottom: 0, top: 0),
                      child: Container(
                          child: Text(" \n Company Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  decoration: TextDecoration.none))),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, bottom: 0, top: 0),
                      child: Container(
                          child: Text(" Specialization",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  decoration: TextDecoration.none))),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Divider(thickness: 6),
          SizedBox(
               height: 200,
                child: Container(
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    children: <Widget>[
                      createGridItem(
                          6, "Product Name", "Product Description", "2900", false, false,true),
                      createGridItem(
                          6, "Product Name", "Product Description","2900", false, false,true),
                      createGridItem(
                          6, "Product Name", "Product Description","2900" ,false, false,true),
                      createGridItem(
                          6, "Product Name", "Product Description","2900" ,false, false,true),
                      createGridItem(
                          6, "Product Name", "Product Description", "2900",false, false,true),
                      createGridItem(
                          6, "Product Name", "Product Description","2900" ,false, false,true),
                    ],
                  ),
                ),
                  ),

          SizedBox(
            child: Column(
              children: [
                SizedBox(
                    height: 230,
                    width: 350,
                    child: ClipRRect(
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
                SizedBox(
                    child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 0, bottom: 0, top: 5),
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
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 63, bottom: 0, top: 5),
                        child: Text("Product Name",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.none)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 12, bottom: 0, top: 0),
                        child: Text(" Product Description ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.none)),
                      ),
                    ]),
                    Column(children: [SizedBox(height: 10, width: 32)]),
                    Column(children: [
                      Text("2900",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.none)),
                      ElevatedButton(
                        child: Text("Call"),
                        onPressed: () {},
                      )
                    ])
                  ],
                )),
              ],
            ),
          ),
          Divider(thickness: 6),

          SizedBox(
            child: Column(
              children: [
                SizedBox(
                    height: 230,
                    width: 350,
                    child: ClipRRect(
                      child: Image.network(
                        'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )),
                SizedBox(
                    child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 0, bottom: 0, top: 5),
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
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 63, bottom: 0, top: 5),
                        child: Text("Product Name",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.none)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 12, bottom: 0, top: 0),
                        child: Text(" Product Description ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration: TextDecoration.none)),
                      ),
                    ]),
                    Column(children: [SizedBox(height: 10, width: 32)]),
                    Column(children: [
                      Text("2900",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.none)),
                      ElevatedButton(
                        child: Text("Call"),
                        onPressed: () {

                                },
                      )
                    ])
                  ],
                )),
              ],
            ),
          )
        ])));
  }

  Widget createGridItem(int position, String text, String text2,String text3, bool flag,
      bool flag2, bool flag3) {
    var color = Colors.white;
    // ignore: unused_local_variable
    var icondata = Icons.add;

    switch (position) {
      case 0:
        color = Colors.grey;
        icondata = Icons.home;

        break;
      case 1:
        color = Colors.grey;
        icondata = Icons.directions_car;

        break;
      case 2:
        color = Colors.grey;
        icondata = Icons.phone_android;

        break;
      case 3:
        color = Colors.grey;
        icondata = Icons.check_box_outline_blank;

        break;
      case 4:
        color = Colors.grey;
        icondata = Icons.local_laundry_service;

        break;
      case 5:
        color = Colors.grey;
        icondata = Icons.tag_faces;

        break;
      case 6:
        color = Colors.white;
        icondata = Icons.business;

        break;
      case 7:
        color = Colors.orange;
        icondata = Icons.text_fields;

        break;
    }

    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 22, bottom: 9, top: 10),
        child: Card(
          elevation: 6,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              print("latest");
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg',
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        text2,
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        text3,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

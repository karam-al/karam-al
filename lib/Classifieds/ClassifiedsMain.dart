import 'package:flutter/material.dart'; 
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import 'ClassifiedModels.dart';

double rotate = 0, rotate2 = 0;

class Classifieds extends StatelessWidget {
  // final String message;
  final bool choice2;
  //  MotorsMain({@required this.message});
  Classifieds({@required this.choice2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ClassifiedsMain(choice2: choice2),
    );
  }
}

class ClassifiedsMain extends StatelessWidget {
  static var classifieds,
      dvdsAndMovies,
      lostAndFound,
      music,
      books,
      freeStuff,
      collectibles,
      ticketsAndVoucher,
      toys,
      babyItems,
      gaming,
      musicalInstruments,
      pets,
      jewelryandWatches,
      camerasAndImaging,
      clothingAccessories,
      sportEquipment,
      homeAppliances,
      businessAndIndustrial,
      computersAndNetworking,
      electronics;
  double fontSize, treeFontSize, leadingSize, titleSize;
  // final String message;
  final bool choice2;
  ClassifiedsMain({@required this.choice2});

  @override
  Widget build(BuildContext context) {
    if (SizerUtil.deviceType == DeviceType.mobile) {
      fontSize = 5.w;
      leadingSize = 0.3.w;
      titleSize = 5.w;
    } else {
      fontSize = 3.w;
      leadingSize = 0.16.w;
      titleSize = 3.4.w;
    }
    classifieds = [
      translator.translate("Electronics"),
      translator.translate("Computers And Networking "),
      translator.translate("Business & Industrial"),
      translator.translate("Home Appliances"),
      translator.translate("Sport Equipment"),
      translator.translate("Clothing & Accessories"),
      translator.translate("Cameras And Imaging"),
      translator.translate("Jewelry and Watches"),
      translator.translate("Pets"),
      translator.translate("Musical Instruments"),
      translator.translate("Gaming"),
      translator.translate("Baby Items"),
      translator.translate("Toys"),
      translator.translate("Tickets And Vouchers"),
      translator.translate("Collectibles"),
      translator.translate("Books"),
      translator.translate("Music"),
      translator.translate("Free Stuff"),
      translator.translate("Lost /Found"),
      translator.translate("DVDs & Movies"),
    ];

    dvdsAndMovies = [
      translator.translate("DVD"),
      translator.translate("Digital3"),
      translator.translate("VHS"),
      translator.translate("Other Formats"),
    ];

    lostAndFound = [
      translator.translate("Lost"),
      translator.translate("Found"),
    ];

    freeStuff = [
      translator.translate("Furniture, Home & Garden"),
      translator.translate("Home Appliances2"),
      translator.translate("Baby Items2"),
      translator.translate("Electronics2"),
      translator.translate("Clothing & Accessories2"),
      translator.translate("Books2"),
      translator.translate("Other42"),
    ];

    music = [
      translator.translate("Vinyl"),
      translator.translate("CDs"),
      translator.translate("Digital2"),
      translator.translate("Casettes"),
    ];

    books = [
      translator.translate("Textbooks"),
      translator.translate("Nonfiction"),
      translator.translate("Fiction"),
      translator.translate("Children's Books"),
      translator.translate("Book Accessories"),
      translator.translate("Digital/E-books"),
      translator.translate("Audiobooks"),
    ];

    collectibles = [
      translator.translate("Antiques"),
      translator.translate("Art"),
      translator.translate("Decorations"),
      translator.translate("Memorabilia"),
      translator.translate("Rocks/Fossils/Artifacts"),
      translator.translate("Pens & Writing Instruments"),
      translator.translate("Other31"),
    ];

    ticketsAndVoucher = [
      translator.translate("Activities & Attractions"),
      translator.translate("Concerts"),
      translator.translate("Sporting Events"),
      translator.translate("Travel"),
      translator.translate("Events"),
      translator.translate("Movies"),
      translator.translate("Vouchers & Gift Cards"),
      translator.translate("Other30"),
    ];

    toys = [
      translator.translate("Electronic & Remote Control Toys"),
      translator.translate("Action Figures & Toy Vehicles"),
      translator.translate("Outdoor Toys & Structures"),
      translator.translate("Hobbies"),
      translator.translate("Pretend Play & Preschool Toys"),
      translator.translate("Educational Toys"),
      translator.translate("Dolls & Stuffed Animals"),
      translator.translate("Games & Puzzles"),
      translator.translate("Classic & Vintage Toys"),
      translator.translate("Building Toys"),
      translator.translate("Other29"),
    ];

    babyItems = [
      translator.translate("Strollers & Car Seats"),
      translator.translate("Baby Gear"),
      translator.translate("Baby Toys"),
      translator.translate("Feeding"),
      translator.translate("Safety & Health"),
      translator.translate("Bath & Diapers"),
      translator.translate("Nursery Furniture & Accessories"),
    ];

    gaming = [
      translator.translate("Gaming Systems"),
      translator.translate("Video Games"),
      translator.translate("Gaming Accessories"),
    ];

    musicalInstruments = [
      translator.translate("Guitars"),
      translator.translate("Percussion"),
      translator.translate("String Instruments"),
      translator.translate("Wind Instruments"),
      translator.translate("DJ & Recording Equipment"),
      translator.translate("Pianos, Keyboards & Organs"),
      translator.translate("Other17"),
    ];

    pets = [
      translator.translate("Pet Accessories"),
      translator.translate("Lost & Found Pets"),
      translator.translate("Pets for Free Adoption"),
    ];

    jewelryandWatches = [
      translator.translate("Watches"),
      translator.translate("Women's Jewelry"),
      translator.translate("Loose Diamonds & Gems"),
      translator.translate("Men's Jewelry"),
      translator.translate("Other14"),
    ];

    camerasAndImaging = [
      translator.translate("Digital Cameras"),
      translator.translate("Professional Equipment"),
      translator.translate("Camera Accessories"),
      translator.translate("Tripods & Stands"),
      translator.translate("Camcorders"),
      translator.translate("Film Cameras"),
      translator.translate("Binoculars/Telescopes"),
      translator.translate("Camcorder Accessories"),
      translator.translate("Camera Drones"),
      translator.translate("Lenses, Filters & Lighting"),
    ];

    clothingAccessories = [
      translator.translate("Shoes/Footwear"),
      translator.translate("Clothing"),
      translator.translate("Handbags, Bags & Wallets"),
      translator.translate("Men's Accessories"),
      translator.translate("Women's Accessories"),
      translator.translate("Luggage"),
      translator.translate("Fragrances"),
      translator.translate("Wedding Apparel"),
      translator.translate("Costumes & Uniforms"),
      translator.translate("Make up & Skin Care"),
      translator.translate("Vintage & Highend Clothing"),
    ];

    sportEquipment = [
      translator.translate("Cycling"),
      translator.translate("Exercise Equipment"),
      translator.translate("Water Sports"),
      translator.translate("Camping & Hiking"),
      translator.translate("Golf"),
      translator.translate("Tennis & Racquet Sports"),
      translator.translate("Indoor Sports"),
      translator.translate("Team Sports"),
      translator.translate("Winter Sports"),
      translator.translate("Other Sports"),
    ];

    homeAppliances = [
      translator.translate("Small Kitchen Appliances"),
      translator.translate("Outdoor Appliances"),
      translator.translate("Small Bathroom Appliances"),
      translator.translate("Irons & Sewing Machines"),
      translator.translate("Vaccums & Floor Care"),
      translator.translate("Large Appliances / White Goods"),
      translator.translate("Othhher"),
    ];

    businessAndIndustrial = [
      translator.translate("Businesses for Sale"),
      translator.translate("Construction"),
      translator.translate("Food & Beverage"),
      translator.translate("Industrial Supplies"),
      translator.translate("Office Furniture & Equipment"),
      translator.translate("Manufacturing"),
      translator.translate("Electrical Equipment"),
      translator.translate("Retail & Services"),
      translator.translate("Healthcare & Lab"),
      translator.translate("Commercial Printing & Copy Machines"),
      translator.translate("Packing & Shipping"),
      translator.translate("Agriculture & Forestry"),
      translator.translate("Other43"),
    ];

    computersAndNetworking = [
      translator.translate("Computerss"),
      translator.translate("Computer Components"),
      translator.translate("Accessoriess"),
      translator.translate("Networking & Communication"),
      translator.translate("Software"),
      translator.translate("Monitors, Printers & Other Peripherals"),
    ];

    electronics = [
      translator.translate("Home Audio & Turntables"),
      translator.translate("Televisions"),
      translator.translate("DVD & Home Theater"),
      translator.translate("Electronic Accessories"),
      translator.translate("Gadgets"),
      translator.translate("Car Electronics"),
      translator.translate("Satellite & Cable TV"),
      translator.translate("Health Electronics"),
      translator.translate("Smart Home"),
      translator.translate("Wearable Technology"),
      translator.translate("Mp3 Players and Portable Audio"),
      translator.translate("Other Electronics"),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }

    gotoScreen(int choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice2 == true) {
            if (choice == 0)
              return ClassifiedsInner(
                choice: true,
                index: 0,
                clasiList: electronics,
                clasiModel: "Electronics",
              );
            if (choice == 1)
              return ClassifiedsInner(
                choice: true,
                index: 1,
                clasiList: computersAndNetworking,
                clasiModel: "Computers And Networking ",
              );
            if (choice == 2)
              return ClassifiedsInner(
                choice: true,
                index: 2,
                clasiList: businessAndIndustrial,
                clasiModel: "Business & Industrial",
              );

            if (choice == 3)
              return ClassifiedsInner(
                choice: true,
                index: 3,
                clasiList: homeAppliances,
                clasiModel: "Home Appliances",
              );
            if (choice == 4)
              return ClassifiedsInner(
                choice: true,
                index: 4,
                clasiList: sportEquipment,
                clasiModel: "Sport Equipment",
              );
            if (choice == 5)
              return ClassifiedsInner(
                choice: true,
                index: 5,
                clasiList: clothingAccessories,
                clasiModel: "Clothing & Accessories",
              );

            if (choice == 6)
              return ClassifiedsInner(
                choice: true,
                index: 6,
                clasiList: camerasAndImaging,
                clasiModel: "Cameras And Imaging",
              );
            if (choice == 7)
              return ClassifiedsInner(
                choice: true,
                index: 7,
                clasiList: jewelryandWatches,
                clasiModel: "Jewelry and Watches",
              );
            if (choice == 8)
              return ClassifiedsInner(
                choice: true,
                index: 8,
                clasiList: pets,
                clasiModel: "Pets",
              );
            if (choice == 9)
              return ClassifiedsInner(
                choice: true,
                index: 9,
                clasiList: musicalInstruments,
                clasiModel: "Musical Instruments",
              );

            if (choice == 10)
              return ClassifiedsInner(
                choice: true,
                index: 10,
                clasiList: gaming,
                clasiModel: "Gaming",
              );
            if (choice == 11)
              return ClassifiedsInner(
                choice: true,
                index: 11,
                clasiList: babyItems,
                clasiModel: "Baby Items",
              );

            if (choice == 12)
              return ClassifiedsInner(
                choice: true,
                index: 12,
                clasiList: toys,
                clasiModel: "Toys",
              );
            if (choice == 13)
              return ClassifiedsInner(
                choice: true,
                index: 13,
                clasiList: ticketsAndVoucher,
                clasiModel: "Tickets And Vouchers",
              );

            if (choice == 14)
              return ClassifiedsInner(
                choice: true,
                index: 14,
                clasiList: collectibles,
                clasiModel: "Collectibles",
              );
            if (choice == 15)
              return ClassifiedsInner(
                choice: true,
                index: 15,
                clasiList: books,
                clasiModel: "Books",
              );

            if (choice == 16)
              return ClassifiedsInner(
                choice: true,
                index: 16,
                clasiList: music,
                clasiModel: "Music",
              );
            if (choice == 17)
              return ClassifiedsInner(
                choice: true,
                index: 17,
                clasiList: freeStuff,
                clasiModel: "Free Stuff",
              );
            if (choice == 18)
              return ClassifiedsInner(
                choice: true,
                index: 18,
                clasiList: lostAndFound,
                clasiModel: "Lost /Found",
              );
            if (choice == 19)
              return ClassifiedsInner(
                choice: true,
                index: 19,
                clasiList: dvdsAndMovies,
                clasiModel: "DVDs & Movies",
              );
          }

          if (choice2 == false) {
            if (choice == 0)
              return ClassifiedsInner(
                choice: false,
                index: 0,
                clasiList: electronics,
                clasiModel: "Electronics",
              );
            if (choice == 1)
              return ClassifiedsInner(
                choice: false,
                index: 1,
                clasiList: computersAndNetworking,
                clasiModel: "Computers And Networking ",
              );
            if (choice == 2)
              return ClassifiedsInner(
                choice: false,
                index: 2,
                clasiList: businessAndIndustrial,
                clasiModel: "Business & Industrial",
              );

            if (choice == 3)
              return ClassifiedsInner(
                choice: false,
                index: 3,
                clasiList: homeAppliances,
                clasiModel: "Home Appliances",
              );
            if (choice == 4)
              return ClassifiedsInner(
                choice: false,
                index: 4,
                clasiList: sportEquipment,
                clasiModel: "Sport Equipment",
              );
            if (choice == 5)
              return ClassifiedsInner(
                choice: false,
                index: 5,
                clasiList: clothingAccessories,
                clasiModel: "Clothing & Accessories",
              );

            if (choice == 6)
              return ClassifiedsInner(
                choice: false,
                index: 6,
                clasiList: camerasAndImaging,
                clasiModel: "Cameras And Imaging",
              );
            if (choice == 7)
              return ClassifiedsInner(
                choice: false,
                index: 7,
                clasiList: jewelryandWatches,
                clasiModel: "Jewelry and Watches",
              );
            if (choice == 8)
              return ClassifiedsInner(
                choice: false,
                index: 8,
                clasiList: pets,
                clasiModel: "Pets",
              );
            if (choice == 9)
              return ClassifiedsInner(
                choice: false,
                index: 9,
                clasiList: musicalInstruments,
                clasiModel: "Musical Instruments",
              );

            if (choice == 10)
              return ClassifiedsInner(
                choice: false,
                index: 10,
                clasiList: gaming,
                clasiModel: "Gaming",
              );
            if (choice == 11)
              return ClassifiedsInner(
                choice: false,
                index: 11,
                clasiList: babyItems,
                clasiModel: "Baby Items",
              );

            if (choice == 12)
              return ClassifiedsInner(
                choice: false,
                index: 12,
                clasiList: toys,
                clasiModel: "Toys",
              );
            if (choice == 13)
              return ClassifiedsInner(
                choice: false,
                index: 13,
                clasiList: ticketsAndVoucher,
                clasiModel: "Tickets And Vouchers",
              );

            if (choice == 14)
              return ClassifiedsInner(
                choice: false,
                index: 14,
                clasiList: collectibles,
                clasiModel: "Collectibles",
              );
            if (choice == 15)
              return ClassifiedsInner(
                choice: false,
                index: 15,
                clasiList: books,
                clasiModel: "Books",
              );

            if (choice == 16)
              return ClassifiedsInner(
                choice: false,
                index: 16,
                clasiList: music,
                clasiModel: "Music",
              );
            if (choice == 17)
              return ClassifiedsInner(
                choice: false,
                index: 17,
                clasiList: freeStuff,
                clasiModel: "Free Stuff",
              );
            if (choice == 18)
              return ClassifiedsInner(
                choice: false,
                index: 18,
                clasiList: lostAndFound,
                clasiModel: "Lost /Found",
              );
            if (choice == 19)
              return ClassifiedsInner(
                choice: false,
                index: 19,
                clasiList: dvdsAndMovies,
                clasiModel: "DVDs & Movies",
              );
          }
          return Container();
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  if (choice2 == false)
                    Text("${translator.translate("Now_choose_the_right")}",
                        style: new TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800])),
                  if (choice2 == false)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  if (choice2 == false)
                    Text("${translator.translate("category_for_your_ad")}",
                        style: new TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800])),
                  if (choice2 == true)
                    Text("${translator.translate("choose_the_category2")}",
                        style: new TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(height: rotate2),
                  /* SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(height: rotate2),*/
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: classifieds.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                    if (index == 6) gotoScreen(6);
                    if (index == 7) gotoScreen(7);
                    if (index == 8) gotoScreen(8);
                    if (index == 9) gotoScreen(9);
                    if (index == 10) gotoScreen(10);
                    if (index == 11) gotoScreen(11);
                    if (index == 12) gotoScreen(12);
                    if (index == 13) gotoScreen(13);
                    if (index == 14) gotoScreen(14);
                    if (index == 15) gotoScreen(15);
                    if (index == 16) gotoScreen(16);
                    if (index == 17) gotoScreen(17);
                    if (index == 18) gotoScreen(18);
                    if (index == 19) gotoScreen(19);
                    if (index == 20) gotoScreen(20);
                  },
                  title: Text(classifieds[index],
                      style: TextStyle(fontSize: fontSize)),
                  //  selected: index == _selectedIndex,
                ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            )
          ]),
    );
  }
}

class ClassifiedsInner extends StatelessWidget {
  final int index;
  final bool choice;
  final List<String> clasiList;
  final String clasiModel;
  ClassifiedsInner(
      {@required this.choice,
      @required this.clasiList,
      @required this.index,
      @required this.clasiModel});
  static var clothingAndccessories,
      homeAudioAndTurntables,
      televisions,
      dvdAndHomeTheater,
      electronicAccessories,
      gadgets,
      carElectronics,
      satelliteAndCableTV,
      healthElectronics,
      smartHome,
      wearableTechnology,
      otherElectronics,
      mp3PlayersandPortableAudio,
      computers,
      computerComponents,
      accessoriesComp,
      networkingAndommunication,
      software,
      monitorsAndPrintersAndOtherPeripherals,
      businessesforSale,
      industrialSupplies,
      officeFurnitureAndEquipment,
      manufacturing,
      healthcareAndLab,
      agricultureAndForestry,
      packingAndShipping,
      retailAndServices,
      electricalEquipment,
      foodAndBeverage,
      construction,
      commercialPrintingAndCopyMachines,
      smallKitchenAppliances,
      outdoorAppliances,
      smallBathroomAppliances,
      ironsAndSewingMachines,
      vaccumsAndFloorCare,
      largeAppliancesWhiteGoods,
      cycling,
      golf,
      exerciseEquipment,
      indoorSports,
      winterSports,
      waterSports,
      teamSports,
      campingAndHiking,
      tennisAndRacquetSports,
      clothing,
      fragrances,
      weddingApparel,
      luggage,
      costumesAndUniforms,
      vintageAndHighendClothing,
      womensAccessories,
      mensAccessories,
      handbagsBagsAndWallets,
      shoesAndFootwear,
      digitalCameras,
      professionalEquipment,
      cameraAccessories,
      camcorders,
      filmCameras,
      binocularsAndTelescopes,
      tripodsAndStands,
      lensesFiltersAndLighting,
      looseDiamondsAndGems,
      womensJewelry,
      mensJewelry,
      watches,
      petAccessories,
      petsforFreeAdoption,
      guitars,
      percussion,
      stringInstruments,
      windInstruments,
      dJAndRecordingEquipment,
      pianosKeyboardsAndOrgans,
      gamingSystems,
      videoGames,
      gamingAccessories,
      strollersAndCarSeats,
      babyGear,
      babyToys,
      feeding,
      safetyAndHealth,
      bathAndDiapers,
      nurseryFurnitureAndAccessories,
      antiques,
      art,
      decorations,
      memorabilia,
      rocksFossilsArtifacts,
      pensAndWritingInstruments,
      audiobooks,
      digitalbooks,
      bookAccessories,
      childrensBooks,
      fiction,
      nonfiction,
      textbooks,
      cDs,
      casettes,
      digital,
      dvd,
      digitalDVD,
      vhs;
  double fontSize, treeFontSize, leadingSize, titleSize;
  @override
  Widget build(BuildContext context) {

    if (SizerUtil.deviceType == DeviceType.mobile) {
      fontSize = 5.w;
      leadingSize = 0.3.w;
      titleSize = 5.w;
      treeFontSize = 3.w;
      rotate = MediaQuery.of(context).size.width * 0.93;
    } else {
      rotate = MediaQuery.of(context).size.width * 0.96;
      fontSize = 3.w;
      leadingSize = 0.16.w;
      titleSize = 3.4.w;
      treeFontSize = 2.3.w;
    }
////DVDs & Movies Section////////////////////////////////////////////////////

////DVDs & Movies-->DVD////////////////////////////////////////////////////
    dvd = [
      translator.translate("Action, Adventure3"),
      translator.translate("Children & Family"),
      translator.translate("Comedy"),
      translator.translate("Concert/Music"),
      translator.translate("Mystery/Suspense"),
      translator.translate("Series"),
      translator.translate("Sports"),
      translator.translate("Other Genre"),
    ];
////DVDs & Movies-->Digital3////////////////////////////////////////////////////
    digitalDVD = [
      translator.translate("Action, Adventure"),
      translator.translate("Other Genre3"),
    ];
////DVDs & Movies-->VHS////////////////////////////////////////////////////
    vhs = [
      translator.translate("Action, Adventure2"),
      translator.translate("Children & Family2"),
      translator.translate("Other Genre2"),
    ];
////Lost /Found Section////////////////////////////////////////////////////

    ////Free Stuff Section////////////////////////////////////////////////////

    ////Music////////////////////////////////////////////////////

    ////Music --> Vinyl////////////////////////////////////////////////////

    ////Music --> CDs////////////////////////////////////////////////////
    cDs = [translator.translate("Latin")];
    ////Music --> Digital////////////////////////////////////////////////////
    digital = [
      translator.translate("Metal"),
      translator.translate("Rock & Indie Rock"),
    ];
    ////Music --> Casettes////////////////////////////////////////////////////
    casettes = [
      translator.translate("Classical"),
      translator.translate("Country"),
      translator.translate("R&B, Soul & Funk"),
    ];
    ////Books////////////////////////////////////////////////////

    ////Books-->Textbooks////////////////////////////////////////////////////
    textbooks = [
      translator.translate("Primary School"),
      translator.translate("Secondary School"),
      translator.translate("University"),
      translator.translate("A Levels/High School"),
    ];

    ////Books-->Nonfiction////////////////////////////////////////////////////
    nonfiction = [
      translator.translate("Business/Science/Technology"),
      translator.translate("Cook Books"),
      translator.translate("History/Biography"),
      translator.translate("How-To Books"),
      translator.translate("Self Help / Motivational Books"),
      translator.translate("Picture Books"),
      translator.translate("Religious Books"),
      translator.translate("Sports/Health Books"),
      translator.translate("Travel Books"),
      translator.translate("Other38"),
    ];

    ////Books-->Fiction////////////////////////////////////////////////////
    fiction = [
      translator.translate("Action/Adventure"),
      translator.translate("Classics"),
      translator.translate("Fantasy/Sci Fi"),
      translator.translate("Humor"),
      translator.translate("Mystery/Thriller"),
      translator.translate("Romance"),
      translator.translate("Other39"),
    ];

    ////Books-->Children's Books////////////////////////////////////////////////////
    childrensBooks = [
      translator.translate("Educational Books"),
      translator.translate("Fiction2"),
      translator.translate("Nonfiction2"),
      translator.translate("Picture/Pop Up Books"),
      translator.translate("Coloring/Activity Books"),
      translator.translate("Other40"),
    ];

    ////Books-->Book Accessories////////////////////////////////////////////////////
    bookAccessories = [
      translator.translate("Book Lights"),
      translator.translate("Daily Planners"),
      translator.translate("Other41"),
      translator.translate("Diaries/Note Books"),
    ];

    ////Books-->Digital/E-books////////////////////////////////////////////////////
    digitalbooks = [];
    ////Books-->Audiobooks////////////////////////////////////////////////////
    audiobooks = [];
    ////Collectibles////////////////////////////////////////////////////

    ////Collectibles --> Antiques////////////////////////////////////////////////////
    antiques = [
      translator.translate("Antiquities"),
      translator.translate("Books & Maps"),
      translator.translate("Decorations2"),
      translator.translate("Furniture2"),
      translator.translate("Machines, Instruments & Tools"),
      translator.translate("Other32"),
    ];
    ////Collectibles --> Art////////////////////////////////////////////////////
    art = [
      translator.translate("Drawings"),
      translator.translate("Paintings"),
      translator.translate("Statues"),
      translator.translate("Other33"),
      translator.translate("Photography"),
    ];
    ////Collectibles --> Decorations////////////////////////////////////////////////////
    decorations = [
      translator.translate("Domestic Decorations"),
      translator.translate("Linens/Textiles"),
      translator.translate("Outdoor Decoration"),
      translator.translate("Wall Hangings"),
      translator.translate("Other34"),
    ];
    ////Collectibles --> Memorabilia////////////////////////////////////////////////////
    memorabilia = [
      translator.translate("Cultural Memorabilia"),
      translator.translate("Historical Memorabilia"),
      translator.translate("Limited Edition Memorabilia"),
      translator.translate("Military Memorabilia"),
      translator.translate("Sports Memorabilia"),
      translator.translate("Other36"),
    ];
    ////Collectibles --> Rocks/Fossils/Artifacts////////////////////////////////////////////////////
    rocksFossilsArtifacts = [
      translator.translate("Artifacts"),
      translator.translate("Fossils"),
      translator.translate("Rocks, Crystals & Minerals"),
      translator.translate("Other37"),
    ];
    ////Collectibles --> PensAndWritingInstruments////////////////////////////////////////////////////
    pensAndWritingInstruments = [
      translator.translate("Pens"),
      translator.translate("Sets"),
      translator.translate("Other35"),
      translator.translate("Typewriters"),
    ];
    ////Tickets And Vouchers////////////////////////////////////////////////////

    ///اقسام ال ticketsAndVoucher
    ///ما فيها شي
    ////Toys////////////////////////////////////////////////////

    ///اقسام ال toys
    ///ما فيها شي

    ////Baby Items////////////////////////////////////////////////////

    ////Baby Items --> Strollers & Car Seats////////////////////////////////////////////////////

    strollersAndCarSeats = [
      translator.translate("Car Seat Accessories"),
      translator.translate("Infant Car Seats"),
      translator.translate("Jogging Strollers"),
      translator.translate("Pram Strollers"),
      translator.translate("Standard Strollers"),
      translator.translate("Stroller Accessories"),
      translator.translate("Toddler Car Seats"),
      translator.translate("Travel System Strollers"),
      translator.translate("Other23"),
    ];
    ////Baby Items --> Baby Gear////////////////////////////////////////////////////
    babyGear = [
      translator.translate("Chairs"),
      translator.translate("Jumping Exercisers"),
      translator.translate("Swings"),
      translator.translate("Walkers"),
      translator.translate("Other25"),
      translator.translate("Backpacks & Carriers"),
    ];
    ////Baby Items --> Baby Toys///////////////////////////////////////////////////
    babyToys = [
      translator.translate("Activity Toys"),
      translator.translate("Crib Toys"),
      translator.translate("Development/Learning Toys"),
      translator.translate("Plush/Soft Toys"),
      translator.translate("Rattles & Teethers"),
      translator.translate("Other26"),
    ];
    ////Baby Items --> Feeding////////////////////////////////////////////////////
    feeding = [
      translator.translate("Baby Food & Formula"),
      translator.translate("Bibs"),
      translator.translate("Booster/High Chairs"),
      translator.translate("Bottles"),
      translator.translate("Dishes & Utensils"),
      translator.translate("Nursing Pillows"),
      translator.translate("Pacifiers"),
      translator.translate("Other27"),
    ];

    ////Baby Items --> Safety & Health////////////////////////////////////////////////////
    safetyAndHealth = [
      translator.translate("Baby Monitors"),
      translator.translate("Baby Thermometers"),
      translator.translate("Baby House & Car Proofing"),
      translator.translate("Locks & Latches"),
      translator.translate("Other28"),
    ];
    ////Baby Items --> Bath & Diapers////////////////////////////////////////////////////
    bathAndDiapers = [
      translator.translate("Bath Tubs"),
      translator.translate("Diaper Bins"),
      translator.translate("Diapers & Wipes"),
      translator.translate("Potties"),
      translator.translate("Lotions, Powders & Shampoos"),
    ];
    ////Baby Items --> Nursery Furniture & Accessories////////////////////////////////////////////////////
    nurseryFurnitureAndAccessories = [
      translator.translate("Baby Dressers"),
      translator.translate("Bassinets, Cradles & Rockers"),
      translator.translate("Changing Tables"),
      translator.translate("Cribs"),
      translator.translate("Nursery Bedding"),
      translator.translate("Nursery Decor & Accessories"),
      translator.translate("Nursery Furniture Sets"),
      translator.translate("Other24"),
    ];
    ////Gaming////////////////////////////////////////////////////

    ////Gaming --> Gaming Systems////////////////////////////////////////////////////
    gamingSystems = [
      translator.translate("Microsoft Xbox 360"),
      translator.translate("Microsoft Xbox One"),
      translator.translate("Nintendo 64"),
      translator.translate("Nintendo DS"),
      translator.translate("Nintendo GameCube"),
      translator.translate("Nintendo NES"),
      translator.translate("Nintendo Switch"),
      translator.translate("Nintendo Wii"),
      translator.translate("PS Vita"),
      translator.translate("Sony PSP"),
      translator.translate("Sony PlayStation"),
      translator.translate("Sony PlayStation 2"),
      translator.translate("Sony PlayStation 3"),
      translator.translate("Sony PlayStation 4"),
      translator.translate("Sony PlayStation 5"),
      translator.translate("Super Nintendo"),
      translator.translate("Other20"),
    ];

    ////Gaming --> "Video Games"////////////////////////////////////////////////////
    videoGames = [
      translator.translate("Microsoft Xbox 3602"),
      translator.translate("Microsoft Xbox One2"),
      translator.translate("Nintendo 642"),
      translator.translate("Nintendo DS2"),
      translator.translate("Nintendo GameCube2"),
      translator.translate("Nintendo NES2"),
      translator.translate("Nintendo Switch2"),
      translator.translate("Nintendo Wii2"),
      translator.translate("PS Vita2"),
      translator.translate("PC"),
      translator.translate("Sony PSP2"),
      translator.translate("Sony PlayStation2"),
      translator.translate("Sony PlayStation 22"),
      translator.translate("Sony PlayStation 32"),
      translator.translate("Sony PlayStation 42"),
      translator.translate("Sony PlayStation 52"),
      translator.translate("Super Nintendo2"),
      translator.translate("Other21"),
    ];

    ////Gaming --> "Gaming Accessories"////////////////////////////////////////////////////
    gamingAccessories = [
      translator.translate("Microsoft Xbox 3603"),
      translator.translate("Microsoft Xbox One3"),
      translator.translate("Nintendo 643"),
      translator.translate("Nintendo DS3"),
      translator.translate("Nintendo GameCube3"),
      translator.translate("Nintendo NES3"),
      translator.translate("Nintendo Switch3"),
      translator.translate("Nintendo Wii3"),
      translator.translate("PS Vita3"),
      translator.translate("PC2"),
      translator.translate("Sony PSP3"),
      translator.translate("Sony PlayStation3"),
      translator.translate("Sony PlayStation 23"),
      translator.translate("Sony PlayStation 33"),
      translator.translate("Sony PlayStation 43"),
      translator.translate("Sony PlayStation 53"),
      translator.translate("Super Nintendo3"),
      translator.translate("Other22"),
    ];
    ////Musical Instruments////////////////////////////////////////////////////

    ////Musical Instruments--> Guitars////////////////////////////////////////////////////

    guitars = [
      translator.translate("Acoustic"),
      translator.translate("Acoustic Electric"),
      translator.translate("Amps & Chords"),
      translator.translate("Bass"),
      translator.translate("Electric"),
      translator.translate("Cases & Accessories"),
    ];
    ////Musical Instruments--> Percussion////////////////////////////////////////////////////

    percussion = [
      translator.translate("Bells & Cymbals"),
      translator.translate("Drums"),
      translator.translate("Other18"),
      translator.translate("Equipment & Accessories"),
    ];
    ////Musical Instruments--> String Instruments////////////////////////////////////////////////////
    stringInstruments = [
      translator.translate("Equipment & Accessories2"),
      translator.translate("Viola & Violin"),
      translator.translate("Other String Instruments"),
    ];

    ////Musical Instruments--> Wind Instruments////////////////////////////////////////////////////
    windInstruments = [
      translator.translate("Flute"),
      translator.translate("Saxophone"),
      translator.translate("Other Brass"),
      translator.translate("Other Woodwind"),
    ];
    ////Musical Instruments--> DJ & Recording Equipment////////////////////////////////////////////////////
    dJAndRecordingEquipment = [];
    ////Musical Instruments--> Pianos, Keyboards & Organs////////////////////////////////////////////////////
    pianosKeyboardsAndOrgans = [
      translator.translate("Equipment & Accessories3"),
      translator.translate("Grand Pianos"),
      translator.translate("Keyboards & Synthesizers"),
      translator.translate("Organs"),
      translator.translate("Upright Pianos"),
      translator.translate("Other19"),
    ];
    ////Pets////////////////////////////////////////////////////

    ////Pets --> Pet Accessories////////////////////////////////////////////////////
    petAccessories = [
      translator.translate("Bird Supplies"),
      translator.translate("Cat Supplies"),
      translator.translate("Dog Supplies"),
      translator.translate("Rabbit & Rodent Supplies"),
      translator.translate("Other Pet Supplies"),
      translator.translate("Aquariums & Fish/Reptile Supplies"),
    ];
    ////Pets --> Pets for Free Adoption////////////////////////////////////////////////////
    petsforFreeAdoption = [
      translator.translate("Birds"),
      translator.translate("Cats"),
      translator.translate("Dogs"),
      translator.translate("Fish"),
      translator.translate("Reptiles"),
      translator.translate("Rabbits & Rodents"),
      translator.translate("Other53"),
    ];
////Jewelry and Watches////////////////////////////////////////////////////

////Jewelry and Watches --> Watches////////////////////////////////////////////////////
    watches = [
      translator.translate("Children's Watches"),
      translator.translate("Men's Sport Watches"),
      translator.translate("Men's Watches"),
      translator.translate("Women's Sport Watches"),
      translator.translate("Women's Watches"),
      translator.translate("Pocket Watches & Stop Watches"),
    ];
////Jewelry and Watches --> Men's Jewelry////////////////////////////////////////////////////
    mensJewelry = [
      translator.translate("Belt Buckles"),
      translator.translate("Bracelets"),
      translator.translate("Cufflinks"),
      translator.translate("Chains & Necklaces"),
      translator.translate("Rings"),
      translator.translate("Other15"),
    ];

////Jewelry and Watches --> Women's Jewelry////////////////////////////////////////////////////
    womensJewelry = [
      translator.translate("Body Jewelry"),
      translator.translate("Bracelets2"),
      translator.translate("Earrings"),
      translator.translate("Ethnic & Artisan Jewelry"),
      translator.translate("Hair Jewelry"),
      translator.translate("Pins & Brooches"),
      translator.translate("Rings2"),
      translator.translate("Other16"),
    ];
////Jewelry and Watches --> Loose Diamonds & Gems////////////////////////////////////////////////////
    looseDiamondsAndGems = [
      translator.translate("Diamonds"),
      translator.translate("Gemstones"),
    ];
////Cameras And Imaging////////////////////////////////////////////////////

////Cameras And Imaging--> Digital Cameras////////////////////////////////////////////////////

    digitalCameras = [
      translator.translate("Mirrorless Digital Cameras"),
      translator.translate("Point & Shoot"),
      translator.translate("SLR/Professional"),
      translator.translate("Underwater"),
      translator.translate("Other8"),
    ];
////Cameras And Imaging--> Professional Equipment////////////////////////////////////////////////////
    professionalEquipment = [
      translator.translate("Audio"),
      translator.translate("Editing"),
      translator.translate("Lighting2"),
      translator.translate("Monitors2"),
      translator.translate("Printing"),
      translator.translate("Video Cameras"),
      translator.translate("Other9"),
      translator.translate("Projection/Screens"),
    ];
////Cameras And Imaging--> Camera Accessories////////////////////////////////////////////////////

    cameraAccessories = [
      translator.translate("Digital Cameras Accessories"),
      translator.translate("Bags & Straps"),
      translator.translate("Film Camera Accessories"),
      translator.translate("Other10"),
    ];
////Cameras And Imaging--> Camcorders////////////////////////////////////////////////////
    camcorders = [
      translator.translate("Analog"),
      translator.translate("Digital"),
      translator.translate("Other12"),
    ];
////Cameras And Imaging--> Film Cameras////////////////////////////////////////////////////
    filmCameras = [
      translator.translate("35mm Point & Shoot"),
      translator.translate("35mm SLR"),
      translator.translate("Instant/Polaroid"),
      translator.translate("Other13"),
    ];
////Cameras And Imaging-->Binoculars/Telescopes////////////////////////////////////////////////////
    binocularsAndTelescopes = [
      translator.translate("Accessories3"),
      translator.translate("Telescopes"),
      translator.translate("Binoculars/Minoculars"),
    ];
////Cameras And Imaging--> Camcorder Accessories////////////////////////////////////////////////////

////Cameras And Imaging--> Camera Drones////////////////////////////////////////////////////

////Cameras And Imaging--> Tripods & Stands////////////////////////////////////////////////////
    tripodsAndStands = [
      translator.translate("Monopods"),
      translator.translate("Tripods"),
      translator.translate("Other11"),
      translator.translate("Stand Accessories"),
    ];
////Cameras And Imaging--> LensesFiltersAndLighting  ////////////////////////////////////////////////////

    lensesFiltersAndLighting = [
      translator.translate("Filters2"),
      translator.translate("Flash Units"),
      translator.translate("Lenses"),
      translator.translate("Lens Accessories"),
      translator.translate("Flash Accessories"),
    ];
////Clothing & Accessories////////////////////////////////////////////////////

////Clothing & Accessories --> Clothing////////////////////////////////////////////////////
    clothing = [
      translator.translate("Men2"),
      translator.translate("Unisex2"),
      translator.translate("Women2"),
      translator.translate("Children2"),
    ];
////Clothing & Accessories --> Fragrances////////////////////////////////////////////////////
    fragrances = [
      translator.translate("Men3"),
      translator.translate("Women3"),
      translator.translate("Unisex3"),
    ];
////Clothing & Accessories --> Wedding Apparel////////////////////////////////////////////////////
    weddingApparel = [
      translator.translate("Men4"),
      translator.translate("Women4"),
      translator.translate("Children4"),
    ];
////Clothing & Accessories --> Luggage////////////////////////////////////////////////////
    luggage = [
      translator.translate("Backpacks"),
      translator.translate("Cases"),
      translator.translate("Duffel Bags"),
      translator.translate("Roller Luggage"),
    ];
////Clothing & Accessories --> Costumes & Uniforms////////////////////////////////////////////////////

    costumesAndUniforms = [
      translator.translate("Men5"),
      translator.translate("Unisex5"),
      translator.translate("Women5"),
      translator.translate("Children5"),
    ];
////Clothing & Accessories --> Vintage & Highend Clothing////////////////////////////////////////////////////
    vintageAndHighendClothing = [
      translator.translate("Men6"),
      translator.translate("Women6"),
      translator.translate("Unisex6"),
    ];
////Clothing & Accessories -->  Make up & Skin Care ////////////////////////////////////////////////////

////Clothing & Accessories -->  Women’s Accessories ////////////////////////////////////////////////////
    womensAccessories = [
      translator.translate("Belts2"),
      translator.translate("Gloves2"),
      translator.translate("Hats2"),
      translator.translate("Sunglasses2"),
      translator.translate("Other7"),
      translator.translate("Hair Accessories"),
    ];
////Clothing & Accessories -->  Men’s Accessories ////////////////////////////////////////////////////
    mensAccessories = [
      translator.translate("Belts"),
      translator.translate("Gloves"),
      translator.translate("Hats"),
      translator.translate("Ties"),
      translator.translate("Other6"),
      translator.translate("Sunglasses"),
    ];

////Clothing & Accessories -->  Handbags, Bags & Wallets ////////////////////////////////////////////////////
    handbagsBagsAndWallets = [
      translator.translate("Athletic Bags"),
      translator.translate("Bags2"),
      translator.translate("Briefcases"),
      translator.translate("Mens Wallets"),
      translator.translate("Women's Wallets"),
      translator.translate("Women's Handbags"),
    ];
////Clothing & Accessories -->  Shoes/Footwear ////////////////////////////////////////////////////
    shoesAndFootwear = [
      translator.translate("Men"),
      translator.translate("Unisex"),
      translator.translate("Women"),
      translator.translate("Children"),
    ];

////Sport Equipment////////////////////////////////////////////////////

////Sport Equipment -->Cycling////////////////////////////////////////////////////
    cycling = [
      translator.translate("Children's Bikes"),
      translator.translate("Cruiser Bikes"),
      translator.translate("Cycling Equipment & Accessories"),
      translator.translate("Inline & Roller Skating"),
      translator.translate("Mountain Bikes"),
      translator.translate("Racing Bikes"),
      translator.translate("Tricycles & Unicycles"),
      translator.translate("Other2"),
      translator.translate("Electric Scooters & Hoverboards"),
    ];
    ////Sport Equipment -->Golf////////////////////////////////////////////////////
    golf = [
      translator.translate("Bags"),
      translator.translate("Balls"),
      translator.translate("Clubs"),
      translator.translate("Accessories2"),
    ];
    ////Sport Equipment -->Exercise Equipment////////////////////////////////////////////////////
    exerciseEquipment = [
      translator.translate("Boxing & Martial Arts Equipment"),
      translator.translate("Weights and Exercise Machines"),
      translator.translate("Yoga & Pilates"),
      translator.translate("Other Exercise Equipment"),
      translator.translate("Running & Cardiovascular Machines"),
    ];
    ////Sport Equipment -->Indoor Sports////////////////////////////////////////////////////
    indoorSports = [
      translator.translate("Billiards"),
      translator.translate("Foosball"),
      translator.translate("Other Indoor Sports"),
      translator.translate("Table Tennis, Ping Pong"),
    ];
    ////Sport Equipment -->Winter Sports////////////////////////////////////////////////////
    winterSports = [
      translator.translate("Ice Skating"),
      translator.translate("Skiing"),
      translator.translate("Snowboarding"),
    ];
    ////Sport Equipment -->Water Sports////////////////////////////////////////////////////
    waterSports = [
      translator.translate("Diving & Snorkeling"),
      translator.translate("Fishing"),
      translator.translate("Kayaking & Rafting"),
      translator.translate("Kitesurfing"),
      translator.translate("Surfing"),
      translator.translate("Swimming"),
      translator.translate("Wetsuits & Drysuits"),
      translator.translate("Other3"),
      translator.translate("Wakeboarding & Waterskiing"),
    ];

    ////Sport Equipment -->Team Sports////////////////////////////////////////////////////
    teamSports = [
      translator.translate("Basketball"),
      translator.translate("Bowling"),
      translator.translate("Cricket"),
      translator.translate("Other Sports2"),
      translator.translate("Football/Soccer"),
    ];
    ////Sport Equipment -->Camping & Hiking////////////////////////////////////////////////////
    campingAndHiking = [
      translator.translate("Hiking Equipment"),
      translator.translate("Camping Equipment"),
      translator.translate("Other4"),
    ];
    ////Sport Equipment -->Tennis & Racquet Sports////////////////////////////////////////////////////
    tennisAndRacquetSports = [
      translator.translate("Badminton"),
      translator.translate("Squash"),
      translator.translate("Tennis"),
      translator.translate("Other5"),
    ];
////Home Appliances////////////////////////////////////////////////////

////Home Appliances --> Small Kitchen Appliances////////////////////////////////////

    smallKitchenAppliances = [
      translator.translate("Blenders & Juicers"),
      translator.translate("Bread Machines"),
      translator.translate("Coffee & Espresso Appliances"),
      translator.translate("Fryers"),
      translator.translate("Hot Plates & Grills"),
      translator.translate("Processors, Mixers & Grinders"),
      translator.translate("Kettles"),
      translator.translate("Slow Cookers & Steamers"),
      translator.translate("Toasters"),
      translator.translate("Otheeer"),
    ];
////Home Appliances --> outdoorAppliances////////////////////////////////////
    outdoorAppliances = [
      translator.translate("Blowers"),
      translator.translate("Charcoal Grills"),
      translator.translate("Gas Grills"),
      translator.translate("Ice Chests"),
      translator.translate("Lawnmowers"),
      translator.translate("Pressure Washers"),
      translator.translate("Power Tools"),
      translator.translate("Other1"),
    ];
////Home Appliances --> smallBathroomAppliances////////////////////////////////////
    smallBathroomAppliances = [
      translator.translate("Massagers & Foot Spa"),
      translator.translate("Scales"),
      translator.translate("Shavers & Trimmers"),
      translator.translate("Hair Dryers, Curlers & Straighteners"),
      translator.translate("Otheerr"),
    ];
////Home Appliances --> ironsAndSewingMachines////////////////////////////////////
    ironsAndSewingMachines = [];
////Home Appliances --> vaccumsAndFloorCare////////////////////////////////////
    vaccumsAndFloorCare = [];
////Home Appliances --> largeAppliancesWhiteGoods////////////////////////////////////
    largeAppliancesWhiteGoods = [
      translator.translate("Air Conditioners"),
      translator.translate("Dishwashers"),
      translator.translate("Gas Cylinders"),
      translator.translate("Humidifiers & Air Purifiers"),
      translator.translate("Ovens & Microwaves"),
      translator.translate("Refrigerators & Freezers"),
      translator.translate("Ranges & Cooking Appliances"),
      translator.translate("Washers & Dryers"),
      translator.translate("Water Coolers"),
      translator.translate("Otherrr"),
    ];

    ///classifieds Section//////////////////////////////////////////////////////////////////////////////

    /* electronics = [
      translator.translate("Home Audio & Turntables"),
      translator.translate("Televisions"),
      translator.translate("DVD & Home Theater"),
      translator.translate("Electronic Accessories"),
      translator.translate("Gadgets"),
      translator.translate("Car Electronics"),
      translator.translate("Satellite & Cable TV"),
      translator.translate("Health Electronics"),
      translator.translate("Smart Home"),
      translator.translate("Wearable Technology"),
      translator.translate("Mp3 Players and Portable Audio"),
      translator.translate("Other Electronics"),
    ];*/

    /*  computersAndNetworking = [
      translator.translate("Computerss"),
      translator.translate("Computer Components"),
      translator.translate("Accessoriess"),
      translator.translate("Networking & Communication"),
      translator.translate("Software"),
      translator.translate("Monitors, Printers & Other Peripherals"),
    ];*/
////////////////////////////////////////////////////////////////////////////////////////

    ///Computers And Networking Section//////////////////////////////////////////////
    ///Computers And Networking-->computers Section/////
    computers = [
      translator.translate("Laptop Computers"),
      translator.translate("Netbooks"),
      translator.translate("Servers"),
      translator.translate("Tablets"),
      translator.translate("Desktop Computers"),
    ];

    ///Computers And Networking-->computerComponents Section/////

    computerComponents = [
      translator.translate("CPUs"),
      translator.translate("Cases & Towers"),
      translator.translate("Drivers"),
      translator.translate("Fans & Cooling"),
      translator.translate("Memory"),
      translator.translate("Graphics & Video Cards"),
      translator.translate("Power Supplies"),
      translator.translate("Screens & LCD Panels"),
      translator.translate("Sound Cards"),
      translator.translate("Storage"),
      translator.translate("Motherboards"),
      translator.translate("Otther"),
    ];

    ///Computers And Networking-->accessories Comp Section/////

    accessoriesComp = [
      translator.translate("Bags & Cases"),
      translator.translate("Chargers & Cables"),
      translator.translate("Docking Stations"),
      translator.translate("External Hard Drives"),
      translator.translate("Speakers"),
      translator.translate("Webcams"),
      translator.translate("Other Accessories"),
      translator.translate("Headsets & Microphones"),
    ];

    ///Computers And Networking--> networking And ommunication/////
    networkingAndommunication = [
      translator.translate("Modems"),
      translator.translate("Networking Cables"),
      translator.translate("Networking Hubs"),
      translator.translate("Networking Switches"),
      translator.translate("Routers"),
      translator.translate("Securityy"),
      translator.translate("VoIP Business Phones"),
      translator.translate("oother"),
      translator.translate("Wireless Access Points"),
    ];

    ///Computers And Networking--> software/////
    software = [
      translator.translate("Business"),
      translator.translate("Design"),
      translator.translate("Education"),
      translator.translate("Gamingg"),
      translator.translate("Networking"),
      translator.translate("Security"),
      translator.translate("Other Software"),
      translator.translate("Personal Managment"),
    ];

    monitorsAndPrintersAndOtherPeripherals = [
      translator.translate("Keyboards"),
      translator.translate("Mice"),
      translator.translate("Monitors"),
      translator.translate("Printers"),
      translator.translate("Scanners"),
      translator.translate("Othher"),
      translator.translate("Projectors"),
    ];

    ///Electronics Section/////////////////////////////////////////////////////

    homeAudioAndTurntables = [
      translator.translate("Amplifiers"),
      translator.translate("CD Players/Recorders"),
      translator.translate("Cassette Players/Recorders"),
      translator.translate("Digital Music Systems"),
      translator.translate("Karaoke"),
      translator.translate("Radios"),
      translator.translate("Receivers"),
      translator.translate("Speakers & Subwoofers"),
      translator.translate("Turntables"),
      translator.translate("Turntable Parts & Accessories"),
    ];

    televisions = [
      translator.translate("Flat Panel"),
      translator.translate("LCD"),
      translator.translate("LED LCD"),
      translator.translate("OLED TVs"),
      translator.translate("Plasma"),
      translator.translate("Projection"),
      translator.translate("Standard CRT"),
      translator.translate("Other Televisions"),
    ];

    dvdAndHomeTheater = [
      translator.translate("DVD Players"),
      translator.translate("Media Streamers"),
      translator.translate("VCRs"),
      translator.translate("Home Theater Systems"),
    ];
    electronicAccessories = [
      translator.translate("Antennas"),
      translator.translate("Cables and Chords"),
      translator.translate("Headphones"),
      translator.translate("Travel Converter"),
      translator.translate("Chargers/Batteries"),
    ];
    gadgets = [
      translator.translate("Calculators"),
      translator.translate("Dictaphones"),
      translator.translate("Digital Scales"),
      translator.translate("GPS Navigation"),
      translator.translate("Landline Telephones"),
      translator.translate("Surveillance"),
      translator.translate("eBook Readers"),
      translator.translate("Other Gadgets"),
      translator.translate("Digital Clocks/Radios"),
    ];
    carElectronics = [
      translator.translate("Car Alarms"),
      translator.translate("Car Speakers"),
      translator.translate("Car Video"),
      translator.translate("Car Audio Systems"),
      translator.translate("Other Car Electronics"),
    ];
    satelliteAndCableTV = [
      translator.translate("Cable TV Boxes"),
      translator.translate("Satellite TV Equipment"),
    ];

    healthElectronics = [];
    smartHome = [];
    wearableTechnology = [
      translator.translate("Smart Watches"),
      translator.translate("VR Headsets"),
      translator.translate("Fitness Trackers"),
    ];

    mp3PlayersandPortableAudio = [
      translator.translate("Apple iPod"),
      translator.translate("CD Player"),
      translator.translate("MP3 Speakers"),
      translator.translate("Microsoft MP3 Player"),
    ];
    ////////////////////////////Business & Industrial///////////////////////////////////

    ////////Business & Industrial --> Businesses for Sale///////////////////////////////////
    businessesforSale = [
      translator.translate("Manufacturing2"),
      translator.translate("Marketing"),
      translator.translate("Retail"),
      translator.translate("Service Business"),
      translator.translate("Other44"),
      translator.translate("Trade & Distribution"),
    ];
    ////////Business & Industrial --> Industrial Supplies///////////////////////////////////

    industrialSupplies = [
      translator.translate("Generators"),
      translator.translate("HVAC"),
      translator.translate("Hardware"),
      translator.translate("Lifts & Lift parts"),
      translator.translate("Painting Equip & Supplies"),
      translator.translate("Other47"),
    ];
    ////////Business & Industrial -->  officeFurnitureAndEquipment///////////////////////////////////
    officeFurnitureAndEquipment = [
      translator.translate("Office Fit Outs"),
      translator.translate("Office Supplies"),
      translator.translate("Phones & Faxes"),
      translator.translate("Office Equipment"),
    ];
    ////////Business & Industrial -->  manufacturing///////////////////////////////////

    manufacturing = [
      translator.translate("Metals"),
      translator.translate("Textiles"),
      translator.translate("Welding"),
      translator.translate("Manufacturing Equip. & Tools"),
    ];
    ////////Business & Industrial -->  healthcareAndLab///////////////////////////////////

    healthcareAndLab = [
      translator.translate("Dental Equipment"),
      translator.translate("Imaging Equip. & Supplies"),
      translator.translate("Other50"),
      translator.translate("Medical Equip. & Supplies"),
    ];
    ////////Business & Industrial -->  commercialPrintingAndCopyMachines///////////////////////////////////

    commercialPrintingAndCopyMachines = [
      translator.translate("Copy Machines"),
      translator.translate("Ink & Print Cartridges"),
      translator.translate("Screen & Specialty Printers"),
      translator.translate("Other51"),
    ];
    ////////Business & Industrial -->  agricultureAndForestry///////////////////////////////////

    agricultureAndForestry = [
      translator.translate("Farm Equipment Parts"),
      translator.translate("Other52"),
      translator.translate("Tractors & Equipment"),
    ];
    ////////Business & Industrial -->  packingAndShipping///////////////////////////////////

    packingAndShipping = [
      translator.translate("Bags3"),
      translator.translate("Boxes"),
      translator.translate("Scales2"),
      translator.translate("Envelopes"),
    ];
    ////////Business & Industrial -->  retailAndServices///////////////////////////////////

    retailAndServices = [
      translator.translate("In Store Display Equipment"),
      translator.translate("Racks & Fixtures"),
      translator.translate("Security & Surveillance"),
      translator.translate("Other49"),
    ];
    ////////Business & Industrial -->  electricalEquipment///////////////////////////////////

    electricalEquipment = [
      translator.translate("Wire, Transformers, Breakers, etc..."),
      translator.translate("Electrical Equip. Tools"),
      translator.translate("Other48"),
    ];
    ////////Business & Industrial -->  foodAndBeverage///////////////////////////////////

    foodAndBeverage = [
      translator.translate("Bar Equipment"),
      translator.translate("Commercial Kitchen & Supplies"),
      translator.translate("Furniture & Decor"),
      translator.translate("Refrigeration & Ice"),
      translator.translate("Serving"),
      translator.translate("Other46"),
    ];
    ////////Business & Industrial -->  construction///////////////////////////////////

    construction = [
      translator.translate("Building Materials & Supplies"),
      translator.translate("Heavy Equipment & Parts"),
      translator.translate("Light Equipment & Tools"),
      translator.translate("Other45"),
    ];

    /*babyItems = [
      translator.translate("Baby Toys"),
      translator.translate("Bath & Diapers"),
      translator.translate("Safety & Health"),
      translator.translate("Strollers & Car Seats"),
      translator.translate("Nursery Furniture & Accessories"),
    ];*/

    /* camerasAndImaging = [
      translator.translate("Camera Accessories"),
      translator.translate("Camera Drones"),
      translator.translate("Digital Cameras"),
      translator.translate("Film Cameras"),
      translator.translate("Professional Equipment"),
    ];*/
    clothingAndccessories = [
      translator.translate("Clothing"),
      translator.translate("Men’s Accessories"),
      translator.translate("Shoes / Footwear"),
      translator.translate("Women’s Accessories"),
      translator.translate("Handbags, Bags & Wallets"),
    ];

    /*electronics = [
      translator.translate("Car Electronics"),
      translator.translate("DVD & Home Theater"),
      translator.translate("Gadgets"),
      translator.translate("Electronic Accessories ")
    ];*/

    /* if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }*/

    gotoScreen(int choice2) {
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          if (choice2 == 0)
            return ClassifiedModels(
                choice: true,
                clasiList: homeAudioAndTurntables,
                index: 0,
                clasiModel: "Electronics",
                clasiModelchild: "Home Audio & Turntables");

          if (choice2 == 1)
            return ClassifiedModels(
                choice: true,
                clasiList: televisions,
                index: 1,
                clasiModel: "Electronics",
                clasiModelchild: "Television");

          if (choice2 == 2)
            return ClassifiedModels(
                choice: true,
                clasiList: dvdAndHomeTheater,
                index: 2,
                clasiModel: "Electronics",
                clasiModelchild: "DVD & Home Theater");

          if (choice2 == 3)
            return ClassifiedModels(
                choice: true,
                clasiList: electronicAccessories,
                index: 3,
                clasiModel: "Electronics",
                clasiModelchild: "Electronic Accessories");

          if (choice2 == 4)
            return ClassifiedModels(
                choice: true,
                clasiList: gadgets,
                index: 4,
                clasiModel: "Electronics",
                clasiModelchild: "Gadgets");

          if (choice2 == 5)
            return ClassifiedModels(
                choice: true,
                clasiList: carElectronics,
                index: 5,
                clasiModel: "Electronics",
                clasiModelchild: "Car Electronics");
          if (choice2 == 6)
            return ClassifiedModels(
                choice: true,
                clasiList: satelliteAndCableTV,
                index: 6,
                clasiModel: "Electronics",
                clasiModelchild: "Satellite & Cable TV");

          if (choice2 == 7)
            return ClassifiedModels(
                choice: true,
                clasiList: healthElectronics,
                index: 7,
                clasiModel: "Electronics",
                clasiModelchild: "Health Electronics");

          if (choice2 == 8)
            return ClassifiedModels(
                choice: true,
                clasiList: smartHome,
                index: 8,
                clasiModel: "Electronics",
                clasiModelchild: "Smart Home");

          if (choice2 == 9)
            return ClassifiedModels(
                choice: true,
                clasiList: wearableTechnology,
                index: 9,
                clasiModel: "Electronics",
                clasiModelchild: "Wearable Technology");

          if (choice2 == 10)
            return ClassifiedModels(
                choice: true,
                clasiList: mp3PlayersandPortableAudio,
                index: 10,
                clasiModel: "Electronics",
                clasiModelchild: "Mp3 Players and Portable Audio");

          if (choice2 == 11)
            return ClassifiedModels(
                choice: true,
                clasiList: computers,
                index: 11,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Computers");
          if (choice2 == 12)
            return ClassifiedModels(
                choice: true,
                clasiList: computerComponents,
                index: 12,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Computer Components");
          if (choice2 == 13)
            return ClassifiedModels(
                choice: true,
                clasiList: accessoriesComp,
                index: 13,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Accessoriess");
          if (choice2 == 14)
            return ClassifiedModels(
                choice: true,
                clasiList: networkingAndommunication,
                index: 14,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Networking & Communication");
          if (choice2 == 15)
            return ClassifiedModels(
                choice: true,
                clasiList: software,
                index: 15,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Software");
          if (choice2 == 16)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 16,
                clasiModel: "Computers And Networking",
                clasiModelchild: "Monitors, Printers & Other Peripherals");
          ////////////////////////////////////////////////////////////////////
          if (choice2 == 17)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 17,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Businesses for Sale");
          if (choice2 == 18)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 18,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Construction");
          if (choice2 == 19)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 19,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Food & Beverage");
          if (choice2 == 20)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 20,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Industrial Supplies");
          if (choice2 == 21)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 21,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Office Furniture & Equipment");
          if (choice2 == 22)
            return ClassifiedModels(
                choice: true,
                clasiList: manufacturing,
                index: 22,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Manufacturing");
          if (choice2 == 23)
            return ClassifiedModels(
                choice: true,
                clasiList: electricalEquipment,
                index: 23,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Electrical Equipment");
          if (choice2 == 24)
            return ClassifiedModels(
                choice: true,
                clasiList: retailAndServices,
                index: 24,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Retail & Services");
          if (choice2 == 25)
            return ClassifiedModels(
                choice: true,
                clasiList: healthcareAndLab,
                index: 25,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Healthcare & Lab");
          if (choice2 == 26)
            return ClassifiedModels(
                choice: true,
                clasiList: commercialPrintingAndCopyMachines,
                index: 26,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Commercial Printing & Copy Machines");
          if (choice2 == 27)
            return ClassifiedModels(
                choice: true,
                clasiList: packingAndShipping,
                index: 27,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Packing & Shipping");
          if (choice2 == 28)
            return ClassifiedModels(
                choice: true,
                clasiList: agricultureAndForestry,
                index: 28,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Agriculture & Forestry");
          if (choice2 == 29)
            return ClassifiedModels(
                choice: true,
                clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 29,
                clasiModel: "Business & Industrial",
                clasiModelchild: "Other");
          //////////////////////////////Home Appliances///////////////////////
          if (choice2 == 30)
            return ClassifiedModels(
                choice: true,
                clasiList: smallKitchenAppliances,
                index: 30,
                clasiModel: "Home Appliances",
                clasiModelchild: "Small Kitchen Appliances");
          /*  if (choice2 == 31)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 31,
                clasiModel: "Home Appliances",
                clasiModelchild: "Outdoor Appliances");*/
          if (choice2 == 32)
            return ClassifiedModels(
                choice: true,
                clasiList: smallBathroomAppliances,
                index: 32,
                clasiModel: "Home Appliances",
                clasiModelchild: "Small Bathroom Appliances");
          if (choice2 == 33)
            return ClassifiedModels(
                choice: true,
                clasiList: ironsAndSewingMachines,
                index: 33,
                clasiModel: "Home Appliances",
                clasiModelchild: "Irons & Sewing Machines");
          if (choice2 == 34)
            return ClassifiedModels(
                choice: true,
                clasiList: vaccumsAndFloorCare,
                index: 34,
                clasiModel: "Home Appliances",
                clasiModelchild: "Vaccums & Floor Care");
          if (choice2 == 35)
            return ClassifiedModels(
                choice: true,
                clasiList: largeAppliancesWhiteGoods,
                index: 35,
                clasiModel: "Home Appliances",
                clasiModelchild: "Large Appliances / White Goods");
          /* if (choice2 == 36)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 36,
                clasiModel: "Home Appliances",
                clasiModelchild: "Other");*/
          //////////////////////////////sportEquipment///////////////////////
          if (choice2 == 37)
            return ClassifiedModels(
                choice: true,
                clasiList: cycling,
                index: 37,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Cycling");
          if (choice2 == 38)
            return ClassifiedModels(
                choice: true,
                clasiList: exerciseEquipment,
                index: 38,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Exercise Equipment");
          if (choice2 == 39)
            return ClassifiedModels(
                choice: true,
                clasiList: waterSports,
                index: 39,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Water Sports");
          if (choice2 == 40)
            return ClassifiedModels(
                choice: true,
                clasiList: campingAndHiking,
                index: 40,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Camping & Hiking");
          if (choice2 == 41)
            return ClassifiedModels(
                choice: true,
                clasiList: golf,
                index: 41,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Golf");
          if (choice2 == 42)
            return ClassifiedModels(
                choice: true,
                clasiList: tennisAndRacquetSports,
                index: 42,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Tennis & Racquet Sports");
          if (choice2 == 43)
            return ClassifiedModels(
                choice: true,
                clasiList: indoorSports,
                index: 43,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Indoor Sports");
          if (choice2 == 44)
            return ClassifiedModels(
                choice: true,
                clasiList: teamSports,
                index: 44,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Team Sports");
          if (choice2 == 45)
            return ClassifiedModels(
                choice: true,
                clasiList: winterSports,
                index: 45,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Winter Sports");
          /* if (choice2 == 46)
            return ClassifiedModels(
                choice: true,
                //   clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 46,
                clasiModel: "Sport Equipment",
                clasiModelchild: "Other Sports");*/
          //////////////////////////////Clothing & Accessories///////////////////////
          if (choice2 == 47)
            return ClassifiedModels(
                choice: true,
                clasiList: shoesAndFootwear,
                index: 47,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Shoes/Footwear");
          if (choice2 == 48)
            return ClassifiedModels(
                choice: true,
                clasiList: clothing,
                index: 48,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Clothing");
          if (choice2 == 49)
            return ClassifiedModels(
                choice: true,
                clasiList: handbagsBagsAndWallets,
                index: 49,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Handbags, Bags & Wallets");

          if (choice2 == 50)
            return ClassifiedModels(
                choice: true,
                clasiList: mensAccessories,
                index: 50,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Men's Accessories");
          if (choice2 == 51)
            return ClassifiedModels(
                choice: true,
                clasiList: womensAccessories,
                index: 51,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Women's Accessories");
          if (choice2 == 52)
            return ClassifiedModels(
                choice: true,
                clasiList: luggage,
                index: 52,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Luggage");
          if (choice2 == 53)
            return ClassifiedModels(
                choice: true,
                clasiList: fragrances,
                index: 53,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Fragrances");
          if (choice2 == 54)
            return ClassifiedModels(
                choice: true,
                clasiList: weddingApparel,
                index: 54,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Wedding Apparel");

          if (choice2 == 55)
            return ClassifiedModels(
                choice: true,
                clasiList: costumesAndUniforms,
                index: 55,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Costumes & Uniforms");
          /* if (choice2 == 56)
            return ClassifiedModels(
                choice: true,
                //  clasiList: makeup,
                index: 56,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Make up & Skin Care");*/
          if (choice2 == 57)
            return ClassifiedModels(
                choice: true,
                clasiList: vintageAndHighendClothing,
                index: 57,
                clasiModel: "Clothing & Accessories",
                clasiModelchild: "Vintage & Highend Clothing");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 58)
            return ClassifiedModels(
                choice: true,
                clasiList: digitalCameras,
                index: 58,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Digital Cameras");
          if (choice2 == 59)
            return ClassifiedModels(
                choice: true,
                clasiList: professionalEquipment,
                index: 59,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Professional Equipment");
          if (choice2 == 60)
            return ClassifiedModels(
                choice: true,
                clasiList: cameraAccessories,
                index: 60,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Camera Accessories");
          if (choice2 == 61)
            return ClassifiedModels(
                choice: true,
                clasiList: tripodsAndStands,
                index: 61,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Tripods & Stands");
          if (choice2 == 62)
            return ClassifiedModels(
                choice: true,
                clasiList: camcorders,
                index: 62,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Camcorders");
          if (choice2 == 63)
            return ClassifiedModels(
                choice: true,
                clasiList: filmCameras,
                index: 63,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Film Cameras");
          if (choice2 == 64)
            return ClassifiedModels(
                choice: true,
                clasiList: binocularsAndTelescopes,
                index: 64,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Binoculars/Telescopes");
          /* if (choice2 == 65)
            return ClassifiedModels(
                choice: true,
                //   clasiList: camcorderAccessories,
                index: 65,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Camcorder Accessories");
          if (choice2 == 66)
            return ClassifiedModels(
                choice: true,
                //  clasiList: cameraDrones,
                index: 66,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Camera Drones");*/
          if (choice2 == 67)
            return ClassifiedModels(
                choice: true,
                clasiList: lensesFiltersAndLighting,
                index: 67,
                clasiModel: "Cameras And Imaging",
                clasiModelchild: "Lenses, Filters & Lighting");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 68)
            return ClassifiedModels(
                choice: true,
                clasiList: watches,
                index: 68,
                clasiModel: "Jewelry and Watches",
                clasiModelchild: "Watches");
          if (choice2 == 69)
            return ClassifiedModels(
                choice: true,
                clasiList: womensJewelry,
                index: 69,
                clasiModel: "Jewelry and Watches",
                clasiModelchild: "Women's Jewelry");
          if (choice2 == 70)
            return ClassifiedModels(
                choice: true,
                clasiList: looseDiamondsAndGems,
                index: 70,
                clasiModel: "Jewelry and Watches",
                clasiModelchild: "Loose Diamonds & Gems");
          if (choice2 == 71)
            return ClassifiedModels(
                choice: true,
                clasiList: mensJewelry,
                index: 71,
                clasiModel: "Jewelry and Watches",
                clasiModelchild: "Men's Jewelry");
          /* if (choice2 == 72)
            return ClassifiedModels(
                choice: true,
                //clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 72,
                clasiModel: "Jewelry and Watches",
                clasiModelchild: "Other14");*/
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 73)
            return ClassifiedModels(
                choice: true,
                clasiList: petAccessories,
                index: 73,
                clasiModel: "Pets",
                clasiModelchild: "Pet Accessories");
          /* if (choice2 == 74)
            return ClassifiedModels(
                choice: true,
                // clasiList: lostAndFoundPets,
                index: 74,
                clasiModel: "Pets",
                clasiModelchild: "Lost & Found Pets");*/
          if (choice2 == 75)
            return ClassifiedModels(
                choice: true,
                clasiList: petsforFreeAdoption,
                index: 75,
                clasiModel: "Pets",
                clasiModelchild: "Pets for Free Adoption");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 76)
            return ClassifiedModels(
                choice: true,
                clasiList: guitars,
                index: 76,
                clasiModel: "Musical Instruments",
                clasiModelchild: "Guitars");
          if (choice2 == 77)
            return ClassifiedModels(
                choice: true,
                clasiList: percussion,
                index: 77,
                clasiModel: "Musical Instruments",
                clasiModelchild: "Percussion");
          if (choice2 == 78)
            return ClassifiedModels(
                choice: true,
                clasiList: stringInstruments,
                index: 78,
                clasiModel: "Musical Instruments",
                clasiModelchild: "String Instruments");
          if (choice2 == 79)
            return ClassifiedModels(
                choice: true,
                clasiList: windInstruments,
                index: 79,
                clasiModel: "Musical Instruments",
                clasiModelchild: "Wind Instruments");
          /* if (choice2 == 80)
            return ClassifiedModels(
                choice: true,
                //  clasiList: djandRecordingEquipment,
                index: 80,
                clasiModel: "Musical Instruments",
                clasiModelchild: "DJ & Recording Equipment");*/
          if (choice2 == 81)
            return ClassifiedModels(
                choice: true,
                clasiList: pianosKeyboardsAndOrgans,
                index: 81,
                clasiModel: "Musical Instruments",
                clasiModelchild: "Pianos, Keyboards & Organs");
          /* if (choice2 == 82)
            return ClassifiedModels(
                choice: true,
                //   clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 82,
                clasiModel: "Musical Instruments",
                clasiModelchild: "Other17");*/
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 83)
            return ClassifiedModels(
                choice: true,
                clasiList: gamingSystems,
                index: 83,
                clasiModel: "Gaming",
                clasiModelchild: "Gaming Systems");
          if (choice2 == 84)
            return ClassifiedModels(
                choice: true,
                clasiList: videoGames,
                index: 84,
                clasiModel: "Gaming",
                clasiModelchild: "Video Games");
          if (choice2 == 85)
            return ClassifiedModels(
                choice: true,
                clasiList: gamingAccessories,
                index: 85,
                clasiModel: "Gaming",
                clasiModelchild: "Gaming Accessories");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 86)
            return ClassifiedModels(
                choice: true,
                clasiList: strollersAndCarSeats,
                index: 86,
                clasiModel: "Baby Items",
                clasiModelchild: "Strollers & Car Seats");
          if (choice2 == 87)
            return ClassifiedModels(
                choice: true,
                clasiList: babyGear,
                index: 87,
                clasiModel: "Baby Items",
                clasiModelchild: "Baby Gear");
          if (choice2 == 88)
            return ClassifiedModels(
                choice: true,
                clasiList: babyToys,
                index: 88,
                clasiModel: "Baby Items",
                clasiModelchild: "Baby Toys");
          if (choice2 == 89)
            return ClassifiedModels(
                choice: true,
                clasiList: feeding,
                index: 89,
                clasiModel: "Baby Items",
                clasiModelchild: "Feeding");
          if (choice2 == 90)
            return ClassifiedModels(
                choice: true,
                clasiList: safetyAndHealth,
                index: 90,
                clasiModel: "Baby Items",
                clasiModelchild: "Safety & Health");
          if (choice2 == 91)
            return ClassifiedModels(
                choice: true,
                clasiList: bathAndDiapers,
                index: 91,
                clasiModel: "Baby Items",
                clasiModelchild: "Bath & Diapers");
          if (choice2 == 92)
            return ClassifiedModels(
                choice: true,
                clasiList: nurseryFurnitureAndAccessories,
                index: 92,
                clasiModel: "Baby Items",
                clasiModelchild: "Nursery Furniture & Accessories");
          //////////////////////////////////////////////////////////////////////*/*/*/*/*/*
          /*  if (choice2 == 93)
            return ClassifiedModels(
                choice: true,
                // clasiList: electronicAndRemoteControlToys,
                index: 93,
                clasiModel: "Toys",
                clasiModelchild: "Electronic & Remote Control Toys");
          if (choice2 == 94)
            return ClassifiedModels(
                choice: true,
                //   clasiList: actionFiguresAndToyVehicles,
                index: 94,
                clasiModel: "Toys",
                clasiModelchild: "Action Figures & Toy Vehicles");
          if (choice2 == 95)
            return ClassifiedModels(
                choice: true,
                //   clasiList: outdoorToysAndStructures,
                index: 95,
                clasiModel: "Toys",
                clasiModelchild: "Outdoor Toys & Structures");
          if (choice2 == 96)
            return ClassifiedModels(
                choice: true,
                //  clasiList: hobbies,
                index: 96,
                clasiModel: "Toys",
                clasiModelchild: "Hobbies");
          if (choice2 == 97)
            return ClassifiedModels(
                choice: true,
                //  clasiList: pretendPlayAndPreschoolToys,
                index: 97,
                clasiModel: "Toys",
                clasiModelchild: "Pretend Play & Preschool Toys");
          if (choice2 == 98)
            return ClassifiedModels(
                choice: true,
                // clasiList: educationalToys,
                index: 98,
                clasiModel: "Toys",
                clasiModelchild: "Educational Toys");
          if (choice2 == 99)
            return ClassifiedModels(
                choice: true,
                //  clasiList: dollsAndStuffedAnimals,
                index: 99,
                clasiModel: "Toys",
                clasiModelchild: "Dolls & Stuffed Animals");
          if (choice2 == 100)
            return ClassifiedModels(
                choice: true,
                //  clasiList: gamesAndPuzzles,
                index: 100,
                clasiModel: "Toys",
                clasiModelchild: "Games & Puzzles");
          if (choice2 == 101)
            return ClassifiedModels(
                choice: true,
                // clasiList: classicAndVintageToys,
                index: 101,
                clasiModel: "Toys",
                clasiModelchild: "Classic & Vintage Toys");
          if (choice2 == 102)
            return ClassifiedModels(
                choice: true,
                //  clasiList: buildingToys,
                index: 102,
                clasiModel: "Toys",
                clasiModelchild: "Building Toys");
          if (choice2 == 103)
            return ClassifiedModels(
                choice: true,
                // clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 103,
                clasiModel: "Toys",
                clasiModelchild: "Other29");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 104)
            return ClassifiedModels(
                choice: true,
                //   clasiList: activitiesAndAttractions,
                index: 104,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Activities & Attractions");
          if (choice2 == 105)
            return ClassifiedModels(
                choice: true,
                //   clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 105,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Concerts");
          if (choice2 == 106)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 106,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Sporting Events");
          if (choice2 == 107)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 107,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Travel");
          if (choice2 == 108)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 108,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Events");
          if (choice2 == 109)
            return ClassifiedModels(
                choice: true,
                // clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 109,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Movies");
          if (choice2 == 110)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 110,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Vouchers & Gift Cards");
          if (choice2 == 111)
            return ClassifiedModels(
                choice: true,
                //  clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 111,
                clasiModel: "Tickets And Vouchers",
                clasiModelchild: "Other30");*/
          ////////////////////////////////////////////////////////*//*/*/*/*/*/*/////////////
          if (choice2 == 112)
            return ClassifiedModels(
                choice: true,
                clasiList: antiques,
                index: 112,
                clasiModel: "Collectibles",
                clasiModelchild: "Antiques");
          if (choice2 == 113)
            return ClassifiedModels(
                choice: true,
                clasiList: art,
                index: 113,
                clasiModel: "Collectibles",
                clasiModelchild: "Art");
          if (choice2 == 114)
            return ClassifiedModels(
                choice: true,
                clasiList: decorations,
                index: 114,
                clasiModel: "Collectibles",
                clasiModelchild: "Decorations");
          if (choice2 == 115)
            return ClassifiedModels(
                choice: true,
                clasiList: memorabilia,
                index: 115,
                clasiModel: "Collectibles",
                clasiModelchild: "Memorabilia");
          if (choice2 == 116)
            return ClassifiedModels(
                choice: true,
                clasiList: rocksFossilsArtifacts,
                index: 117,
                clasiModel: "Collectibles",
                clasiModelchild: "Rocks/Fossils/Artifacts");
          if (choice2 == 118)
            return ClassifiedModels(
                choice: true,
                clasiList: pensAndWritingInstruments,
                index: 119,
                clasiModel: "Collectibles",
                clasiModelchild: "Pens & Writing Instruments");
          /* if (choice2 == 120)
            return ClassifiedModels(
                choice: true,
                //clasiList: monitorsAndPrintersAndOtherPeripherals,
                index: 120,
                clasiModel: "Collectibles",
                clasiModelchild: "Other31");*/
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 121)
            return ClassifiedModels(
                choice: true,
                clasiList: textbooks,
                index: 121,
                clasiModel: "Books",
                clasiModelchild: "Textbooks");
          if (choice2 == 122)
            return ClassifiedModels(
                choice: true,
                clasiList: nonfiction,
                index: 122,
                clasiModel: "Books",
                clasiModelchild: "Nonfiction");
          if (choice2 == 123)
            return ClassifiedModels(
                choice: true,
                clasiList: fiction,
                index: 123,
                clasiModel: "Books",
                clasiModelchild: "Fiction");
          if (choice2 == 124)
            return ClassifiedModels(
                choice: true,
                clasiList: childrensBooks,
                index: 124,
                clasiModel: "Books",
                clasiModelchild: "Children's Books");
          if (choice2 == 125)
            return ClassifiedModels(
                choice: true,
                clasiList: bookAccessories,
                index: 125,
                clasiModel: "Books",
                clasiModelchild: "Book Accessories");
          /* if (choice2 == 126)
            return ClassifiedModels(
                choice: true,
                //  clasiList: digitalbooks,
                index: 126,
                clasiModel: "Books",
                clasiModelchild: "Digital/E-books");
          if (choice2 == 127)
            return ClassifiedModels(
                choice: true,
                // clasiList: audiobooks,
                index: 127,
                clasiModel: "Books",
                clasiModelchild: "Audiobooks");
          /////////////////////////////////////////////////////////////////////
          if (choice2 == 128)
            return ClassifiedModels(
                choice: true,
                //    clasiList: vinyl,
                index: 128,
                clasiModel: "Music",
                clasiModelchild: "Vinyl");*/
          if (choice2 == 129)
            return ClassifiedModels(
                choice: true,
                clasiList: cDs,
                index: 129,
                clasiModel: "Music",
                clasiModelchild: "CDs");
          if (choice2 == 130)
            return ClassifiedModels(
                choice: true,
                clasiList: digital,
                index: 130,
                clasiModel: "Music",
                clasiModelchild: "Digital2");
          if (choice2 == 131)
            return ClassifiedModels(
                choice: true,
                clasiList: casettes,
                index: 131,
                clasiModel: "Music",
                clasiModelchild: "Casettes");
          //////////////////////////Free Stuff////////////////////////////////////
          ///كلن دغري عالليستة

          /* if (choice2 == 127)
            return ClassifiedModels(
                choice: true,
                clasiList: furnitureHomeAndGarden ,
                index: 127,
                clasiModel: "Free Stuff",
                clasiModelchild: "Furniture, Home & Garden" );*/
          //////////////////////////Lost /Found////////////////////////////////////
          ///كلن دغري عالليستة
          /*if (choice2 == 128)
            return ClassifiedModels(
                choice: true,
                clasiList: ,
                index: 128,
                clasiModel: "Lost /Found",
                clasiModelchild: "Lost"); */
          //////////////////////////dvdsAndMovies ////////////////////////////////////
          if (choice2 == 132)
            return ClassifiedModels(
                choice: true,
                clasiList: dvd,
                index: 132,
                clasiModel: "DVDs & Movies",
                clasiModelchild: "DVD");
          if (choice2 == 133)
            return ClassifiedModels(
                choice: true,
                clasiList: digitalDVD,
                index: 133,
                clasiModel: "DVDs & Movies",
                clasiModelchild: "Digital3");
          if (choice2 == 134)
            return ClassifiedModels(
                choice: true,
                clasiList: vhs,
                index: 134,
                clasiModel: "DVDs & Movies",
                clasiModelchild: "VHS");
          /* if (choice2 == 135)
            return ClassifiedModels(
                choice: true,
              //  clasiList: digitalDVD,
                index: 135,
                clasiModel: "DVDs & Movies",
                clasiModelchild: "Other Formats");*/
          return Container();
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        /*  title: Text(
          'Auto Accessories',
          style: TextStyle(color: Colors.black),
        ),*/
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            if (choice == false)
              Text("${translator.translate("Now_choose_the_right")}",
                  style: new TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            if (choice == false)
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            if (choice == false)
              Text("${translator.translate("category_for_your_ad")}",
                  style: new TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            if (choice == true)
              Text("${translator.translate("choose_the_category2")}",
                  style: new TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              children: [
                SizedBox(width: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "... > ${translator.translate('Classifieds')}>${translator.translate('$clasiModel')}",
                      style: new TextStyle(
                          fontSize: treeFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                ),
              ],
            ),
            SizedBox(height: rotate2),
            Divider(
              height: 0,
              thickness: 1.2,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: clasiList.length,
                itemBuilder: (BuildContext context, int index2) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  onTap: () {
                    ////////////////////////Electronics/////////////////////////////

                    if (index == 0 && index2 == 0) gotoScreen(0);
                    if (index == 0 && index2 == 1) gotoScreen(1);
                    if (index == 0 && index2 == 2) gotoScreen(2);
                    if (index == 0 && index2 == 3) gotoScreen(3);
                    if (index == 0 && index2 == 4) gotoScreen(4);
                    if (index == 0 && index2 == 5) gotoScreen(5);
                    if (index == 0 && index2 == 6) gotoScreen(6);
                    if (index == 0 && index2 == 7) gotoScreen(7);
                    if (index == 0 && index2 == 8) gotoScreen(8);
                    if (index == 0 && index2 == 9) gotoScreen(9);
                    if (index == 0 && index2 == 10) gotoScreen(10);
                    ///////////////////////Computers And Networking//////////////////////////////
                    if (index == 1 && index2 == 0) gotoScreen(11);
                    if (index == 1 && index2 == 1) gotoScreen(12);
                    if (index == 1 && index2 == 2) gotoScreen(13);
                    if (index == 1 && index2 == 3) gotoScreen(14);
                    if (index == 1 && index2 == 4) gotoScreen(15);
                    if (index == 1 && index2 == 5) gotoScreen(16);
                    ////////////////////////Business & Industrial/////////////////////////////
                    if (index == 2 && index2 == 0) gotoScreen(17);
                    if (index == 2 && index2 == 1) gotoScreen(18);
                    if (index == 2 && index2 == 2) gotoScreen(19);
                    if (index == 2 && index2 == 3) gotoScreen(20);
                    if (index == 2 && index2 == 4) gotoScreen(21);
                    if (index == 2 && index2 == 5) gotoScreen(22);
                    if (index == 2 && index2 == 6) gotoScreen(23);
                    if (index == 2 && index2 == 7) gotoScreen(24);
                    if (index == 2 && index2 == 8) gotoScreen(25);
                    if (index == 2 && index2 == 9) gotoScreen(26);
                    if (index == 2 && index2 == 10) gotoScreen(27);
                    if (index == 2 && index2 == 11) gotoScreen(28);
                    if (index == 2 && index2 == 12) gotoScreen(29);
                    //////////////////////Home Appliances///////////////////////////////
                    if (index == 3 && index2 == 0) gotoScreen(30);
                    if (index == 3 && index2 == 1) gotoScreen(31);
                    if (index == 3 && index2 == 2) gotoScreen(32);
                    if (index == 3 && index2 == 3) gotoScreen(33);
                    if (index == 3 && index2 == 4) gotoScreen(34);
                    if (index == 3 && index2 == 5) gotoScreen(35);
                    if (index == 3 && index2 == 6) gotoScreen(36);
                    //////////////////////sportEquipment ///////////////////////////////
                    if (index == 4 && index2 == 0) gotoScreen(37);
                    if (index == 4 && index2 == 1) gotoScreen(38);
                    if (index == 4 && index2 == 2) gotoScreen(39);
                    if (index == 4 && index2 == 3) gotoScreen(40);
                    if (index == 4 && index2 == 4) gotoScreen(41);
                    if (index == 4 && index2 == 5) gotoScreen(42);
                    if (index == 4 && index2 == 6) gotoScreen(43);
                    if (index == 4 && index2 == 7) gotoScreen(44);
                    if (index == 4 && index2 == 8) gotoScreen(45);
                    if (index == 4 && index2 == 9) gotoScreen(46);
                    //////////////////////Clothing & Accessories ///////////////////////////////
                    if (index == 5 && index2 == 0) gotoScreen(47);
                    if (index == 5 && index2 == 1) gotoScreen(48);
                    if (index == 5 && index2 == 2) gotoScreen(49);
                    if (index == 5 && index2 == 3) gotoScreen(50);
                    if (index == 5 && index2 == 4) gotoScreen(51);
                    if (index == 5 && index2 == 5) gotoScreen(52);
                    if (index == 5 && index2 == 6) gotoScreen(53);
                    if (index == 5 && index2 == 7) gotoScreen(54);
                    if (index == 5 && index2 == 8) gotoScreen(55);
                    if (index == 5 && index2 == 9) gotoScreen(56);
                    if (index == 5 && index2 == 10) gotoScreen(57);
                    //////////////////////camerasAndImaging////////////////////
                    if (index == 6 && index2 == 0) gotoScreen(58);
                    if (index == 6 && index2 == 1) gotoScreen(59);
                    if (index == 6 && index2 == 2) gotoScreen(60);
                    if (index == 6 && index2 == 3) gotoScreen(61);
                    if (index == 6 && index2 == 4) gotoScreen(62);
                    if (index == 6 && index2 == 5) gotoScreen(63);
                    if (index == 6 && index2 == 6) gotoScreen(64);
                    if (index == 6 && index2 == 7) gotoScreen(65);
                    if (index == 6 && index2 == 8) gotoScreen(66);
                    if (index == 6 && index2 == 9) gotoScreen(67);
                    //////////////////////jewelry and Watches/////////////////
                    if (index == 7 && index2 == 0) gotoScreen(68);
                    if (index == 7 && index2 == 1) gotoScreen(69);
                    if (index == 7 && index2 == 2) gotoScreen(70);
                    if (index == 7 && index2 == 3) gotoScreen(71);
                    if (index == 7 && index2 == 4) gotoScreen(72);
                    //////////////////////pets///////////////////////////////
                    if (index == 8 && index2 == 0) gotoScreen(73);
                    if (index == 8 && index2 == 1) gotoScreen(74);
                    if (index == 8 && index2 == 2) gotoScreen(75);
                    //////////////////////musicalInstruments//////////////////
                    if (index == 9 && index2 == 0) gotoScreen(76);
                    if (index == 9 && index2 == 1) gotoScreen(77);
                    if (index == 9 && index2 == 2) gotoScreen(78);
                    if (index == 9 && index2 == 3) gotoScreen(79);
                    if (index == 9 && index2 == 4) gotoScreen(80);
                    if (index == 9 && index2 == 5) gotoScreen(81);
                    if (index == 9 && index2 == 6) gotoScreen(82);
                    //////////////////////Gaming/////////////////////////////
                    if (index == 10 && index2 == 0) gotoScreen(83);
                    if (index == 10 && index2 == 1) gotoScreen(84);
                    if (index == 10 && index2 == 2) gotoScreen(85);
                    //////////////////////babyItems /////////////////////////////
                    if (index == 11 && index2 == 0) gotoScreen(86);
                    if (index == 11 && index2 == 1) gotoScreen(87);
                    if (index == 11 && index2 == 2) gotoScreen(88);
                    if (index == 11 && index2 == 3) gotoScreen(89);
                    if (index == 11 && index2 == 4) gotoScreen(90);
                    if (index == 11 && index2 == 5) gotoScreen(91);
                    if (index == 11 && index2 == 6) gotoScreen(92);
                    //////////////////////toys /////////////////////////////
                    if (index == 12 && index2 == 0) gotoScreen(93);
                    if (index == 12 && index2 == 1) gotoScreen(94);
                    if (index == 12 && index2 == 2) gotoScreen(95);
                    if (index == 12 && index2 == 3) gotoScreen(96);
                    if (index == 12 && index2 == 4) gotoScreen(97);
                    if (index == 12 && index2 == 5) gotoScreen(98);
                    if (index == 12 && index2 == 6) gotoScreen(99);
                    if (index == 12 && index2 == 7) gotoScreen(100);
                    if (index == 12 && index2 == 8) gotoScreen(101);
                    if (index == 12 && index2 == 9) gotoScreen(102);
                    if (index == 12 && index2 == 10) gotoScreen(103);
                    //////////////////////Tickets And Vouchers/////////////////////////////
                    if (index == 13 && index2 == 0) gotoScreen(104);
                    if (index == 13 && index2 == 1) gotoScreen(105);
                    if (index == 13 && index2 == 2) gotoScreen(106);
                    if (index == 13 && index2 == 3) gotoScreen(107);
                    if (index == 13 && index2 == 4) gotoScreen(108);
                    if (index == 13 && index2 == 5) gotoScreen(109);
                    if (index == 13 && index2 == 6) gotoScreen(110);
                    if (index == 13 && index2 == 7) gotoScreen(111);
                    //////////////////////Collectibles/////////////////////////////
                    if (index == 14 && index2 == 0) gotoScreen(112);
                    if (index == 14 && index2 == 1) gotoScreen(113);
                    if (index == 14 && index2 == 2) gotoScreen(114);
                    if (index == 14 && index2 == 3) gotoScreen(115);
                    if (index == 14 && index2 == 4) gotoScreen(116);
                    if (index == 14 && index2 == 5) gotoScreen(117);
                    if (index == 14 && index2 == 6) gotoScreen(118);
                    if (index == 14 && index2 == 7) gotoScreen(119);
                    if (index == 14 && index2 == 8) gotoScreen(120);
                    //////////////////////Books/////////////////////////////
                    if (index == 15 && index2 == 0) gotoScreen(121);
                    if (index == 15 && index2 == 1) gotoScreen(122);
                    if (index == 15 && index2 == 2) gotoScreen(123);
                    if (index == 15 && index2 == 3) gotoScreen(124);
                    if (index == 15 && index2 == 4) gotoScreen(125);
                    if (index == 15 && index2 == 5) gotoScreen(126);
                    if (index == 15 && index2 == 6) gotoScreen(127);
                    if (index == 15 && index2 == 7) gotoScreen(128);
                    //////////////////////Music/////////////////////////////
                    if (index == 16 && index2 == 0) gotoScreen(129);
                    if (index == 16 && index2 == 1) gotoScreen(130);
                    if (index == 16 && index2 == 2) gotoScreen(131);
                    //////////////////////dvdsAndMovies/////////////////////////////
                    if (index == 17 && index2 == 0) gotoScreen(132);
                    if (index == 17 && index2 == 1) gotoScreen(133);
                    if (index == 17 && index2 == 2) gotoScreen(134);
                  },
                  title: Text(clasiList[index2],
                      style: TextStyle(fontSize: fontSize)),
                ),
                separatorBuilder: (context, index) {
                  return Divider(height: 5);
                },
              ),
            )
          ]),
    );
  }
}

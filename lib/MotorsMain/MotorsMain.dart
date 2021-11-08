import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/Pages/Auto_Accessories.dart';
import 'package:oxydu/Pages/Heavy_Vehicles.dart';
import 'package:oxydu/Pages/Motorcycles.dart';
import 'package:oxydu/PlaceYouAdd/Motors/CarsForRent.dart';
import 'package:sizer/sizer.dart';
import '../Boats.dart';
import 'CarsModels.dart';

double rotate = 0, rotate2 = 0, leadingSize = 0;

class MotorsMain extends StatefulWidget {
  // final String message;
  // final String choice;
//   MotorCycle({@required this.message});
  @override
  _MotorsMainState createState() => _MotorsMainState();
}

class _MotorsMainState extends State<MotorsMain> {
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  List motor;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }

    motor = [
      translator.translate('All'),
      translator.translate('Motorcycles'),
      translator.translate('Auto Accessories'),
      translator.translate('Heavy Vehicles'),
      translator.translate('Boats'),
     // translator.translate('Boats'),
    //  translator.translate('Cars for rent'),
      // translator.translate('NumberPlates'),
    ];

    gotoScreen(int choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return UsedCarsMenu();
          if (choice == 1) return MotorCycleMain();
          if (choice == 2) return AutoAccessories(); 
          if (choice == 3) return HeavyVehiclesMain();
          if (choice == 4)
            return BoatsMain(); 

           /* if (choice == 4)
            return CarsForRentGet() ; */  
            
          else
            return Container();
          // if (choice == 5)
          //   return NumberPlates( );
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: motor.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                    if (index == 6) gotoScreen(6);
                  },
                  title: Text(motor[index], style: TextStyle(fontSize: 5.w)),
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

class UsedCarsMenu extends StatelessWidget {
  static var carsModels,
      cmc,
      acura,
      alfaRomeo,
      astonMartin,
      audi,
      bmw,
      bentley,
      borgward,
      brilliance,
      bugatti,
      cadillac,
      changan,
      chevrolet,
      chrysler,
      citroen,
      daihatsu,
      dodge,
      ferrari,
      fiat,
      fisker,
      ford,
      foton,
      gac,
      gmc,
      geely,
      genesis,
      grandTiger,
      greatWall,
      haval,
      honda,
      hongqi,
      hummer,
      hyundai,
      infiniti,
      isuzu,
      jAC,
      jaguar,
      jeep,
      jetour,
      kia,
      kingLong,
      lamborghini,
      lancia,
      landRover,
      lexus,
      lincoln,
      lotus,
      mg,
      mINI,
      mahindra,
      maserati,
      maybach,
      mazda,
      mcLaren,
      mercedesBenz,
      mercury,
      mitsubishi,
      morgan,
      nissan,
      opel,
      othermake,
      oullim,
      peugeot,
      pontiac,
      porsche,
      proton,
      renault,
      rollsRoyce,
      rover,
      seat,
      skoda,
      smart,
      soueast,
      ssangYong,
      subaru,
      suzuki,
      tata,
      tesla,
      toyota,
      uaz,
      volkswagen,
      volvo,
      wMotors;

  @override
  Widget build(BuildContext context) {
    carsModels = [
      translator.translate('Alfa Romeo'),
      translator.translate('Aston Martin'),
      translator.translate('Audi'),
      translator.translate('BMW'),
      translator.translate('Bentley'),
      translator.translate('Borgward'),
      translator.translate('Brilliance‬'),
      translator.translate('Bugatti‬'),
      translator.translate('CMC'),
      translator.translate('Cadillac'),
      translator.translate('Changan'),
      translator.translate('Chevrolet'),
      translator.translate('Chrysler'),
      translator.translate('Citroen'),
      translator.translate('Daihatsu'),
      translator.translate('Dodge'),
      translator.translate('Ferrari'),
      translator.translate('Fiat'),
      translator.translate('Ford'),
      translator.translate('Foton'),
      translator.translate('GAC'),
      translator.translate('GMC'),
      translator.translate('Geely'),
      translator.translate('Genesis'),
      // translator.translate('Grand Tiger'),
      // translator.translate('Great Wall'),
      translator.translate('Haval'),
      translator.translate('Honda'),
      //translator.translate('Hongqi'),
      translator.translate('Hummer'),
      translator.translate('Hyundai'),
      translator.translate('Infiniti'),
      translator.translate('Isuzu'),
      translator.translate('JAC'),
      translator.translate('Jaguar'),
      translator.translate('Jeep'),
      translator.translate('Jetour'),
      translator.translate('Kia'),
      // translator.translate('King Long'),
      translator.translate('Lamborghini'),
      translator.translate('Lancia'),
      translator.translate('Land Rover'),
      translator.translate('Lexus'),
      translator.translate('Lincoln'),
      translator.translate('Lotus'),
      translator.translate('MG'),
      translator.translate('MINI'),
      translator.translate('Mahindra'),
      translator.translate('Maserati'),
      translator.translate('Maybach'),
      translator.translate('Mazda'),
      translator.translate('McLaren'),
      translator.translate('Mercedes-Benz'),
      translator.translate('Mercury'),
      translator.translate('Mitsubishi'),
      translator.translate('Morgan'),
      translator.translate('Nissan'),
      translator.translate('Opel'),
      translator.translate('Other Make'),
      translator.translate('Oullim'),
      translator.translate('Peugeot'),
      translator.translate('Pontiac'),
      translator.translate('Porsche'),
      translator.translate('Proton'),
      translator.translate('Renault'),
      translator.translate('Rolls Royce'),
      translator.translate('Rover'),
      translator.translate('Seat'),
      translator.translate('Skoda'),
      translator.translate('Smart'),
      translator.translate('Soueast'),
      translator.translate('Ssang Yong'),
      translator.translate('Subaru'),
      translator.translate('Suzuki'),
      translator.translate('TATA'),
      translator.translate('Tesla'),
      translator.translate('Toyota'),
      //  translator.translate('UAZ'),
      translator.translate('Volkswagen'),
      translator.translate('Volvo'),
      //  translator.translate('W Motors'),
    ];

    cmc = [
      translator.translate("CMC Veryca "),
    ];

    borgward = [
      translator.translate("Borgward BX5"),
      translator.translate("Borgward BX7"),
    ];

    brilliance = [
      translator.translate("Brilliance V5"),
    ];
    bugatti = [
      translator.translate("Bugatti Chiron"),
      translator.translate("Bugatti Grand Sport"),
      translator.translate("Bugatti Veyron"),
      translator.translate("Bugatti Veyron 16.4"),
    ];

    daihatsu = [
      translator.translate("Daihatsu Sirion"),
      translator.translate("Daihatsu Terios"),
      translator.translate("Daihatsu Gran Max"),
    ];
    /* fisker = [
      translator.translate("Fisker Karma"),
    ];*/
    foton = [
      translator.translate("Foton Other"),
      translator.translate("Foton TUNLAND"),
    ];
    gac = [
      translator.translate("GAC GA8"),
      translator.translate("GAC GS8"),
    ];
    genesis = [
      translator.translate("Genesis G70"),
      translator.translate("Genesis G80"),
      translator.translate("Genesis G90"),
      translator.translate("Genesis Coupe")
    ];
    grandTiger = [
      translator.translate("Grand Tiger Grandtiger Pickup"),
    ];
    greatWall = [
      translator.translate("Great Wall Wingle 5"),
      translator.translate("Great Wall Wingle 6"),
    ];
    haval = [
      translator.translate("Haval H8"),
      translator.translate("Haval H9"),
    ];
    isuzu = [
      translator.translate("Isuzu Other"),
      translator.translate("Isuzu Trooper"),
    ];
    jetour = [
      translator.translate("Jetour X70"),
      translator.translate("Jetour X90"),
    ];
    kingLong = [
      translator.translate("King Long China Mini Van‬"),
    ];
    lancia = [
      translator.translate("Lancia Delta"),
    ];
    lotus = [
      translator.translate("Lotus Evora"),
      translator.translate("Lotus Exige"),
    ];
    mg = [
      translator.translate("MG 360"),
      translator.translate("MG GS"),
      translator.translate("MG HS"),
      translator.translate("MG MG6"),
      translator.translate("MG MGB"),
      translator.translate("MG RX5"),
      translator.translate("MG RX8"),
      translator.translate("MG ZS"),
      translator.translate("MG MG5"),
    ];
    mahindra = [
      translator.translate("Mahindra XUV 500"),
    ];
    maybach = [
      translator.translate("Maybach 57"),
      translator.translate("Maybach 62"),
      translator.translate("Maybach s500"),
      translator.translate("Maybach Other"),
    ];
    morgan = [
      translator.translate("Morgan 3 Wheeler"),
      translator.translate("Morgan Aero Supersport"),
    ];
    oullim = [
      translator.translate("Oullim SPIRRA"),
    ];
    pontiac = [
      translator.translate("Pontiac Other"),
    ];
    proton = [
      translator.translate("Proton Other"),
    ];
    rover = [
      translator.translate("Rover Other"),
    ];
    seat = [
      translator.translate("Seat Leon"),
    ];
    smart = [
      translator.translate("Smart Other"),
    ];
    soueast = [
      translator.translate("Soueast DX7"),
    ];
    ssangYong = [
      translator.translate("Ssang Yong Other"),
    ];
    uaz = [
      translator.translate("UAZ Hunter"),
    ];
    wMotors = [
      translator.translate("W Motors Fenyr Hypersport"),
    ];
    lamborghini = [
      translator.translate("Lamborghini Aventador"),
      translator.translate("Lamborghini Gallardo"),
      translator.translate("Lamborghini Huracan"),
      translator.translate("Lamborghini Urus"),
      translator.translate("Lamborghini Murcielago"),
    ];

    othermake = [
      translator.translate("Other Make Other 4x4 "),
      translator.translate("Other Make Other Car "),
      translator.translate("Other Make Other Utility"),
      translator.translate("Other Make Heavy Vehicles"),
    ];

    volvo = [
      translator.translate("Volvo V-Class"),
      translator.translate("Volvo XC40"),
      translator.translate("Volvo XC60"),
      translator.translate("Volvo XC90"),
      translator.translate("Volvo Other"),
      translator.translate("Volvo S-Class"),
    ];

    volkswagen = [
      translator.translate("Volkswagen Arteon"),
      translator.translate("Volkswagen Beetle"),
      translator.translate("Volkswagen Bora"),
      translator.translate("Volkswagen CC"),
      translator.translate("Volkswagen Caddy"),
      translator.translate("Volkswagen Crafter"),
      translator.translate("Volkswagen Eos"),
      translator.translate("Volkswagen GTI"),
      translator.translate("Volkswagen Golf"),
      translator.translate("Volkswagen Golf R"),
      translator.translate("Volkswagen Jetta"),
      translator.translate("Volkswagen Multivan"),
      translator.translate("Volkswagen Passat"),
      translator.translate("Volkswagen Polo"),
      translator.translate("Volkswagen Scirocco"),
      translator.translate("Volkswagen Teramont"),
      translator.translate("Volkswagen Tiguan"),
      translator.translate("Volkswagen Touareg"),
      translator.translate("Volkswagen Other"),
      translator.translate("Volkswagen Transporter"),
    ];

    peugeot = [
      translator.translate("Peugeot 2008"),
      translator.translate("Peugeot 206cc"),
      translator.translate("Peugeot 207"),
      translator.translate("Peugeot 208"),
      translator.translate("Peugeot 3008"),
      translator.translate("Peugeot 301"),
      translator.translate("Peugeot 308"),
      translator.translate("Peugeot 308 GT LINE"),
      translator.translate("Peugeot 5008"),
      translator.translate("Peugeot 508"),
      translator.translate("Peugeot Boxer"),
      translator.translate("Peugeot Expert"),
      translator.translate("Peugeot Partner"),
      translator.translate("Peugeot RCZ"),
      translator.translate("Peugeot Other"),
      translator.translate("Peugeot 208 GT LINE"),
    ];

    toyota = [
      translator.translate("Toyota 4Runner"),
      translator.translate("Toyota 86"),
      translator.translate("Toyota Alphard"),
      translator.translate("Toyota Avalon"),
      translator.translate("Toyota Avanza"),
      translator.translate("Toyota C-HR"),
      translator.translate("Toyota Camry"),
      translator.translate("Toyota Corolla"),
      translator.translate("Toyota Cressida"),
      translator.translate("Toyota FJ Cruiser"),
      translator.translate("Toyota Fortuner"),
      translator.translate("Toyota Hiace"),
      translator.translate("Toyota Highlander"),
      translator.translate("Toyota Hilux"),
      translator.translate("Toyota IQ"),
      translator.translate("Toyota Innova"),
      translator.translate("Toyota Land Cruiser"),
      translator.translate("Toyota MR2"),
      translator.translate("Toyota Pickup"),
      translator.translate("Toyota Prado"),
      translator.translate("Toyota Previa"),
      translator.translate("Toyota Prius"),
      translator.translate("Toyota Rav 4"),
      translator.translate("Toyota Rush"),
      translator.translate("Toyota Sequoia"),
      translator.translate("Toyota Sienna"),
      translator.translate("Toyota Supra"),
      translator.translate("Toyota Tacoma"),
      translator.translate("Toyota Tundra"),
      translator.translate("Toyota Yaris"),
      translator.translate("Toyota Zelas"),
      translator.translate("Toyota Other"),
      translator.translate("Toyota Land Cruiser 76 series"),
    ];

    tesla = [
      translator.translate("Tesla Model 3"),
      translator.translate("Tesla Model S"),
      translator.translate("Tesla Model X"),
    ];

    tata = [
      translator.translate("TATA Other"),
      translator.translate("TATA Pickup")
    ];

    suzuki = [
      translator.translate("Suzuki Baleno"),
      translator.translate("Suzuki Celerio"),
      translator.translate("Suzuki Ciaz"),
      translator.translate("Suzuki Dzire"),
      translator.translate("Suzuki Ertiga"),
      translator.translate("Suzuki Jimny"),
      translator.translate("Suzuki Kizashi"),
      translator.translate("Suzuki Swift"),
      // translator.translate("Suzuki Vitara"),
      translator.translate("Suzuki XL7"),
      translator.translate("Suzuki Other"),
      translator.translate("Suzuki Grand Vitara"),
    ];

    subaru = [
      translator.translate("Subaru BRZ"),
      translator.translate("Subaru Legacy"),
      translator.translate("Subaru Outback"),
      translator.translate("Subaru WRX"),
      translator.translate("Subaru Forester"),
      translator.translate("Subaru XV")
    ];

    skoda = [
      translator.translate("Skoda Kodiaq"),
      translator.translate("Skoda Rapid"),
      translator.translate("Skoda Octavia"),
    ];

    rollsRoyce = [
      translator.translate("Rolls Royce Cullinan"),
      translator.translate("Rolls Royce Dawn"),
      translator.translate("Rolls Royce Ghost"),
      translator.translate("Rolls Royce Phantom"),
      translator.translate("Rolls Royce Wraith"),
      translator.translate("Rolls Royce Other"),
      translator.translate("Rolls Royce Silver Spur"),
    ];

    renault = [
      translator.translate("Renault Captur"),
      translator.translate("Renault Clio"),
      translator.translate("Renault Dokker"),
      translator.translate("Renault Duster"),
      translator.translate("Renault Fluence"),
      translator.translate("Renault Koleos"),
      translator.translate("Renault Laguna"),
      translator.translate("Renault Logan"),
      translator.translate("Renault Megane"),
      translator.translate("Renault Safrane"),
      translator.translate("Renault Symbol"),
      translator.translate("Renault Trafic"),
      translator.translate("Renault Twizy"),
      translator.translate("Renault Other"),
      translator.translate("Renault Talisman"),
    ];

    porsche = [
      translator.translate("Porsche 918 Spyder"),
      translator.translate("Porsche 928"),
      translator.translate("Porsche Boxster"),
      translator.translate("Porsche Cayenne"),
      translator.translate("Porsche Cayman"),
      translator.translate("Porsche Macan"),
      translator.translate("Porsche Panamera"),
      translator.translate("Porsche Taycan"),
      translator.translate("Porsche Carrera / 911"),
    ];

    opel = [
      translator.translate("Opel Astra"),
      translator.translate("Opel Corsa"),
      translator.translate("Opel Grandland X"),
      translator.translate("Opel Insignia"),
      translator.translate("Opel Mokka"),
      translator.translate("Opel Zafira"),
      translator.translate("Opel Crossland X"),
    ];

    nissan = [
      translator.translate("Nissan 350Z"),
      translator.translate("Nissan 370z"),
      translator.translate("Nissan Altima"),
      translator.translate("Nissan Armada"),
      translator.translate("Nissan GT-R"),
      translator.translate("Nissan Juke"),
      translator.translate("Nissan Kicks"),
      translator.translate("Nissan Maxima"),
      translator.translate("Nissan Micra"),
      translator.translate("Nissan Murano"),
      translator.translate("Nissan Navara"),
      translator.translate("Nissan Pathfinder"),
      translator.translate("Nissan Patrol"),
      translator.translate("Nissan Pickup"),
      translator.translate("Nissan Qashqai"),
      translator.translate("Nissan Rogue"),
      translator.translate("Nissan Sentra"),
      translator.translate("Nissan Sunny"),
      translator.translate("Nissan Tiida"),
      translator.translate("Nissan Titan"),
      translator.translate("Nissan Van"),
      translator.translate("Nissan Versa"),
      translator.translate("Nissan X-Trail"),
      translator.translate("Nissan Xterra"),
      translator.translate("Nissan Other"),
      translator.translate("Nissan Patrol Pickup"),
    ];

    mitsubishi = [
      translator.translate("Mitsubishi ASX "),
      translator.translate("Mitsubishi Attrage"),
      translator.translate("Mitsubishi Canter"),
      translator.translate("Mitsubishi Eclipse "),
      translator.translate("Mitsubishi EclipseCross"),
      translator.translate("Mitsubishi Evolution"),
      translator.translate("Mitsubishi Galant"),
      translator.translate("Mitsubishi L200 "),
      translator.translate("Mitsubishi Lancer"),
      translator.translate("Mitsubishi Mirage"),
      translator.translate("Mitsubishi Montero"),
      translator.translate("Mitsubishi Nativa "),
      translator.translate("Mitsubishi Outlander"),
      translator.translate("Mitsubishi Pajero "),
      translator.translate("Mitsubishi Pajero Sport"),
      translator.translate("Mitsubishi Pickup "),
      translator.translate("Mitsubishi Van"),
      translator.translate("Mitsubishi Other "),
      translator.translate("Mitsubishi Montero Sport"),
    ];

    mINI = [
      translator.translate("MINI Clubman"),
      translator.translate("MINI Cooper"),
      translator.translate("MINI Coupe"),
      translator.translate("MINI Paceman"),
      translator.translate("MINI Countryman"),
    ];

    mercury = [
      translator.translate("Mercury Mariner‬"),
      translator.translate("Mercury Mountaineer"),
      translator.translate("Mercury Grand Marquis"),
    ];
    mercedesBenz = [
      translator.translate("Mercedes-Benz 190"),
      translator.translate("Mercedes-Benz 240/260/280"),
      translator.translate("Mercedes-Benz 300/350/380"),
      translator.translate("Mercedes-Benz 400/420"),
      translator.translate("Mercedes-Benz 450 SEL"),
      translator.translate("Mercedes-Benz 500/560"),
      translator.translate("Mercedes-Benz A-Class"),
      translator.translate("Mercedes-Benz A200"),
      translator.translate("Mercedes-Benz AMG"),
      translator.translate("Mercedes-Benz AMG GT 4 doors"),
      translator.translate("Mercedes-Benz B-Class"),
      translator.translate("Mercedes-Benz C-Class"),
      translator.translate("Mercedes-Benz C-Class Coupe"),
      translator.translate("Mercedes-Benz C43"),
      translator.translate("Mercedes-Benz CL-Class"),
      translator.translate("Mercedes-Benz CLA"),
      translator.translate("Mercedes-Benz CLC"),
      translator.translate("Mercedes-Benz CLK-Class"),
      translator.translate("Mercedes-Benz CLS-Class"),
      translator.translate("Mercedes-Benz E-Class"),
      translator.translate("Mercedes-Benz E-Class Coupe"),
      translator.translate("Mercedes-Benz G-Class"),
      translator.translate("Mercedes-Benz GL-Class"),
      translator.translate("Mercedes-Benz GLA"),
      translator.translate("Mercedes-Benz GLB"),
      translator.translate("Mercedes-Benz GLC"),
      translator.translate("Mercedes-Benz GLC 63"),
      translator.translate("Mercedes-Benz GLE Coupe"),
      translator.translate("Mercedes-Benz GLE SUV"),
      translator.translate("Mercedes-Benz GLE-Class"),
      translator.translate("Mercedes-Benz GLK-Class"),
      translator.translate("Mercedes-Benz GLS"),
      translator.translate("Mercedes-Benz GLS 580 4Matic"),
      translator.translate("Mercedes-Benz GLS-Class"),
      translator.translate("Mercedes-Benz GT"),
      translator.translate("Mercedes-Benz M-Class"),
      translator.translate("Mercedes-Benz Other"),
//36
      translator.translate("Mercedes-Benz R-Class"),
      translator.translate("Mercedes-Benz S-Class"),
      translator.translate("Mercedes-Benz S-Class Coupe"),
      translator.translate("Mercedes-Benz SEC-Class"),
      translator.translate("Mercedes-Benz SEL-Class"),
      translator.translate("Mercedes-Benz SL-Class"),
      translator.translate("Mercedes-Benz SLC"),
      translator.translate("Mercedes-Benz SLK-Class"),
      translator.translate("Mercedes-Benz SLR"),
      translator.translate("Mercedes-Benz SLS"),
      translator.translate("Mercedes-Benz Sprinter"),
      translator.translate("Mercedes-Benz V-Class"),
      translator.translate("Mercedes-Benz Viano"),
      translator.translate("Mercedes-Benz X Class"),
    ];
    mcLaren = [
      translator.translate("McLaren 570GT"),
      translator.translate("McLaren 570S"),
      translator.translate("McLaren 650S"),
      translator.translate("McLaren 675LT"),
      translator.translate("McLaren 720S"),
      translator.translate("McLaren P1"),
      translator.translate("McLaren SLR"),
      translator.translate("McLaren Senna"),
      translator.translate("McLaren Other"),
      translator.translate("McLaren MP4-12C"),
    ];
    mazda = [
      translator.translate("Mazda 2‬"),
      translator.translate("Mazda 3‬"),
      translator.translate("Mazda 6"),
      translator.translate("Mazda CX-3"),
      translator.translate("Mazda CX-5"),
      translator.translate("Mazda CX-9"),
      translator.translate("Mazda MX-5"),
      translator.translate("Mazda RX-8"),
      translator.translate("Mazda Pickup"),
    ];
    maserati = [
      translator.translate("Maserati Ghibli"),
      translator.translate("Maserati GranCabrio ‬"),
      translator.translate("Maserati GranTurismo"),
      translator.translate("Maserati Levante"),
      translator.translate("Maserati Other ‬"),
      translator.translate("Maserati Quattroporte"),
    ];
    lincoln = [
      translator.translate("Lincoln Aviator"),
      translator.translate("Lincoln LS"),
      translator.translate("Lincoln MKC"),
      translator.translate("Lincoln MKS"),
      translator.translate("Lincoln MKX"),
      translator.translate("Lincoln MKZ"),
      translator.translate("Lincoln Navigator"),
      translator.translate("Lincoln Other"),
      translator.translate("Lincoln Town Car"),
      translator.translate("Lincoln Continental"),
    ];
    lexus = [
      translator.translate("Lexus CT-Series"),
      translator.translate("Lexus ES-Series"),
      translator.translate("Lexus GS-Series"),
      translator.translate("Lexus GX-Series"),
      translator.translate("Lexus IS-C"),
      translator.translate("Lexus IS-F"),
      translator.translate("Lexus IS-Series"),
      translator.translate("Lexus LC 500"),
      translator.translate("Lexus LM 300"),
      translator.translate("Lexus LS-Series"),
      translator.translate("Lexus LX-Series"),
      translator.translate("Lexus NX 200t"),
      translator.translate("Lexus NX 300"),
      translator.translate("Lexus Other"),
      translator.translate("Lexus RC"),
      translator.translate("Lexus RC F"),
      translator.translate("Lexus RX-Series"),
    ];
    landRover = [
      translator.translate("Land Rover Defender"),
      translator.translate("Land Rover Discovery"),
      translator.translate("Land Rover Discovery Sport"),
      translator.translate("Land Rover LR2"),
      translator.translate("Land Rover LR3"),
      translator.translate("Land Rover LR4"),
      translator.translate("Land Rover Range Rover"),
      translator.translate("Land Rover Range Rover Sport"),
      translator.translate("Land Rover Range Rover Velar"),
      translator.translate("Land Rover Range Rover Evoque"),
    ];
    kia = [
      translator.translate("Kia Cadenza"),
      translator.translate("Kia Carens"),
      translator.translate("Kia Carnival"),
      translator.translate("Kia Cerato"),
      translator.translate("Kia K5"),
      translator.translate("Kia Mohave"),
      translator.translate("Kia Oprius"),
      translator.translate("Kia Optima"),
      translator.translate("Kia Other‬"),
      translator.translate("Kia Pegas‬"),
      translator.translate("Kia Picanto‬"),
      translator.translate("Kia Quoris"),
      translator.translate("Kia Rio"),
      translator.translate("Kia Sedona‬"),
      translator.translate("Kia Seltos‬"),
      translator.translate("Kia Sorento‬"),
      translator.translate("Kia Soul"),
      translator.translate("Kia Sportage‬"),
      translator.translate("Kia Stinger‬"),
      translator.translate("Kia Telluride"),
    ];
    jeep = [
      translator.translate("Jeep Cherokee"),
      translator.translate("Jeep Compass "),
      translator.translate("Jeep Commander"),
      translator.translate("Jeep Gladiator"),
      translator.translate("Jeep Grand Cherokee"),
      translator.translate("Jeep Liberty"),
      translator.translate("Jeep Other"),
      translator.translate("Jeep Renegade"),
      translator.translate("Jeep Wrangler"),
      translator.translate("Jeep Wrangler Unlimited"),
    ];
    jaguar = [
      translator.translate('Jaguar E-Pace '),
      translator.translate('Jaguar F-Pace '),
      translator.translate('Jaguar F-Type '),
      translator.translate('Jaguar Other '),
      translator.translate('Jaguar S-Type '),
      translator.translate('Jaguar X-Type '),
      translator.translate('Jaguar XE '),
      translator.translate('Jaguar XF '),
      translator.translate('Jaguar XJ6 '),
      translator.translate('Jaguar XJ8 '),
      translator.translate('Jaguar XJR '),
      translator.translate('Jaguar XK '),
      translator.translate('Jaguar XKR '),
      translator.translate('Jaguar XJ-Series '),
      translator.translate('Jaguar XK8  ')
    ];

    jAC = [
      translator.translate("JAC S3 "),
      translator.translate("JAC S7 "),
    ];

    infiniti = [
      translator.translate("Infiniti EX35"),
      translator.translate("Infiniti FX50"),
      translator.translate("Infiniti FX45/FX35"),
      translator.translate("Infiniti G-Series"),
      translator.translate("Infiniti G25‬"),
      translator.translate("Infiniti JX-Series"),
      translator.translate("Infiniti Other"),
      translator.translate("Infiniti Q30"),
      translator.translate("Infiniti Q50"),
      translator.translate("Infiniti Q60"),
      translator.translate("Infiniti Q70"),
      translator.translate("Infiniti QX30"),
      translator.translate("Infiniti QX50‬"),
      translator.translate("Infiniti QX56"),
      translator.translate("Infiniti QX60"),
      translator.translate("Infiniti QX70"),
      translator.translate("Infiniti QX80"),
    ];

    hyundai = [
      translator.translate("Hyundai Accent"),
      translator.translate("Hyundai Avanti"),
      translator.translate("Hyundai Azera"),
      translator.translate("Hyundai Centennial"),
      translator.translate("Hyundai Coupe"),
      translator.translate("Hyundai Creta"),
      translator.translate("Hyundai Elantra"),
      translator.translate("Hyundai Galloper"),
      translator.translate("Hyundai Genesis"),
      translator.translate("Hyundai Grand Santa Fe"),
      translator.translate("Hyundai H1"),
      translator.translate("Hyundai i10"),
      translator.translate("Hyundai i20"),
      translator.translate("Hyundai Kona"),
      translator.translate("Hyundai Other"),
      translator.translate("Hyundai Palisade"),
      translator.translate("Hyundai Santa Fe"),
      translator.translate("Hyundai Sonata"),
      translator.translate("Hyundai Tucson"),
      translator.translate("Hyundai Veloster"),
      translator.translate("Hyundai Veracruz"),
    ];

    hummer = [
      translator.translate("Hummer H1"),
      translator.translate("Hummer H2"),
      translator.translate("Hummer H3"),
    ];

    hongqi = [];

    honda = [
      translator.translate("Honda Accord"),
      translator.translate("Honda City‬"),
      translator.translate("Honda Civic"),
      translator.translate("Honda CR-V"),
      translator.translate("Honda Crosstour"),
      translator.translate("Honda HR-V‬"),
      translator.translate("Honda Jazz"),
      translator.translate("Honda MR-V"),
      translator.translate("Honda Odyssey"),
      translator.translate("Honda Odyssey J"),
      translator.translate("Honda Other"),
      translator.translate("Honda Pilot"),
    ];

    gmc = [
      translator.translate("GMC Acadia"),
      translator.translate("GMC Envoy"),
      translator.translate("GMC Jimmy"),
      translator.translate("GMC Other"),
      translator.translate("GMC Pickup"),
      translator.translate("GMC Savana"),
      translator.translate("GMC Sierra"),
      translator.translate("GMC Terrain"),
      translator.translate("GMC Yukon"),
      translator.translate("GMC Suburban"),
    ];

    geely = [
      translator.translate("Geely Emgrand 7"),
      translator.translate("Geely Emgrand GT"),
      translator.translate("Geely Emgrand X7"),
      translator.translate("Geely GC6"),
    ];

    ford = [
      translator.translate(" Ford Bronco"),
      translator.translate(" Ford Crown Victoria"),
      translator.translate(" Ford Ecosport"),
      translator.translate(" Ford Edge"),
      translator.translate(" Ford Escape"),
      translator.translate(" Ford Excursion"),
      translator.translate(" Ford Expedition"),
      translator.translate(" Ford Explorer"),
      translator.translate(" Ford F-Series Pickup"),
      translator.translate(" Ford Fiesta"),
      translator.translate(" Ford Figo"),
      translator.translate(" Ford Flex"),
      translator.translate(" Ford Focus"),
      translator.translate(" Ford Fusion"),
      translator.translate(" Ford GT"),
      translator.translate(" Ford Mondeo"),
      translator.translate(" Ford Mustang"),
      translator.translate(" Ford Other"),
      translator.translate(" Ford Pickup"),
      translator.translate(" Ford Ranger"),
      translator.translate(" Ford Shelby Cobra"),
      translator.translate(" Ford Super Duty"),
      translator.translate(" Ford Taurus"),
      translator.translate(" Ford Thunderbird"),
      translator.translate(" Ford Van"),
    ];

    fiat = [
      translator.translate("Fiat 124 Spider"),
      translator.translate("Fiat 500X"),
      translator.translate("Fiat Barchetta"),
      translator.translate("Fiat Fiat-500"),
      translator.translate("Fiat Other"),
    ];

    ferrari = [
      translator.translate(" Ferrari 355"),
      translator.translate(" Ferrari 360"),
      translator.translate(" Ferrari 458"),
      translator.translate(" Ferrari 458 Italia"),
      translator.translate(" Ferrari 458 Speciale"),
      translator.translate(" Ferrari 458 Spider"),
      translator.translate(" Ferrari 488"),
      translator.translate(" Ferrari 488 GTB"),
      translator.translate(" Ferrari 488 Spider"),
      translator.translate(" Ferrari 512"),
      translator.translate(" Ferrari 812 GTS"),
      translator.translate(" Ferrari 812 Superfast"),
      translator.translate(" Ferrari California"),
      translator.translate(" Ferrari California T "),
      translator.translate(" Ferrari F12"),
      translator.translate(" Ferrari F430"),
      translator.translate(" Ferrari F430 Spider"),
      translator.translate(" Ferrari F8 Tributo"),
      translator.translate(" Ferrari F8 Tributo Spider"),
      translator.translate(" Ferrari Ferrari 456  "),
      translator.translate(" Ferrari FF"),
      translator.translate(" Ferrari GTC4 Lusso"),
      translator.translate(" Ferrari LaFerrari"),
      translator.translate(" Ferrari Other"),
      translator.translate(" Ferrari Portofino"),
      translator.translate(" Ferrari Scaglietti"),
      translator.translate(" Ferrari Testarossa"),
    ];

    dodge = [
      translator.translate("Dodge Avenger"),
      translator.translate("Dodge Caliber"),
      translator.translate("Dodge Caravan"),
      translator.translate("Dodge Challenger"),
      translator.translate("Dodge Charger"),
      translator.translate("Dodge Dart"),
      translator.translate("Dodge Durango"),
      translator.translate("Dodge Journey"),
      translator.translate("Dodge Neon"),
      translator.translate("Dodge Nitro"),
      translator.translate("Dodge Other"),
      translator.translate("Dodge Ram"),
      translator.translate("Dodge Viper"),
    ];

    citroen = [
      translator.translate(" Citroen C5 "),
      translator.translate(" Citroen DS 3 "),
      translator.translate(" Citroen DS 5 "),
      translator.translate(" Citroen Other "),
    ];

    chrysler = [
      translator.translate("Chrysler 200/200C EV "),
      translator.translate("Chrysler 300M/300C"),
      translator.translate("Chrysler Other"),
      translator.translate("Chrysler Pacifica"),
      translator.translate("Chrysler Prowler"),
      translator.translate("Chrysler PT Cruiser"),
      translator.translate("Chrysler Sebring"),
      translator.translate("Chrysler Voyager/Caravan"),
    ];

    chevrolet = [
      translator.translate("Chevrolet Astro"),
      translator.translate("Chevrolet Avalanch"),
      translator.translate("Chevrolet Aveo"),
      translator.translate("Chevrolet Blazer"),
      translator.translate("Chevrolet Bolt"),
      translator.translate("Chevrolet Camaro"),
      translator.translate("Chevrolet Caprice"),
      translator.translate("Chevrolet Captiva"),
      translator.translate("Chevrolet Cavalier"),
      translator.translate("Chevrolet Corvette"),
      translator.translate("Chevrolet Cruze "),
      translator.translate("Chevrolet Epica "),
      translator.translate("Chevrolet Equinox "),
      translator.translate("Chevrolet Explorer "),
      translator.translate("Chevrolet Express "),
      translator.translate("Chevrolet Impala "),
      translator.translate("Chevrolet Malibu "),
      translator.translate("Chevrolet Other "),
      translator.translate("Chevrolet Pickup "),
      translator.translate("Chevrolet Silverado"),
      translator.translate("Chevrolet Sonic "),
      translator.translate("Chevrolet Spark "),
      translator.translate("Chevrolet SSR "),
      translator.translate("Chevrolet Suburban "),
      translator.translate("Chevrolet Tahoe "),
      translator.translate("Chevrolet Trailblazer "),
      translator.translate("Chevrolet Traverse "),
      translator.translate("Chevrolet Trax "),
      translator.translate("Chevrolet Uplander "),
    ];

    changan = [
      translator.translate("Changan CS35 Plus"),
      translator.translate("Changan CS75"),
      translator.translate("Changan CS85"),
      translator.translate("Changan CS95"),
      translator.translate("Changan Eado"),
    ];

    cadillac = [
      translator.translate("Cadillac ATS"),
      translator.translate("Cadillac CT4"),
      translator.translate("Cadillac CT6"),
      translator.translate("Cadillac CTS/Catera"),
      translator.translate("Cadillac DTS/De Ville"),
      translator.translate("Cadillac Escalade"),
      translator.translate("Cadillac Fleetwood"),
      translator.translate("Cadillac Other"),
      translator.translate("Cadillac SRX"),
      translator.translate("Cadillac STS/Seville"),
      translator.translate("Cadillac XT4"),
      translator.translate("Cadillac XT5"),
      translator.translate("Cadillac XTR/Eldorado"),
      translator.translate("Cadillac XTS"),
    ];
    bmw = [
      translator.translate("BMW 1-Series"),
      translator.translate("BMW 2-Series"),
      translator.translate("BMW 3-Series"),
      translator.translate("BMW 4-Series"),
      translator.translate("BMW 5-Series"),
      translator.translate("BMW 6-Series"),
      translator.translate("BMW 7-Series"),
      translator.translate("BMW 8-Series"),
      translator.translate("BMW i3"),
      translator.translate("BMW i8"),
      translator.translate("BMW M2"),
      translator.translate("BMW M3"),
      translator.translate("BMW M4"),
      translator.translate("BMW M5"),
      translator.translate("BMW M6"),
      translator.translate("BMW M8"),
      translator.translate("BMW Other"),
      translator.translate("BMW X1"),
      translator.translate("BMW X2"),
      translator.translate("BMW X3"),
      translator.translate("BMW X4"),
      translator.translate("BMW X5"),
      translator.translate("BMW X6"),
      translator.translate("BMW X7"),
      translator.translate("BMW Z3"),
      translator.translate("BMW Z4"),
      translator.translate("BMW Z8"),
    ];
    bentley = [
      translator.translate("Bentley Arnage"),
      translator.translate("Bentley Azure"),
      translator.translate("Bentley Bentayga"),
      translator.translate("Bentley Brooklands"),
      translator.translate("Bentley Continental"),
      translator.translate("Bentley Continental Flying Spur"),
      translator.translate("Bentley Continental GT"),
      translator.translate("Bentley Mulsanne"),
      translator.translate("Bentley Other"),
    ];
    audi = [
      translator.translate("Audi A1"),
      translator.translate("Audi A3"),
      translator.translate("Audi A4"),
      translator.translate("Audi A5"),
      translator.translate("Audi A6"),
      translator.translate("Audi A7"),
      translator.translate("Audi A8"),
      translator.translate("Audi Q2"),
      translator.translate("Audi Q3"),
      translator.translate("Audi Q5"),
      translator.translate("Audi Q7"),
      translator.translate("Audi Q8"),
      translator.translate("Audi R8"),
      translator.translate("Audi S3/RS3"),
      translator.translate("Audi S4/RS4"),
      translator.translate("Audi S5/RS5"),
      translator.translate("Audi S6/RS6"),
      translator.translate("Audi S7/RS7"),
      translator.translate("Audi S8"),
      translator.translate("Audi TT")
    ];
    astonMartin = [
      translator.translate("Aston Martin DB11 "),
      translator.translate("Aston Martin DB9"),
      translator.translate("Aston Martin DBS "),
      translator.translate("Aston Martin Other"),
      translator.translate("Aston Martin Rapide"),
      translator.translate("Aston Martin Vanquish"),
      translator.translate("Aston Martin Vantage "),
      translator.translate("Aston Martin Virage"),
      translator.translate("Aston Martin Zagato"),
    ];
    alfaRomeo = [
      translator.translate("Alfa Romeo 156/159"),
      translator.translate("Alfa Romeo 4C"),
      translator.translate("Alfa Romeo Giulia"),
      translator.translate("Alfa Romeo GIULIETTA"),
      translator.translate("Alfa Romeo GTV/GT"),
      translator.translate("Alfa Romeo Mito"),
      translator.translate("Alfa Romeo Spider "),
      translator.translate("Alfa Romeo Stelvio"),
    ];

    gotoScreen(int choice, String s) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: alfaRomeo,
                index: 0,
                carModel: s);
          if (choice == 1)
            return CarsModels(
              section: 'Motors',
              innersection: 'All',
              choice: true,
              car: astonMartin,
              index: 1,
              carModel: s,
            );

          if (choice == 2)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: audi,
                index: 2,
                carModel: s);
          if (choice == 3)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: bmw,
                index: 3,
                carModel: s);
          if (choice == 4)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: bentley,
                index: 4,
                carModel: s);
          if (choice == 5)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: borgward,
                index: 5,
                carModel: s);
          if (choice == 6)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: brilliance,
                index: 6,
                carModel: s);
          if (choice == 7)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: bugatti,
                index: 7,
                carModel: s);
          if (choice == 8)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: cmc,
                index: 8,
                carModel: s);
          if (choice == 9)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: cadillac,
                index: 9,
                carModel: s);

          if (choice == 10)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: changan,
                index: 10,
                carModel: s);
          if (choice == 11)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: chevrolet,
                index: 11,
                carModel: s);
          if (choice == 12)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: chrysler,
                index: 12,
                carModel: s);
          if (choice == 13)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: citroen,
                index: 13,
                carModel: s);
          if (choice == 14)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: daihatsu,
                index: 14,
                carModel: s);
          if (choice == 15)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: dodge,
                index: 15,
                carModel: s);
          if (choice == 16)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: ferrari,
                index: 16,
                carModel: s);
          if (choice == 17)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: fiat,
                index: 17,
                carModel: s);
          if (choice == 18)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: fiat,
                index: 18,
                carModel: s);
          if (choice == 19)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: foton,
                index: 19,
                carModel: s);

          if (choice == 20)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: gac,
                index: 20,
                carModel: s);
          if (choice == 21)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: gmc,
                index: 21,
                carModel: s);
          if (choice == 22)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: geely,
                index: 22,
                carModel: s);
          if (choice == 23)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: genesis,
                index: 23,
                carModel: s);
          if (choice == 24)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: haval,
                index: 24,
                carModel: s);
          if (choice == 25)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: honda,
                index: 25,
                carModel: s);
          if (choice == 26)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: hummer,
                index: 26,
                carModel: s);
          if (choice == 27)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: hyundai,
                index: 27,
                carModel: s);
          if (choice == 28)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: infiniti,
                index: 28,
                carModel: s);
          if (choice == 29)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: isuzu,
                index: 29,
                carModel: s);

          if (choice == 30)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: jAC,
                index: 30,
                carModel: s);
          if (choice == 31)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: jaguar,
                index: 31,
                carModel: s);
          if (choice == 32)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: jeep,
                index: 32,
                carModel: s);
          if (choice == 33)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: jetour,
                index: 33,
                carModel: s);
          if (choice == 34)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: kia,
                index: 34,
                carModel: s);
          if (choice == 35)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: lamborghini,
                index: 35,
                carModel: s);
          if (choice == 36)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: lancia,
                index: 36,
                carModel: s);
          if (choice == 37)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: landRover,
                index: 37,
                carModel: s);
          if (choice == 38)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: lexus,
                index: 38,
                carModel: s);
          if (choice == 39)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: lincoln,
                index: 39,
                carModel: s);

          if (choice == 40)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: lotus,
                index: 40,
                carModel: s);
          if (choice == 41)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mg,
                index: 41,
                carModel: s);
          if (choice == 42)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mINI,
                index: 42,
                carModel: s);
          if (choice == 43)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mahindra,
                index: 43,
                carModel: s);
          if (choice == 44)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: maserati,
                index: 44,
                carModel: s);
          if (choice == 45)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: maybach,
                index: 45,
                carModel: s);
          if (choice == 46)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mazda,
                index: 46,
                carModel: s);
          if (choice == 47)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mcLaren,
                index: 47,
                carModel: s);
          if (choice == 48)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mercedesBenz,
                index: 48,
                carModel: s);
          if (choice == 49)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mercury,
                index: 49,
                carModel: s);
          if (choice == 50)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mitsubishi,
                index: 50,
                carModel: s);

          if (choice == 51)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: nissan,
                index: 51,
                carModel: s);
          if (choice == 52)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: mazda,
                index: 52,
                carModel: s);
          if (choice == 53)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: opel,
                index: 53,
                carModel: s);
          if (choice == 54)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: othermake,
                index: 54,
                carModel: s);
          if (choice == 55)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: oullim,
                index: 55,
                carModel: s);
          if (choice == 56)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: peugeot,
                index: 56,
                carModel: s);
          if (choice == 57)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: pontiac,
                index: 57,
                carModel: s);
          if (choice == 58)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: porsche,
                index: 58,
                carModel: s);
          if (choice == 59)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: proton,
                index: 59,
                carModel: s);
          if (choice == 60)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: renault,
                index: 60,
                carModel: s);
          if (choice == 61)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: rollsRoyce,
                index: 61,
                carModel: s);
          if (choice == 62)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: rover,
                index: 62,
                carModel: s);
          if (choice == 63)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: seat,
                index: 63,
                carModel: s);
          if (choice == 64)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: skoda,
                index: 64,
                carModel: s);
          if (choice == 65)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: smart,
                index: 65,
                carModel: s);
          if (choice == 66)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: soueast,
                index: 66,
                carModel: s);
          if (choice == 67)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: ssangYong,
                index: 67,
                carModel: s);
          if (choice == 68)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: subaru,
                index: 68,
                carModel: s);
          if (choice == 69)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: suzuki,
                index: 69,
                carModel: s);
          if (choice == 70)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: tata,
                index: 70,
                carModel: s);

          if (choice == 71)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: tesla,
                index: 71,
                carModel: s);
          if (choice == 72)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: toyota,
                index: 72,
                carModel: s);
          if (choice == 73)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: volkswagen,
                index: 73,
                carModel: s);
          if (choice == 74)
            return CarsModels(
                section: 'Motors',
                innersection: 'All',
                choice: true,
                car: volvo,
                index: 74,
                carModel: s);
          else
            return Container();
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Transform.scale(
            scale: leadingSize,
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp),
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.of(context).pop();
              },
            )),
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("${translator.translate("choose_the_category2")}",
                      style: new TextStyle(
                          fontSize: 5.w, color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                            "... >${translator.translate('Motors')}> ${translator.translate('All')}",
                            style: new TextStyle(
                                fontSize: 3.5.w, color: Colors.grey[800])),
                      ),
                    ],
                  ),
                  SizedBox(height: rotate2),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: carsModels.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0, carsModels[index]);
                    if (index == 1) gotoScreen(1, carsModels[index]);
                    if (index == 2) gotoScreen(2, carsModels[index]);
                    if (index == 3) gotoScreen(3, carsModels[index]);
                    if (index == 4) gotoScreen(4, carsModels[index]);
                    if (index == 5) gotoScreen(5, carsModels[index]);
                    if (index == 6) gotoScreen(6, carsModels[index]);
                    if (index == 7) gotoScreen(7, carsModels[index]);
                    if (index == 8) gotoScreen(8, carsModels[index]);
                    if (index == 9) gotoScreen(9, carsModels[index]);
                    if (index == 10) gotoScreen(10, carsModels[index]);
                    if (index == 11) gotoScreen(11, carsModels[index]);
                    if (index == 12) gotoScreen(12, carsModels[index]);
                    if (index == 13) gotoScreen(13, carsModels[index]);
                    if (index == 14) gotoScreen(14, carsModels[index]);
                    if (index == 15) gotoScreen(15, carsModels[index]);
                    if (index == 16) gotoScreen(16, carsModels[index]);
                    if (index == 17) gotoScreen(17, carsModels[index]);
                    if (index == 18) gotoScreen(18, carsModels[index]);
                    if (index == 19) gotoScreen(19, carsModels[index]);
                    if (index == 20) gotoScreen(20, carsModels[index]);
                    if (index == 21) gotoScreen(21, carsModels[index]);
                    if (index == 22) gotoScreen(22, carsModels[index]);
                    if (index == 23) gotoScreen(23, carsModels[index]);
                    if (index == 24) gotoScreen(24, carsModels[index]);
                    if (index == 25) gotoScreen(25, carsModels[index]);
                    if (index == 26) gotoScreen(26, carsModels[index]);
                    if (index == 27) gotoScreen(27, carsModels[index]);
                    if (index == 28) gotoScreen(28, carsModels[index]);
                    if (index == 29) gotoScreen(29, carsModels[index]);
                    if (index == 30) gotoScreen(30, carsModels[index]);
                    if (index == 31) gotoScreen(31, carsModels[index]);
                    if (index == 32) gotoScreen(32, carsModels[index]);
                    if (index == 33) gotoScreen(33, carsModels[index]);
                    if (index == 34) gotoScreen(34, carsModels[index]);
                    if (index == 35) gotoScreen(35, carsModels[index]);
                    if (index == 36) gotoScreen(36, carsModels[index]);
                    if (index == 37) gotoScreen(37, carsModels[index]);
                    if (index == 38) gotoScreen(38, carsModels[index]);
                    if (index == 39) gotoScreen(39, carsModels[index]);
                    if (index == 40) gotoScreen(40, carsModels[index]);
                    if (index == 41) gotoScreen(41, carsModels[index]);
                    if (index == 42) gotoScreen(42, carsModels[index]);
                    if (index == 43) gotoScreen(43, carsModels[index]);
                    if (index == 44) gotoScreen(44, carsModels[index]);
                    if (index == 45) gotoScreen(45, carsModels[index]);
                    if (index == 46) gotoScreen(46, carsModels[index]);
                    if (index == 47) gotoScreen(47, carsModels[index]);
                    if (index == 48) gotoScreen(48, carsModels[index]);
                    if (index == 49) gotoScreen(49, carsModels[index]);
                    if (index == 50) gotoScreen(50, carsModels[index]);
                    if (index == 51) gotoScreen(51, carsModels[index]);
                    if (index == 52) gotoScreen(52, carsModels[index]);
                    if (index == 53) gotoScreen(53, carsModels[index]);
                    if (index == 54) gotoScreen(54, carsModels[index]);
                    if (index == 55) gotoScreen(55, carsModels[index]);
                    if (index == 56) gotoScreen(56, carsModels[index]);
                    if (index == 57) gotoScreen(57, carsModels[index]);
                    if (index == 58) gotoScreen(58, carsModels[index]);
                    if (index == 59) gotoScreen(59, carsModels[index]);
                    if (index == 60) gotoScreen(60, carsModels[index]);
                    if (index == 61) gotoScreen(61, carsModels[index]);
                    if (index == 62) gotoScreen(62, carsModels[index]);
                    if (index == 63) gotoScreen(63, carsModels[index]);
                    if (index == 64) gotoScreen(64, carsModels[index]);
                    if (index == 65) gotoScreen(65, carsModels[index]);
                    if (index == 66) gotoScreen(66, carsModels[index]);
                    if (index == 67) gotoScreen(67, carsModels[index]);
                    if (index == 68) gotoScreen(68, carsModels[index]);
                    if (index == 69) gotoScreen(69, carsModels[index]);
                    if (index == 70) gotoScreen(70, carsModels[index]);
                    if (index == 71) gotoScreen(71, carsModels[index]);
                    if (index == 72) gotoScreen(72, carsModels[index]);
                    if (index == 73) gotoScreen(73, carsModels[index]);
                    if (index == 74) gotoScreen(74, carsModels[index]);
                    if (index == 75) gotoScreen(75, carsModels[index]);
                    if (index == 76) gotoScreen(76, carsModels[index]);
                    if (index == 77) gotoScreen(77, carsModels[index]);
                    if (index == 78) gotoScreen(78, carsModels[index]);
                    if (index == 79) gotoScreen(79, carsModels[index]);
                    if (index == 80) gotoScreen(80, carsModels[index]);
                    if (index == 81) gotoScreen(81, carsModels[index]);
                    if (index == 82) gotoScreen(82, carsModels[index]);
                  },
                  title:
                      Text(carsModels[index], style: TextStyle(fontSize: 5.w)),
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

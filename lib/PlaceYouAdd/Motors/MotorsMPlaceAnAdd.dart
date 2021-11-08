import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
 
import 'package:oxydu/MotorsMain/CarsModels.dart';

import '../../Boats.dart';

class MotorsMain extends StatelessWidget {
  // final String message;
  //final dynamic choice;
  //  MotorsMain({@required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MotorCycle(),
    );
  }
}

class MotorCycle extends StatelessWidget {
  // final String message;
  // final String choice;
//   MotorCycle({@required this.message});

  @override
  Widget build(BuildContext context) {
    List motor = [
      translator.translate('All'),
      translator.translate('Motorcycles'),
      translator.translate('Auto Accessories'),
      translator.translate('Heavy Vehicles'),
      translator.translate('Boats'),
      translator.translate('NumberPlates'),
    ];

    gotoScreen(dynamic choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0) return UsedCarsMenu();
          else
            return Container();
         /* if (choice == 1)
            return MotorCycleMain(
              choice: false,
            );
          if (choice == 2)
            return AutoAccessories(
              choice: false,
            );

          if (choice == 3)
            return HeavyVehiclesMain(
              choice: false,
            );
          if (choice == 4)
            return BoatsMain(choice: false);
          //  if (choice == 5) return UsedCarForSale();
          //    if (choice == 1) return SearchList();
          else
            return Container();*/
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
                  SizedBox(height: 15),
                  Text("Choose the category",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: 9),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.2),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: motor.length,
                itemBuilder: (BuildContext context, dynamic index) => ListTile(
                  onTap: () {
                    if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);
                    if (index == 6) gotoScreen(6);
                  },
                  title: Text(motor[index], style: TextStyle(fontSize: 17)),
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

double rotate = 0, rotate2 = 0;

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
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }

    carsModels = [
      translator.translate('Acura'),
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
      translator.translate('Fisker'),
      translator.translate('Ford'),
      translator.translate('Foton'),
      translator.translate('GAC'),
      translator.translate('GMC'),
      translator.translate('Geely'),
      translator.translate('Genesis'),
      translator.translate('Grand Tiger'),
      translator.translate('Great Wall'),
      translator.translate('Haval'),
      translator.translate('Honda'),
      translator.translate('Hongqi'),
      translator.translate('Hummer'),
      translator.translate('Hyundai'),
      translator.translate('Infiniti'),
      translator.translate('Isuzu'),
      translator.translate('JAC'),
      translator.translate('Jaguar'),
      translator.translate('Jeep'),
      translator.translate('Jetour'),
      translator.translate('Kia'),
      translator.translate('King Long'),
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
      translator.translate('UAZ'),
      translator.translate('Volkswagen'),
      translator.translate('Volvo'),
      translator.translate('W Motors'),
    ];

    cmc = [
      translator.translate("CMC Veryca "),
    ];

    borgward = [
      translator.translate("Borgward BX5"),
      translator.translate("Borgward BX7"),
    ];

    acura = [
      translator.translate("Acura RSX/Integra"),
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
    fisker = [
      translator.translate("Fisker Karma"),
    ];
    foton = [
      translator.translate("Foton View"),
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
      translator.translate("Genesis Coupe"),
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
      translator.translate("Suzuki Vitara"),
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
      translator.translate("Mercedes-Benz GLS-Class"),
      translator.translate("Mercedes-Benz GT"),
      translator.translate("Mercedes-Benz M-Class"),
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
      translator.translate("Mercedes-Benz Other"),
      translator.translate("Mercedes-Benz AMG GT 4 doors"),
      translator.translate("Mercedes-Benz GLS 580 4Matic"),
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
    ];
    jaguar = [
      translator.translate("Jaguar X-Type"),
      translator.translate("Jaguar XE"),
      translator.translate("Jaguar XF"),
    ];

    jAC = [translator.translate("JAC S3 ")];

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
      translator.translate("Chevrolet Trailbla "),
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

    gotoScreen(dynamic choice) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          if (choice == 0)
            return CarsModels(
              section: 'Motors',
                innersection: 'All',
                choice: false, car: acura, index: 0, carModel: "Acura");
          if (choice == 1)
            return CarsModels(
              section: 'Motors',
                innersection: 'All',
                choice: false,
                car: alfaRomeo,
                index: 1,
                carModel: "Alfa Romeo");

          if (choice == 2)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: astonMartin,
                index: 2,
                carModel: "Aston Martin");
          if (choice == 3)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: audi, index: 3, carModel: "Audi");
          if (choice == 4)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: bmw, index: 4, carModel: "BMW");
          if (choice == 5)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: bentley, index: 5, carModel: "Bentley");
          if (choice == 6)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: borgward, index: 6, carModel: "Borgward");
          if (choice == 7)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: brilliance,
                index: 7,
                carModel: "Brilliance‬");
          if (choice == 8)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: bugatti, index: 8, carModel: "Bugatti‬");
          if (choice == 9)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: cmc, index: 9, carModel: "CMC");

          if (choice == 10)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: cadillac, index: 10, carModel: "Cadillac");
          if (choice == 11)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: changan, index: 11, carModel: "Changan");
          if (choice == 12)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: chevrolet,
                index: 12,
                carModel: "Chevrolet");
          if (choice == 13)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: chrysler, index: 13, carModel: "Chrysler");
          if (choice == 14)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: citroen, index: 14, carModel: "Citroen");
          if (choice == 15)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: daihatsu, index: 15, carModel: "Daihatsu");
          if (choice == 16)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: dodge, index: 16, carModel: "Dodge");
          if (choice == 17)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: ferrari, index: 17, carModel: "Ferrari");
          if (choice == 18)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: fiat, index: 18, carModel: "Fiat");
          if (choice == 19)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: fisker, index: 19, carModel: "Fisker");

          if (choice == 20)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: ford, index: 20, carModel: "Ford");
          if (choice == 21)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: foton, index: 21, carModel: "Foton");
          if (choice == 22)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: gac, index: 22, carModel: "GAC");
          if (choice == 23)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: gmc, index: 23, carModel: "GMC");
          if (choice == 24)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: geely, index: 24, carModel: "Geely");
          if (choice == 25)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: genesis, index: 25, carModel: "Genesis");
          if (choice == 26)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: grandTiger,
                index: 26,
                carModel: "Grand Tiger");
          if (choice == 27)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: greatWall,
                index: 27,
                carModel: "Great Wall");
          if (choice == 28)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: haval, index: 28, carModel: "Haval");
          if (choice == 29)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: honda, index: 29, carModel: "Honda");

          if (choice == 30)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: hongqi, index: 30, carModel: "Hongqi");
          if (choice == 31)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: hummer, index: 31, carModel: "Hummer");
          if (choice == 32)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: hyundai, index: 32, carModel: "Hyundai");
          if (choice == 33)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: infiniti, index: 33, carModel: "Infiniti");
          if (choice == 34)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: isuzu, index: 34, carModel: "Isuzu");
          if (choice == 35)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: jAC, index: 35, carModel: "JAC");
          if (choice == 36)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: jaguar, index: 36, carModel: "Jaguar");
          if (choice == 37)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: jeep, index: 37, carModel: "Jeep");
          if (choice == 38)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: jetour, index: 38, carModel: "Jetour");
          if (choice == 39)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: kia, index: 39, carModel: "Kia");

          if (choice == 40)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: kingLong, index: 40, carModel: "King Long");
          if (choice == 41)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: lamborghini,
                index: 41,
                carModel: "Lamborghini");
          if (choice == 42)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: lancia, index: 42, carModel: "Lancia");
          if (choice == 43)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: landRover,
                index: 43,
                carModel: "Land Rover");
          if (choice == 44)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: lexus, index: 44, carModel: "Lexus");
          if (choice == 45)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: lincoln, index: 45, carModel: "Lincoln");
          if (choice == 46)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: lotus, index: 46, carModel: "Lotus");
          if (choice == 47)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mg, index: 47, carModel: "MG");
          if (choice == 48)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mINI, index: 48, carModel: "MINI");
          if (choice == 49)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mahindra, index: 49, carModel: "Mahindra");
          if (choice == 50)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: maserati, index: 50, carModel: "Maserati");

          if (choice == 51)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: maybach, index: 51, carModel: "Maybach");
          if (choice == 52)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mazda, index: 52, carModel: "Mazda");
          if (choice == 53)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mcLaren, index: 53, carModel: "McLaren");
          if (choice == 54)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: mercedesBenz,
                index: 54,
                carModel: "Mercedes-Benz");
          if (choice == 55)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: mercury, index: 55, carModel: "Mercury");
          if (choice == 56)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: mitsubishi,
                index: 56,
                carModel: "Mitsubishi");
          if (choice == 57)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: morgan, index: 57, carModel: "Morgan");
          if (choice == 58)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: nissan, index: 58, carModel: "Nissan");
          if (choice == 59)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: opel, index: 59, carModel: "Opel");
          if (choice == 60)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: othermake,
                index: 60,
                carModel: "Other Make");
          if (choice == 61)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: oullim, index: 61, carModel: "Oullim");
          if (choice == 62)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: peugeot, index: 62, carModel: "Peugeot");
          if (choice == 63)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: pontiac, index: 63, carModel: "Pontiac");
          if (choice == 64)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: porsche, index: 64, carModel: "Porsche");
          if (choice == 65)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: proton, index: 65, carModel: "Proton");
          if (choice == 66)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: renault, index: 66, carModel: "Renault");
          if (choice == 67)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: rollsRoyce,
                index: 67,
                carModel: "Rolls Royce");
          if (choice == 68)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: rover, index: 68, carModel: "Rover");
          if (choice == 69)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: seat, index: 69, carModel: "Seat");
          if (choice == 70)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: skoda, index: 70, carModel: "Skoda");

          if (choice == 71)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: smart, index: 71, carModel: "Smart");
          if (choice == 72)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: soueast, index: 72, carModel: "Soueast");
          if (choice == 73)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: ssangYong,
                index: 73,
                carModel: "Ssang Yong");
          if (choice == 74)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: subaru, index: 74, carModel: "Subaru");
          if (choice == 75)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: suzuki, index: 75, carModel: "Suzuki");
          if (choice == 76)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: tata, index: 76, carModel: "TATA");
          if (choice == 77)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: tesla, index: 77, carModel: "Tesla");
          if (choice == 78)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: toyota, index: 78, carModel: "Toyota");
          if (choice == 79)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: uaz, index: 79, carModel: "UAZ");
          if (choice == 80)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false,
                car: volkswagen,
                index: 80,
                carModel: "Volkswagen");
          if (choice == 81)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: volvo, index: 81, carModel: "Volvo");
          if (choice == 82)
            return CarsModels(section: 'Motors',
                innersection: 'All',
                choice: false, car: wMotors, index: 82, carModel: "W Motors");
          else
            return Container();
        }),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
                  Text("${translator.translate("Now_choose_the_right")}",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text("${translator.translate("category_for_your_ad")}",
                      style: new TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  SizedBox(
                    width: rotate,
                    child: Text(
                        "... >${translator.translate('Motors')}> ${translator.translate('All')}",
                        style: new TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800])),
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
                itemBuilder: (BuildContext context, dynamic index) => ListTile(
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
                    if (index == 21) gotoScreen(21);
                    if (index == 22) gotoScreen(22);
                    if (index == 23) gotoScreen(23);
                    if (index == 24) gotoScreen(24);
                    if (index == 25) gotoScreen(25);
                    if (index == 26) gotoScreen(26);
                    if (index == 27) gotoScreen(27);
                    if (index == 28) gotoScreen(28);
                    if (index == 29) gotoScreen(29);
                    if (index == 30) gotoScreen(30);
                    if (index == 31) gotoScreen(31);
                    if (index == 32) gotoScreen(32);
                    if (index == 33) gotoScreen(33);
                    if (index == 34) gotoScreen(34);
                    if (index == 35) gotoScreen(35);
                    if (index == 36) gotoScreen(36);
                    if (index == 37) gotoScreen(37);
                    if (index == 38) gotoScreen(38);
                    if (index == 39) gotoScreen(39);
                    if (index == 40) gotoScreen(40);
                    if (index == 41) gotoScreen(41);
                    if (index == 42) gotoScreen(42);
                    if (index == 43) gotoScreen(43);
                    if (index == 44) gotoScreen(44);
                    if (index == 45) gotoScreen(45);
                    if (index == 46) gotoScreen(46);
                    if (index == 47) gotoScreen(47);
                    if (index == 48) gotoScreen(48);
                    if (index == 49) gotoScreen(49);
                    if (index == 50) gotoScreen(50);
                    if (index == 51) gotoScreen(51);
                    if (index == 52) gotoScreen(52);
                    if (index == 53) gotoScreen(53);
                    if (index == 54) gotoScreen(54);
                    if (index == 55) gotoScreen(55);
                    if (index == 56) gotoScreen(56);
                    if (index == 57) gotoScreen(57);
                    if (index == 58) gotoScreen(58);
                    if (index == 59) gotoScreen(59);
                    if (index == 60) gotoScreen(60);
                    if (index == 61) gotoScreen(61);
                    if (index == 62) gotoScreen(62);
                    if (index == 63) gotoScreen(63);
                    if (index == 64) gotoScreen(64);
                    if (index == 65) gotoScreen(65);
                    if (index == 66) gotoScreen(66);
                    if (index == 67) gotoScreen(67);
                    if (index == 68) gotoScreen(68);
                    if (index == 69) gotoScreen(69);
                    if (index == 70) gotoScreen(70);
                    if (index == 71) gotoScreen(71);
                    if (index == 72) gotoScreen(72);
                    if (index == 73) gotoScreen(73);
                    if (index == 74) gotoScreen(74);
                    if (index == 75) gotoScreen(75);
                    if (index == 76) gotoScreen(76);
                    if (index == 77) gotoScreen(77);
                    if (index == 78) gotoScreen(78);
                    if (index == 79) gotoScreen(79);
                    if (index == 80) gotoScreen(80);
                    if (index == 81) gotoScreen(81);
                    if (index == 82) gotoScreen(82);
                  },
                  title:
                      Text(carsModels[index], style: TextStyle(fontSize: 17)),
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

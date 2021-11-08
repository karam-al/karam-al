import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oxydu/MotorsMain/UsedCarForSale.dart';
import 'package:sizer/sizer.dart';

double rotate = 0, rotate2 = 0;
int carModelAPI;

class CarsModels extends StatefulWidget {
  final int index;
  final bool choice;
  final List<String> car;
  final String carModel, section, innersection;

  //Test2({@required this.message, @required this.choice});
  //NameViewList({List<String> names}) : this.names = names ?? [];

  CarsModels({
    @required this.choice,
    @required this.car,
    @required this.index,
    @required this.carModel,
    @required this.section,
    @required this.innersection,
  });

  @override
  _CarsModelsState createState() => _CarsModelsState();
}

class _CarsModelsState extends State<CarsModels> {
  int car;
  String _selectedLocatioNcmc,
      _selectedLocatioNalfaRomeo,
      _selectedLocatioNastonMartin,
      _selectedLocatioNaudi,
      _selectedLocatioNbmw,
      _selectedLocatioNbentley,
      _selectedLocatioNborgward,
      _selectedLocatioNbrilliance,
      _selectedLocatioNbugatti,
      _selectedLocatioNcadillac,
      _selectedLocatioNchangan,
      _selectedLocatioNchevrolet,
      _selectedLocatioNchrysler,
      _selectedLocatioNcitroen,
      _selectedLocatioNdaihatsu,
      _selectedLocatioNdodge,
      _selectedLocatioNferrari,
      _selectedLocatioNfiat,
      _selectedLocatioNford,
      _selectedLocatioNfoton,
      _selectedLocatioNgac,
      _selectedLocatioNgmc,
      _selectedLocatioNgeely,
      _selectedLocatioNgenesis,
      _selectedLocatioNhaval,
      _selectedLocatioNhonda,
      _selectedLocatioNhummer,
      _selectedLocatioNhyundai,
      _selectedLocatioNinfiniti,
      _selectedLocatioNisuzu,
      _selectedLocatioNjAC,
      _selectedLocatioNjaguar,
      _selectedLocatioNjeep,
      _selectedLocatioNjetour,
      _selectedLocatioNkia,
      _selectedLocatioNlamborghini,
      _selectedLocatioNlancia,
      _selectedLocatioNlandRover,
      _selectedLocatioNlexus,
      _selectedLocatioNlincoln,
      _selectedLocatioNlotus,
      _selectedLocatioNmg,
      _selectedLocatioNmINI,
      _selectedLocatioNmahindra,
      _selectedLocatioNmaserati,
      _selectedLocatioNmaybach,
      _selectedLocatioNmazda,
      _selectedLocatioNmcLaren,
      _selectedLocatioNmercedesBenz,
      _selectedLocatioNmercury,
      _selectedLocatioNmitsubishi,
      _selectedLocatioNmorgan,
      _selectedLocatioNnissan,
      _selectedLocatioNopel,
      _selectedLocatioNothermake,
      _selectedLocatioNoullim,
      _selectedLocatioNpeugeot,
      _selectedLocatioNpontiac,
      _selectedLocatioNporsche,
      _selectedLocatioNproton,
      _selectedLocatioNrenault,
      _selectedLocatioNrollsRoyce,
      _selectedLocatioNrover,
      _selectedLocatioNseat,
      _selectedLocatioNskoda,
      _selectedLocatioNsmart,
      _selectedLocatioNsoueast,
      _selectedLocatioNssangYong,
      _selectedLocatioNsubaru,
      _selectedLocatioNsuzuki,
      _selectedLocatioNtata,
      _selectedLocatioNtesla,
      _selectedLocatioNtoyota,
      _selectedLocatioNvolkswagen,
      _selectedLocatioNvolvo,
      _selectedLocationcartype3,
      _selectedLocatioNwMotors,
      newValue;

  double rotate = 0, rotate2 = 0, leadingSize;
  @override
  void initState() {
    super.initState();
    SizerUtil.deviceType == DeviceType.mobile
        ? leadingSize = 0.3.w
        : leadingSize = 0.22.w;
  }

  @override
  Widget build(BuildContext context) {
    List<String> carModels = widget.car;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      rotate = MediaQuery.of(context).size.width * 0.93;
      rotate2 = MediaQuery.of(context).size.height * 0.02;
    }
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      rotate = MediaQuery.of(context).size.width * 0.96;
      rotate2 = MediaQuery.of(context).size.height * 0.04;
    }
    gotoScreen(
        int choice, int carModel, int car, String caar, String carModeel) {
      if (translator.currentLanguage == 'ar') {
        if (choice == 0) {
          car = 1113;
          if (carModel == 0) carModelAPI = 3979;
          if (carModel == 1) carModelAPI = 3969;
          if (carModel == 2) carModelAPI = 3957;
          if (carModel == 3) carModelAPI = 3965;
          if (carModel == 4) carModelAPI = 3961;
          if (carModel == 5) carModelAPI = 3951;
          if (carModel == 6) carModelAPI = 3949;
          if (carModel == 7) carModelAPI = 3947;
          _selectedLocatioNalfaRomeo = newValue;
        }
        if (choice == 1) {
          car = 1111;
          if (carModel == 0) carModelAPI = 1115;
          if (carModel == 1) carModelAPI = 4031;
          if (carModel == 2) carModelAPI = 4035;
          if (carModel == 3) carModelAPI = 4029;
          if (carModel == 4) carModelAPI = 1117;
          if (carModel == 5) carModelAPI = 1119;
          if (carModel == 6) carModelAPI = 4037;
          if (carModel == 7) carModelAPI = 4043;
          if (carModel == 8) carModelAPI = 4053;
          _selectedLocatioNastonMartin = newValue;
        }
        if (choice == 2) {
          car = 829;
          if (carModel == 0) carModelAPI = 3917;
          if (carModel == 1) carModelAPI = 935;
          if (carModel == 2) carModelAPI = 937;
          if (carModel == 3) carModelAPI = 939;
          if (carModel == 4) carModelAPI = 3125;
          if (carModel == 5) carModelAPI = 3137;
          if (carModel == 6) carModelAPI = 3143;
          if (carModel == 7) carModelAPI = 3249;
          if (carModel == 8) carModelAPI = 3261;
          if (carModel == 9) carModelAPI = 3269;
          if (carModel == 10) carModelAPI = 3271;
          if (carModel == 11) carModelAPI = 3281;
          if (carModel == 12) carModelAPI = 3919;
          if (carModel == 13) carModelAPI = 3291;
          if (carModel == 14) carModelAPI = 3921;
          if (carModel == 15) carModelAPI = 3299;
          if (carModel == 16) carModelAPI = 3301;
          if (carModel == 17) carModelAPI = 3923;
          if (carModel == 18) carModelAPI = 3303;
          if (carModel == 19) carModelAPI = 3305;
          _selectedLocatioNaudi = newValue;
        }
        if (choice == 3) {
          car = 941;
          if (carModel == 0) carModelAPI = 943;
          if (carModel == 1) carModelAPI = 947;
          if (carModel == 2) carModelAPI = 3335;
          if (carModel == 3) carModelAPI = 3379;
          if (carModel == 4) carModelAPI = 3387;
          if (carModel == 5) carModelAPI = 3393;
          if (carModel == 6) carModelAPI = 3397;
          if (carModel == 7) carModelAPI = 3415;
          if (carModel == 8) carModelAPI = 3535;
          if (carModel == 9) carModelAPI = 3681;
          if (carModel == 10) carModelAPI = 3463;
          if (carModel == 11) carModelAPI = 3417;
          if (carModel == 12) carModelAPI = 3659;
          if (carModel == 13) carModelAPI = 3423;
          if (carModel == 14) carModelAPI = 3669;
          if (carModel == 15) carModelAPI = 3435;
          if (carModel == 16) carModelAPI = 3811;
          if (carModel == 17) carModelAPI = 3467;
          if (carModel == 18) carModelAPI = 3691;
          if (carModel == 19) carModelAPI = 3501;
          if (carModel == 20) carModelAPI = 3509;
          if (carModel == 21) carModelAPI = 3517;
          if (carModel == 22) carModelAPI = 3523;
          if (carModel == 23) carModelAPI = 3257;
          if (carModel == 24) carModelAPI = 3699;
          if (carModel == 25) carModelAPI = 3531;
          if (carModel == 26) carModelAPI = 3701;
          //if (carModel == 27) carModelAPI = 3651;
          _selectedLocatioNbmw = newValue;
        }
        if (choice == 4) {
          car = 1121;
          if (carModel == 0) carModelAPI = 3831;
          if (carModel == 1) carModelAPI = 3859;
          if (carModel == 2) carModelAPI = 1235;
          if (carModel == 3) carModelAPI = 1237;
          if (carModel == 4) carModelAPI = 1243;
          if (carModel == 5) carModelAPI = 3547;
          if (carModel == 6) carModelAPI = 3539;
          if (carModel == 7) carModelAPI = 3543;
          if (carModel == 8) carModelAPI = 3907;
          _selectedLocatioNbentley = newValue;
        }
        if (choice == 5) {
          car = 3954;
          if (carModel == 0) carModelAPI = 3959;
          if (carModel == 1) carModelAPI = 3967;
          _selectedLocatioNborgward = newValue;
        }
        if (choice == 6) {
          car = 4009;
          if (carModel == 0) carModelAPI = 4033;
          _selectedLocatioNbrilliance = newValue;
        }
        if (choice == 7) {
          car = 4051;
          if (carModel == 1) carModelAPI = 4085;
          if (carModel == 2) carModelAPI = 4097;
          if (carModel == 0) carModelAPI = 4095;
          if (carModel == 3) carModelAPI = 4099;
          _selectedLocatioNbugatti = newValue;
        }
        if (choice == 8) {
          car = 4089;
          if (carModel == 0) carModelAPI = 4093;
          _selectedLocatioNcmc = newValue;
        }
        if (choice == 9) {
          car = 1123;
          if (carModel == 0) carModelAPI = 1251;
          if (carModel == 1) carModelAPI = 4135;
          if (carModel == 2) carModelAPI = 3565;
          if (carModel == 3) carModelAPI = 1253;
          if (carModel == 4) carModelAPI = 4139;
          if (carModel == 5) carModelAPI = 1259;
          if (carModel == 6) carModelAPI = 3569;
          if (carModel == 7) carModelAPI = 4133;
          if (carModel == 8) carModelAPI = 3599;
          if (carModel == 9) carModelAPI = 4143;
          if (carModel == 10) carModelAPI = 4147;
          if (carModel == 11) carModelAPI = 4153;
          if (carModel == 12) carModelAPI = 4155;
          if (carModel == 13) carModelAPI = 3621;
          _selectedLocatioNcadillac = newValue;
        }
        if (choice == 10) {
          car = 1125;
          if (carModel == 0) carModelAPI = 4131;
          if (carModel == 1) carModelAPI = 4137;
          if (carModel == 2) carModelAPI = 1285;
          if (carModel == 3) carModelAPI = 4141;
          if (carModel == 4) carModelAPI = 4145;
          _selectedLocatioNchangan = newValue;
        }
        if (choice == 11) {
          car = 949;
          if (carModel == 0) carModelAPI = 6291;
          if (carModel == 1) carModelAPI = 4269;
          if (carModel == 2) carModelAPI = 6267;
          if (carModel == 3) carModelAPI = 951;
          if (carModel == 4) carModelAPI = 4265;
          if (carModel == 5) carModelAPI = 953;
          if (carModel == 6) carModelAPI = 955;
          if (carModel == 7) carModelAPI = 4263;
          if (carModel == 8) carModelAPI = 4261;
          if (carModel == 9) carModelAPI = 4259;
          if (carModel == 10) carModelAPI = 4257;
          if (carModel == 11) carModelAPI = 6255;
          if (carModel == 12) carModelAPI = 4253;
          if (carModel == 13) carModelAPI = 4251;
          if (carModel == 14) carModelAPI = 4247;
          if (carModel == 15) carModelAPI = 4245;
          if (carModel == 16) carModelAPI = 6221;
          if (carModel == 17) carModelAPI = 4243;
          if (carModel == 18) carModelAPI = 4239;
          if (carModel == 19) carModelAPI = 4237;
          if (carModel == 20) carModelAPI = 4235;
          if (carModel == 21) carModelAPI = 4241;
          if (carModel == 22) carModelAPI = 4233;
          if (carModel == 23) carModelAPI = 4231;
          if (carModel == 24) carModelAPI = 4229;
          if (carModel == 25) carModelAPI = 4227;
          if (carModel == 26) carModelAPI = 4225;
          if (carModel == 27) carModelAPI = 4223;
          _selectedLocatioNchevrolet = newValue;
        }
        if (choice == 12) {
          car = 1127;
          if (carModel == 0) carModelAPI = 1340;
          if (carModel == 1) carModelAPI = 1342;
          if (carModel == 2) carModelAPI = 4295;
          if (carModel == 3) carModelAPI = 4285;
          if (carModel == 4) carModelAPI = 4287;
          if (carModel == 5) carModelAPI = 4283;
          if (carModel == 6) carModelAPI = 4289;
          if (carModel == 7) carModelAPI = 4293;
          _selectedLocatioNchrysler = newValue;
        }
        if (choice == 13) {
          car = 1129;
          if (carModel == 0) carModelAPI = 4313;
          if (carModel == 1) carModelAPI = 4311;
          if (carModel == 2) carModelAPI = 4305;
          if (carModel == 3) carModelAPI = 1358;
          _selectedLocatioNcitroen = newValue;
        }
        if (choice == 14) {
          car = 4317;
          if (carModel == 0) carModelAPI = 4349;
          if (carModel == 1) carModelAPI = 4353;
          if (carModel == 2) carModelAPI = 4341;
          _selectedLocatioNdaihatsu = newValue;
        }
        if (choice == 15) {
          car = 1131;
          if (carModel == 0) carModelAPI = 4351;
          if (carModel == 1) carModelAPI = 4355;
          if (carModel == 2) carModelAPI = 4357;
          if (carModel == 3) carModelAPI = 1388;
          if (carModel == 4) carModelAPI = 1390;
          if (carModel == 5) carModelAPI = 4359;
          if (carModel == 6) carModelAPI = 4361;
          if (carModel == 7) carModelAPI = 4363;
          if (carModel == 8) carModelAPI = 4365;
          if (carModel == 9) carModelAPI = 4371;
          if (carModel == 10) carModelAPI = 4393;
          if (carModel == 11) carModelAPI = 4379;
          if (carModel == 12) carModelAPI = 4387;
          _selectedLocatioNdodge = newValue;
        }
        if (choice == 16) {
          car = 1135;
          if (carModel == 0) carModelAPI = 4485;
          if (carModel == 1) carModelAPI = 4483;
          if (carModel == 2) carModelAPI = 1406;
          if (carModel == 3) carModelAPI = 4481;
          if (carModel == 4) carModelAPI = 4479;
          if (carModel == 5) carModelAPI = 4477;
          if (carModel == 6) carModelAPI = 4475;
          if (carModel == 7) carModelAPI = 4473;
          if (carModel == 8) carModelAPI = 4471;
          if (carModel == 9) carModelAPI = 4469;
          if (carModel == 10) carModelAPI = 1412;
          if (carModel == 11) carModelAPI = 4467;
          if (carModel == 12) carModelAPI = 4465;
          if (carModel == 13) carModelAPI = 4463;
          if (carModel == 14) carModelAPI = 4461;
          if (carModel == 15) carModelAPI = 4459;
          if (carModel == 16) carModelAPI = 4455;
          if (carModel == 17) carModelAPI = 4453;
          if (carModel == 18) carModelAPI = 4449;
          if (carModel == 19) carModelAPI = 4443;
          if (carModel == 20) carModelAPI = 4445;
          if (carModel == 21) carModelAPI = 4439;
          if (carModel == 22) carModelAPI = 4433;
          if (carModel == 23) carModelAPI = 4425;
          if (carModel == 24) carModelAPI = 4431;
          if (carModel == 25) carModelAPI = 4429;
          if (carModel == 26) carModelAPI = 4427;
          _selectedLocatioNferrari = newValue;
        }
        if (choice == 17) {
          car = 1133;
          if (carModel == 0) carModelAPI = 1430;
          if (carModel == 1) carModelAPI = 1436;
          if (carModel == 2) carModelAPI = 4447;
          if (carModel == 3) carModelAPI = 4451;
          if (carModel == 4) carModelAPI = 4457;
          _selectedLocatioNfiat = newValue;
        }
        /* if (choice == 18) {
                _selectedLocatioNfisker = newValue;
              }*/
        if (choice == 18) {
          car = 957;
          if (carModel == 0) carModelAPI = 4545;
          if (carModel == 1) carModelAPI = 4547;
          if (carModel == 2) carModelAPI = 959;
          if (carModel == 3) carModelAPI = 961;
          if (carModel == 4) carModelAPI = 963;
          if (carModel == 5) carModelAPI = 4549;
          if (carModel == 6) carModelAPI = 4551;
          if (carModel == 7) carModelAPI = 4553;
          if (carModel == 8) carModelAPI = 4557;
          if (carModel == 9) carModelAPI = 4561;
          if (carModel == 10) carModelAPI = 4563;
          if (carModel == 11) carModelAPI = 4565;
          if (carModel == 12) carModelAPI = 4567;
          if (carModel == 13) carModelAPI = 4571;
          if (carModel == 14) carModelAPI = 4573;
          if (carModel == 15) carModelAPI = 4577;
          if (carModel == 16) carModelAPI = 4579;
          if (carModel == 17) carModelAPI = 4607;
          if (carModel == 18) carModelAPI = 4581;
          if (carModel == 19) carModelAPI = 4583;
          if (carModel == 20) carModelAPI = 4589;
          if (carModel == 21) carModelAPI = 4591;
          if (carModel == 22) carModelAPI = 4593;
          if (carModel == 23) carModelAPI = 4597;
          if (carModel == 24) carModelAPI = 4601;
          _selectedLocatioNford = newValue;
        }
        if (choice == 19) {
          car = 4525;
          if (carModel == 0) carModelAPI = 4559;
          if (carModel == 1) carModelAPI = 4543;
          _selectedLocatioNfoton = newValue;
        }
        if (choice == 20) {
          car = 4599;
          if (carModel == 0) carModelAPI = 4615;
          if (carModel == 1) carModelAPI = 4609;
          _selectedLocatioNgac = newValue;
        }
        if (choice == 21) {
          car = 1139;
          if (carModel == 0) carModelAPI = 1456;
          if (carModel == 1) carModelAPI = 4631;
          if (carModel == 2) carModelAPI = 4635;
          if (carModel == 3) carModelAPI = 4655;
          if (carModel == 4) carModelAPI = 1460;
          if (carModel == 5) carModelAPI = 4639;
          if (carModel == 6) carModelAPI = 4643;
          if (carModel == 7) carModelAPI = 4651;
          if (carModel == 8) carModelAPI = 4653;
          if (carModel == 9) carModelAPI = 4647;
          _selectedLocatioNgmc = newValue;
        }
        if (choice == 22) {
          car = 1137;
          if (carModel == 0) carModelAPI = 4633;
          if (carModel == 1) carModelAPI = 1476;
          if (carModel == 2) carModelAPI = 4641;
          if (carModel == 3) carModelAPI = 4649;
          _selectedLocatioNgeely = newValue;
        }
        if (choice == 23) {
          car = 4669;
          if (carModel == 0) carModelAPI = 4699;
          if (carModel == 1) carModelAPI = 4711;
          if (carModel == 2) carModelAPI = 4716;
          if (carModel == 3) carModelAPI = 4720;
          _selectedLocatioNgenesis = newValue;
        }
        /* if (choice == 24) {
                _selectedLocatioNgrandTiger = newValue;
              }*/
        /*if (choice == 24) {
                _selectedLocatioNgreatWall = newValue;
              }*/
        if (choice == 24) {
          car = 4724;
          if (carModel == 0) carModelAPI = 4738;
          if (carModel == 1) carModelAPI = 4742;
          _selectedLocatioNhaval = newValue;
        }
        if (choice == 25) {
          car = 1141;
          if (carModel == 0) carModelAPI = 1484;
          if (carModel == 1) carModelAPI = 4701;
          if (carModel == 2) carModelAPI = 4703;
          if (carModel == 3) carModelAPI = 1486;
          if (carModel == 4) carModelAPI = 4705;
          if (carModel == 5) carModelAPI = 4707;
          if (carModel == 6) carModelAPI = 4709;
          if (carModel == 7) carModelAPI = 4713;
          if (carModel == 8) carModelAPI = 4718;
          if (carModel == 9) carModelAPI = 4727;
          if (carModel == 10) carModelAPI = 4731;
          if (carModel == 11) carModelAPI = 4729;
          _selectedLocatioNhonda = newValue;
        }
        /* if (choice == 26) {
                car = 1047;
                _selectedLocatioNhongqi = newValue;
              }*/
        if (choice == 26) {
          car = 1145;
          if (carModel == 0) carModelAPI = 4786;
          if (carModel == 1) carModelAPI = 4782;
          if (carModel == 2) carModelAPI = 1159;
          _selectedLocatioNhummer = newValue;
        }
        if (choice == 27) {
          car = 956;
          if (carModel == 0) carModelAPI = 967;
          if (carModel == 1) carModelAPI = 4784;
          if (carModel == 2) carModelAPI = 969;
          if (carModel == 3) carModelAPI = 4788;
          if (carModel == 4) carModelAPI = 9083;
          if (carModel == 5) carModelAPI = 971;
          if (carModel == 6) carModelAPI = 4792;
          if (carModel == 7) carModelAPI = 4794;
          if (carModel == 8) carModelAPI = 4796;
          if (carModel == 9) carModelAPI = 4798;
          if (carModel == 10) carModelAPI = 4800;
          if (carModel == 11) carModelAPI = 4816;
          if (carModel == 12) carModelAPI = 4818;
          if (carModel == 13) carModelAPI = 4802;
          if (carModel == 14) carModelAPI = 4820;
          if (carModel == 15) carModelAPI = 4804;
          if (carModel == 16) carModelAPI = 4806;
          if (carModel == 17) carModelAPI = 4808;

          if (carModel == 18) carModelAPI = 4810;
          if (carModel == 19) carModelAPI = 4812;
          if (carModel == 20) carModelAPI = 4814;
          _selectedLocatioNhyundai = newValue;
        }
        if (choice == 28) {
          car = 1147;
          if (carModel == 0) carModelAPI = 4852;
          if (carModel == 1) carModelAPI = 4854;
          if (carModel == 2) carModelAPI = 1211;
          if (carModel == 3) carModelAPI = 1213;
          if (carModel == 4) carModelAPI = 4856;
          if (carModel == 5) carModelAPI = 1219;
          if (carModel == 6) carModelAPI = 4850;
          if (carModel == 7) carModelAPI = 4858;
          if (carModel == 8) carModelAPI = 4860;
          if (carModel == 9) carModelAPI = 4862;
          if (carModel == 10) carModelAPI = 4864;
          if (carModel == 11) carModelAPI = 4866;
          if (carModel == 12) carModelAPI = 4868;
          if (carModel == 13) carModelAPI = 4870;
          if (carModel == 14) carModelAPI = 4872;
          if (carModel == 15) carModelAPI = 4844;
          if (carModel == 16) carModelAPI = 4876;
          _selectedLocatioNinfiniti = newValue;
        }
        if (choice == 29) {
          car = 4884;
          if (carModel == 0) carModelAPI = 4892;
          if (carModel == 1) carModelAPI = 4890;
          _selectedLocatioNisuzu = newValue;
        }
        if (choice == 30) {
          car = 1149;
          if (carModel == 0) carModelAPI = 1254;
          if (carModel == 1) carModelAPI = 4896;
          _selectedLocatioNjAC = newValue;
        }
        if (choice == 31) {
          car = 1151;
          if (carModel == 0) carModelAPI = 4926;
          if (carModel == 1) carModelAPI = 4928;
          if (carModel == 2) carModelAPI = 4930;
          if (carModel == 3) carModelAPI = 4922;
          if (carModel == 4) carModelAPI = 4924;
          if (carModel == 5) carModelAPI = 1261;
          if (carModel == 6) carModelAPI = 1267;
          if (carModel == 7) carModelAPI = 1269;
          if (carModel == 8) carModelAPI = 4934;
          if (carModel == 9) carModelAPI = 4936;
          if (carModel == 10) carModelAPI = 4938;
          if (carModel == 11) carModelAPI = 4940;
          if (carModel == 12) carModelAPI = 4944;
          if (carModel == 13) carModelAPI = 4932;
          if (carModel == 14) carModelAPI = 4942;
          _selectedLocatioNjaguar = newValue;
        }
        if (choice == 32) {
          car = 1153;
          if (carModel == 0) carModelAPI = 1287;
          if (carModel == 1) carModelAPI = 1295;
          if (carModel == 2) carModelAPI = 1293;
          if (carModel == 3) carModelAPI = 4964;
          if (carModel == 4) carModelAPI = 4968;
          if (carModel == 5) carModelAPI = 4972;
          if (carModel == 6) carModelAPI = 4984;
          if (carModel == 7) carModelAPI = 4976;
          if (carModel == 8) carModelAPI = 4980;
          if (carModel == 9) carModelAPI = 4982;
          _selectedLocatioNjeep = newValue;
        }
        if (choice == 33) {
          car = 4962;
          if (carModel == 0) carModelAPI = 4970;
          if (carModel == 1) carModelAPI = 4978;
          _selectedLocatioNjetour = newValue;
        }
        if (choice == 34) {
          car = 1155;
          if (carModel == 0) carModelAPI = 1309;
          if (carModel == 1) carModelAPI = 5024;
          if (carModel == 2) carModelAPI = 1311;
          if (carModel == 3) carModelAPI = 5026;
          if (carModel == 4) carModelAPI = 5028;
          if (carModel == 5) carModelAPI = 5030;
          if (carModel == 6) carModelAPI = 5046;
          if (carModel == 7) carModelAPI = 5034;
          if (carModel == 8) carModelAPI = 5022;
          if (carModel == 9) carModelAPI = 5052;
          if (carModel == 10) carModelAPI = 5058;
          if (carModel == 11) carModelAPI = 5064;
          if (carModel == 12) carModelAPI = 5062;
          if (carModel == 13) carModelAPI = 5068;

          if (carModel == 14) carModelAPI = 5074;
          if (carModel == 15) carModelAPI = 5078;
          if (carModel == 16) carModelAPI = 5084;

          if (carModel == 17) carModelAPI = 5092;
          if (carModel == 18) carModelAPI = 5104;
          if (carModel == 19) carModelAPI = 5110;
          _selectedLocatioNkia = newValue;
        }
        /*if (choice == 36) {
                _selectedLocatioNkingLong = newValue;
              }*/
        if (choice == 35) {
          car = 5032;
          if (carModel == 0) carModelAPI = 5036;
          if (carModel == 1) carModelAPI = 5038;
          if (carModel == 2) carModelAPI = 5040;
          if (carModel == 3) carModelAPI = 5044;
          if (carModel == 4) carModelAPI = 5042;
          _selectedLocatioNlamborghini = newValue;
        }
        if (choice == 36) {
          car = 5184;
          if (carModel == 0) carModelAPI = 5082;
          _selectedLocatioNlancia = newValue;
        }

        ////////////////////
        if (choice == 37) {
          car = 973;
          if (carModel == 0) carModelAPI = 975;
          if (carModel == 1) carModelAPI = 977;
          if (carModel == 2) carModelAPI = 5102;
          if (carModel == 3) carModelAPI = 5106;
          if (carModel == 4) carModelAPI = 5108;
          if (carModel == 5) carModelAPI = 979;
          if (carModel == 6) carModelAPI = 5112;
          if (carModel == 7) carModelAPI = 5116;
          if (carModel == 8) carModelAPI = 5118;
          if (carModel == 9) carModelAPI = 5114;
          _selectedLocatioNlandRover = newValue;
        }
        if (choice == 38) {
          car = 1157;
          if (carModel == 0) carModelAPI = 1364;
          if (carModel == 1) carModelAPI = 1366;
          if (carModel == 2) carModelAPI = 1372;
          if (carModel == 3) carModelAPI = 5148;
          if (carModel == 4) carModelAPI = 5150;
          if (carModel == 5) carModelAPI = 5152;
          if (carModel == 6) carModelAPI = 5154;
          if (carModel == 7) carModelAPI = 5156;
          if (carModel == 8) carModelAPI = 5158;
          if (carModel == 9) carModelAPI = 5160;
          if (carModel == 10) carModelAPI = 5162;
          if (carModel == 11) carModelAPI = 5164;
          if (carModel == 12) carModelAPI = 5166;
          if (carModel == 13) carModelAPI = 5174;
          if (carModel == 14) carModelAPI = 5168;
          if (carModel == 15) carModelAPI = 5170;
          if (carModel == 16) carModelAPI = 5172;
          _selectedLocatioNlexus = newValue;
        }
        if (choice == 39) {
          car = 1159;
          if (carModel == 0) carModelAPI = 5218;
          if (carModel == 1) carModelAPI = 1396;
          if (carModel == 2) carModelAPI = 1398;
          if (carModel == 3) carModelAPI = 5240;
          if (carModel == 4) carModelAPI = 5246;
          if (carModel == 5) carModelAPI = 5252;
          if (carModel == 6) carModelAPI = 5262;
          if (carModel == 7) carModelAPI = 5256;
          if (carModel == 8) carModelAPI = 5266;
          if (carModel == 9) carModelAPI = 5238;
          _selectedLocatioNlincoln = newValue;
        }
        if (choice == 40) {
          car = 5206;
          if (carModel == 0) carModelAPI = 5196;
          if (carModel == 1) carModelAPI = 5200;
          _selectedLocatioNlotus = newValue;
        }
        if (choice == 41) {
          car = 5216;
          if (carModel == 0) carModelAPI = 5268;
          if (carModel == 1) carModelAPI = 5264;
          if (carModel == 2) carModelAPI = 5260;
          if (carModel == 3) carModelAPI = 5254;
          if (carModel == 4) carModelAPI = 5250;
          if (carModel == 5) carModelAPI = 5248;
          if (carModel == 6) carModelAPI = 5244;
          if (carModel == 7) carModelAPI = 5242;
          if (carModel == 8) carModelAPI = 5258;
          _selectedLocatioNmg = newValue;
        }
        if (choice == 42) {
          car = 1169;
          if (carModel == 0) carModelAPI = 1414;
          if (carModel == 1) carModelAPI = 1420;
          if (carModel == 2) carModelAPI = 5276;
          if (carModel == 3) carModelAPI = 5280;
          if (carModel == 4) carModelAPI = 5272;
          _selectedLocatioNmINI = newValue;
        }
        if (choice == 43) {
          car = 5284;
          if (carModel == 0) carModelAPI = 5288;
          _selectedLocatioNmahindra = newValue;
        }
        if (choice == 44) {
          car = 1161;
          if (carModel == 0) carModelAPI = 1438;
          if (carModel == 1) carModelAPI = 5294;
          if (carModel == 2) carModelAPI = 5298;
          if (carModel == 3) carModelAPI = 1444;
          if (carModel == 4) carModelAPI = 5307;
          if (carModel == 5) carModelAPI = 5303;
          _selectedLocatioNmaserati = newValue;
        }
        if (choice == 45) {
          car = 5311;
          if (carModel == 0) carModelAPI = 5322;
          if (carModel == 1) carModelAPI = 5324;
          if (carModel == 2) carModelAPI = 5326;
          if (carModel == 3) carModelAPI = 5328;
          _selectedLocatioNmaybach = newValue;
        }
        if (choice == 46) {
          car = 1163;
          if (carModel == 0) carModelAPI = 5345;
          if (carModel == 1) carModelAPI = 1448;
          if (carModel == 2) carModelAPI = 1450;
          if (carModel == 3) carModelAPI = 5347;
          if (carModel == 4) carModelAPI = 5349;
          if (carModel == 5) carModelAPI = 5351;
          if (carModel == 6) carModelAPI = 5353;
          if (carModel == 7) carModelAPI = 5357;
          if (carModel == 8) carModelAPI = 5355;
          _selectedLocatioNmazda = newValue;
        }
        if (choice == 47) {
          car = 1165;
          if (carModel == 0) carModelAPI = 1462;
          if (carModel == 1) carModelAPI = 5377;
          if (carModel == 2) carModelAPI = 5398;
          if (carModel == 3) carModelAPI = 5414;
          if (carModel == 4) carModelAPI = 5428;
          if (carModel == 5) carModelAPI = 5462;
          if (carModel == 6) carModelAPI = 5470;
          if (carModel == 7) carModelAPI = 5468;
          if (carModel == 8) carModelAPI = 5472;
          if (carModel == 9) carModelAPI = 5442;
          _selectedLocatioNmcLaren = newValue;
        }
        if (choice == 48) {
          car = 981;
          if (carModel == 0) carModelAPI = 5492;
          if (carModel == 1) carModelAPI = 5498;
          if (carModel == 2) carModelAPI = 5504;
          if (carModel == 3) carModelAPI = 983;
          if (carModel == 4) carModelAPI = 5508;
          if (carModel == 5) carModelAPI = 985;
          if (carModel == 6) carModelAPI = 987;
          if (carModel == 7) carModelAPI = 5512;
          if (carModel == 8) carModelAPI = 5518;
          if (carModel == 9) carModelAPI = 5524;

          if (carModel == 10) carModelAPI = 5528;
          if (carModel == 11) carModelAPI = 5534;
          if (carModel == 12) carModelAPI = 5538;
          if (carModel == 13) carModelAPI = 5544;
          if (carModel == 14) carModelAPI = 5550;
          if (carModel == 15) carModelAPI = 5554;

          if (carModel == 16) carModelAPI = 5560;
          if (carModel == 17) carModelAPI = 5564;
          if (carModel == 18) carModelAPI = 5568;

          if (carModel == 19) carModelAPI = 5576;
          if (carModel == 20) carModelAPI = 5580;

          if (carModel == 21) carModelAPI = 5584;
          if (carModel == 22) carModelAPI = 5586;
          if (carModel == 23) carModelAPI = 5582;

          if (carModel == 24) carModelAPI = 5578;
          if (carModel == 25) carModelAPI = 5574;
          if (carModel == 26) carModelAPI = 5572;

          if (carModel == 27) carModelAPI = 5570;
          if (carModel == 28) carModelAPI = 5566;

          if (carModel == 29) carModelAPI = 5562;

          if (carModel == 30) carModelAPI = 5558;
          if (carModel == 31) carModelAPI = 5556;
          if (carModel == 32) carModelAPI = 5552;
          if (carModel == 33) carModelAPI = 5548;
          if (carModel == 34) carModelAPI = 5546;
          if (carModel == 35) carModelAPI = 5542;
          if (carModel == 36) carModelAPI = 5494;

          if (carModel == 37) carModelAPI = 5540;
          if (carModel == 38) carModelAPI = 5536;
          if (carModel == 39) carModelAPI = 5532;
          if (carModel == 40) carModelAPI = 5530;

          if (carModel == 41) carModelAPI = 5526;
          if (carModel == 42) carModelAPI = 5522;
          if (carModel == 43) carModelAPI = 5520;
          if (carModel == 44) carModelAPI = 5516;
          if (carModel == 45) carModelAPI = 5588;
          if (carModel == 46) carModelAPI = 5510;
          if (carModel == 47) carModelAPI = 5506;
          if (carModel == 48) carModelAPI = 5502;
          if (carModel == 49) carModelAPI = 5500;
          if (carModel == 50) carModelAPI = 5496;
          _selectedLocatioNmercedesBenz = newValue;
        }
        if (choice == 49) {
          car = 1167;
          if (carModel == 0) carModelAPI = 5626;
          if (carModel == 1) carModelAPI = 5594;
          if (carModel == 2) carModelAPI = 1492;
          _selectedLocatioNmercury = newValue;
        }
        if (choice == 50) {
          car = 989;
          if (carModel == 0) carModelAPI = 991;
          if (carModel == 1) carModelAPI = 993;
          if (carModel == 2) carModelAPI = 995;
          if (carModel == 3) carModelAPI = 5740;
          if (carModel == 4) carModelAPI = 5732;
          if (carModel == 5) carModelAPI = 5728;
          if (carModel == 6) carModelAPI = 5722;
          if (carModel == 7) carModelAPI = 5712;
          if (carModel == 8) carModelAPI = 5698;
          if (carModel == 9) carModelAPI = 5688;
          if (carModel == 10) carModelAPI = 5680;
          if (carModel == 11) carModelAPI = 5660;
          if (carModel == 12) carModelAPI = 5650;
          if (carModel == 13) carModelAPI = 5644;
          if (carModel == 14) carModelAPI = 5640;
          if (carModel == 15) carModelAPI = 5634;
          if (carModel == 16) carModelAPI = 5632;
          if (carModel == 17) carModelAPI = 5630;
          if (carModel == 18) carModelAPI = 5672;
          _selectedLocatioNmitsubishi = newValue;
        }
        if (choice == 51) {
          car = 5638;
          if (carModel == 0) carModelAPI = 5646;
          if (carModel == 1) carModelAPI = 5666;
          _selectedLocatioNmorgan = newValue;
        }
        if (choice == 52) {
          car = 1173;
          if (carModel == 0) carModelAPI = 5724;
          if (carModel == 1) carModelAPI = 5730;
          if (carModel == 2) carModelAPI = 999;
          if (carModel == 3) carModelAPI = 1001;
          if (carModel == 4) carModelAPI = 1003;
          if (carModel == 5) carModelAPI = 5736;
          if (carModel == 6) carModelAPI = 5738;
          if (carModel == 7) carModelAPI = 5742;
          if (carModel == 8) carModelAPI = 5748;
          if (carModel == 9) carModelAPI = 5752;
          if (carModel == 10) carModelAPI = 5756;
          if (carModel == 11) carModelAPI = 5758;
          if (carModel == 12) carModelAPI = 5762;
          if (carModel == 13) carModelAPI = 5768;
          if (carModel == 14) carModelAPI = 5772;
          if (carModel == 15) carModelAPI = 5778;
          if (carModel == 16) carModelAPI = 5784;
          if (carModel == 17) carModelAPI = 5792;
          if (carModel == 18) carModelAPI = 5804;
          if (carModel == 19) carModelAPI = 5816;
          if (carModel == 20) carModelAPI = 5832;
          if (carModel == 21) carModelAPI = 5838;
          if (carModel == 22) carModelAPI = 5842;
          if (carModel == 23) carModelAPI = 5848;
          if (carModel == 24) carModelAPI = 5852;
          if (carModel == 25) carModelAPI = 5764;
          _selectedLocatioNnissan = newValue;
        }
        if (choice == 53) {
          car = 1171;
          if (carModel == 0) carModelAPI = 5726;
          if (carModel == 1) carModelAPI = 5734;
          if (carModel == 2) carModelAPI = 5744;
          if (carModel == 3) carModelAPI = 1203;
          if (carModel == 4) carModelAPI = 5720;
          if (carModel == 5) carModelAPI = 1205;
          if (carModel == 6) carModelAPI = 1199;
          _selectedLocatioNopel = newValue;
        }
        //////////////////////////////////////////
        if (choice == 54) {
          car = 1173;
          if (carModel == 0) carModelAPI = 6274;
          if (carModel == 1) carModelAPI = 1478;
          if (carModel == 2) carModelAPI = 6272;
          if (carModel == 3) carModelAPI = 6276;

          _selectedLocatioNothermake = newValue;
        }
        if (choice == 55) {
          car = 5754;
          if (carModel == 0) carModelAPI = 5760;
          _selectedLocatioNoullim = newValue;
        }
        if (choice == 56) {
          car = 1175;
          if (carModel == 0) carModelAPI = 1221;
          if (carModel == 1) carModelAPI = 1227;
          if (carModel == 2) carModelAPI = 5780;
          if (carModel == 3) carModelAPI = 1229;
          if (carModel == 4) carModelAPI = 5854;
          if (carModel == 5) carModelAPI = 5892;
          if (carModel == 6) carModelAPI = 5906;
          if (carModel == 7) carModelAPI = 5954;
          if (carModel == 8) carModelAPI = 5926;
          if (carModel == 9) carModelAPI = 5930;
          if (carModel == 10) carModelAPI = 5986;
          if (carModel == 11) carModelAPI = 5970;
          if (carModel == 12) carModelAPI = 5966;
          if (carModel == 13) carModelAPI = 5960;
          if (carModel == 14) carModelAPI = 5942;
          if (carModel == 15) carModelAPI = 5866;

          _selectedLocatioNpeugeot = newValue;
        }
        if (choice == 57) {
          car = 5776;
          if (carModel == 0) carModelAPI = 5782;

          _selectedLocatioNpontiac = newValue;
        }
        if (choice == 58) {
          car = 1005;
          if (carModel == 0) carModelAPI = 5846;
          if (carModel == 1) carModelAPI = 5844;
          if (carModel == 2) carModelAPI = 1007;
          if (carModel == 3) carModelAPI = 1011;
          if (carModel == 4) carModelAPI = 5840;
          if (carModel == 5) carModelAPI = 5836;
          if (carModel == 6) carModelAPI = 5826;
          if (carModel == 7) carModelAPI = 5820;
          if (carModel == 8) carModelAPI = 1009;

          _selectedLocatioNporsche = newValue;
        }
        if (choice == 59) {
          car = 5856;
          if (carModel == 0) carModelAPI = 5860;

          _selectedLocatioNproton = newValue;
        }

        if (choice == 60) {
          car = 1177;
          if (carModel == 0) carModelAPI = 9079;
          if (carModel == 1) carModelAPI = 5902;
          if (carModel == 2) carModelAPI = 5908;
          if (carModel == 3) carModelAPI = 1277;
          if (carModel == 4) carModelAPI = 1279;
          if (carModel == 5) carModelAPI = 5912;
          if (carModel == 6) carModelAPI = 5914;
          if (carModel == 7) carModelAPI = 5916;
          if (carModel == 8) carModelAPI = 5920;
          if (carModel == 9) carModelAPI = 5922;
          if (carModel == 10) carModelAPI = 5928;
          if (carModel == 11) carModelAPI = 5940;
          if (carModel == 12) carModelAPI = 5946;
          if (carModel == 13) carModelAPI = 5952;
          if (carModel == 14) carModelAPI = 5936;

          _selectedLocatioNrenault = newValue;
        }
        if (choice == 61) {
          car = 1179;
          if (carModel == 0) carModelAPI = 5924;
          if (carModel == 1) carModelAPI = 5918;
          if (carModel == 2) carModelAPI = 1301;
          if (carModel == 3) carModelAPI = 1303;
          if (carModel == 4) carModelAPI = 5904;
          if (carModel == 5) carModelAPI = 5900;
          if (carModel == 6) carModelAPI = 5910;

          _selectedLocatioNrollsRoyce = newValue;
        }
        if (choice == 62) {
          car = 5934;
          if (carModel == 0) carModelAPI = 5944;

          _selectedLocatioNrover = newValue;
        }
        if (choice == 63) {
          car = 5950;
          if (carModel == 0) carModelAPI = 5958;
          _selectedLocatioNseat = newValue;
        }
        if (choice == 64) {
          car = 1181;
          if (carModel == 0) carModelAPI = 5978;
          if (carModel == 1) carModelAPI = 5984;
          if (carModel == 2) carModelAPI = 1331;

          _selectedLocatioNskoda = newValue;
        }
        if (choice == 65) {
          car = 5968;
          if (carModel == 0) carModelAPI = 5974;

          _selectedLocatioNsmart = newValue;
        }
        if (choice == 66) {
          car = 5998;
          if (carModel == 0) carModelAPI = 5990;
          _selectedLocatioNsoueast = newValue;
        }
        if (choice == 67) {
          car = 5994;
          if (carModel == 0) carModelAPI = 5998;
          _selectedLocatioNssangYong = newValue;
        }
        if (choice == 68) {
          car = 1183;
          if (carModel == 0) carModelAPI = 6008;
          if (carModel == 1) carModelAPI = 1348;
          if (carModel == 2) carModelAPI = 9081;
          if (carModel == 3) carModelAPI = 1350;
          if (carModel == 4) carModelAPI = 6012;
          if (carModel == 5) carModelAPI = 1356;
          _selectedLocatioNsubaru = newValue;
        }
        if (choice == 69) {
          car = 1185;
          if (carModel == 0) carModelAPI = 6122;
          if (carModel == 1) carModelAPI = 6130;
          if (carModel == 2) carModelAPI = 1374;
          if (carModel == 3) carModelAPI = 6136;
          if (carModel == 4) carModelAPI = 6140;
          if (carModel == 5) carModelAPI = 1382;
          if (carModel == 6) carModelAPI = 6144;
          if (carModel == 7) carModelAPI = 6148;
          if (carModel == 8) carModelAPI = 6158;
          if (carModel == 9) carModelAPI = 6166;
          if (carModel == 10) carModelAPI = 1380;
          _selectedLocatioNsuzuki = newValue;
        }
        if (choice == 70) {
          car = 1187;
          if (carModel == 0) carModelAPI = 6010;
          if (carModel == 1) carModelAPI = 1404;
          _selectedLocatioNtata = newValue;
        }
        if (choice == 71) {
          car = 1189;
          if (carModel == 0) carModelAPI = 1422;
          if (carModel == 1) carModelAPI = 1428;
          if (carModel == 2) carModelAPI = 6016;

          _selectedLocatioNtesla = newValue;
        }
        if (choice == 72) {
          car = 927;
          if (carModel == 0) carModelAPI = 6258;
          if (carModel == 1) carModelAPI = 929;
          if (carModel == 2) carModelAPI = 6254;
          if (carModel == 3) carModelAPI = 6254;
          if (carModel == 4) carModelAPI = 933;
          if (carModel == 5) carModelAPI = 6250;
          if (carModel == 6) carModelAPI = 6244;
          if (carModel == 7) carModelAPI = 6242;
          if (carModel == 8) carModelAPI = 6238;
          if (carModel == 9) carModelAPI = 6236;
          if (carModel == 10) carModelAPI = 6228;
          if (carModel == 11) carModelAPI = 6222;
          if (carModel == 12) carModelAPI = 6216;
          if (carModel == 13) carModelAPI = 6212;
          if (carModel == 14) carModelAPI = 6210;
          if (carModel == 15) carModelAPI = 6208;
          if (carModel == 16) carModelAPI = 6206;
          if (carModel == 17) carModelAPI = 6200;
          if (carModel == 18) carModelAPI = 6198;
          if (carModel == 19) carModelAPI = 6194;
          if (carModel == 20) carModelAPI = 6192;
          if (carModel == 21) carModelAPI = 6019;
          if (carModel == 22) carModelAPI = 6184;
          if (carModel == 23) carModelAPI = 6180;
          if (carModel == 24) carModelAPI = 6176;
          if (carModel == 25) carModelAPI = 6172;
          if (carModel == 26) carModelAPI = 6170;
          if (carModel == 27) carModelAPI = 6164;
          if (carModel == 28) carModelAPI = 6160;
          if (carModel == 29) carModelAPI = 6154;
          if (carModel == 30) carModelAPI = 6152;
          if (carModel == 31) carModelAPI = 6146;
          if (carModel == 32) carModelAPI = 6202;
          _selectedLocatioNtoyota = newValue;
        }
        // if (choice == 75) {
        //   _selectedLocatioNuaz = newValue;
        //   }
        if (choice == 73) {
          car = 1013;
          if (carModel == 0) carModelAPI = 6138;
          if (carModel == 1) carModelAPI = 1015;
          if (carModel == 2) carModelAPI = 6142;
          if (carModel == 3) carModelAPI = 1017;
          if (carModel == 4) carModelAPI = 6150;
          if (carModel == 5) carModelAPI = 6156;
          if (carModel == 6) carModelAPI = 1019;
          if (carModel == 7) carModelAPI = 6162;
          if (carModel == 8) carModelAPI = 6168;
          if (carModel == 9) carModelAPI = 6174;
          if (carModel == 10) carModelAPI = 6178;
          if (carModel == 11) carModelAPI = 6182;
          if (carModel == 12) carModelAPI = 6188;
          if (carModel == 13) carModelAPI = 6169;
          if (carModel == 14) carModelAPI = 6260;
          if (carModel == 15) carModelAPI = 6204;
          if (carModel == 16) carModelAPI = 6214;
          if (carModel == 17) carModelAPI = 6266;
          if (carModel == 18) carModelAPI = 6248;
          if (carModel == 19) carModelAPI = 6232;
          _selectedLocatioNvolkswagen = newValue;
        }
        if (choice == 74) {
          car = 1191;
          if (carModel == 0) carModelAPI = 1470;
          if (carModel == 1) carModelAPI = 6230;
          if (carModel == 2) carModelAPI = 6234;
          if (carModel == 3) carModelAPI = 6240;
          if (carModel == 4) carModelAPI = 6246;
          if (carModel == 5) carModelAPI = 1468;
          _selectedLocatioNvolvo = newValue;
        }
      }
      /////////////////////////////////////////////////////
      if (translator.currentLanguage == 'en') {
        print("ok");
        if (choice == 0) {
          car = 1021;
          if (carModel == 0) carModelAPI = 3925;
          if (carModel == 1) carModelAPI = 3927;
          if (carModel == 2) carModelAPI = 3933;
          if (carModel == 3) carModelAPI = 3929;
          if (carModel == 4) carModelAPI = 3931;
          if (carModel == 5) carModelAPI = 3935;
          if (carModel == 6) carModelAPI = 3939;
          if (carModel == 7) carModelAPI = 3943;
          _selectedLocatioNalfaRomeo = newValue;
        }
        if (choice == 1) {
          car = 1023;
          if (carModel == 0) carModelAPI = 1105;
          if (carModel == 1) carModelAPI = 4013;
          if (carModel == 2) carModelAPI = 4017;
          if (carModel == 3) carModelAPI = 4027;
          if (carModel == 4) carModelAPI = 1107;
          if (carModel == 5) carModelAPI = 4019;
          if (carModel == 6) carModelAPI = 1109;
          if (carModel == 7) carModelAPI = 4023;
          if (carModel == 8) carModelAPI = 4025;
          _selectedLocatioNastonMartin = newValue;
        }
        if (choice == 2) {
          car = 827;
          if (carModel == 0) carModelAPI = 3899;
          if (carModel == 1) carModelAPI = 859;
          if (carModel == 2) carModelAPI = 861;
          if (carModel == 3) carModelAPI = 863;
          if (carModel == 4) carModelAPI = 3123;
          if (carModel == 5) carModelAPI = 3129;
          if (carModel == 6) carModelAPI = 3131;
          if (carModel == 7) carModelAPI = 3145;
          if (carModel == 8) carModelAPI = 3147;
          if (carModel == 9) carModelAPI = 3149;
          if (carModel == 10) carModelAPI = 3153;
          if (carModel == 11) carModelAPI = 3165;
          if (carModel == 12) carModelAPI = 3903;
          if (carModel == 13) carModelAPI = 3201;
          if (carModel == 14) carModelAPI = 3905;
          if (carModel == 15) carModelAPI = 3203;
          if (carModel == 16) carModelAPI = 3205;
          if (carModel == 17) carModelAPI = 3911;
          if (carModel == 18) carModelAPI = 3209;
          if (carModel == 19) carModelAPI = 3213;
          _selectedLocatioNaudi = newValue;
        }
        if (choice == 3) {
          car = 831;
          if (carModel == 0) carModelAPI = 869;
          if (carModel == 1) carModelAPI = 865;
          if (carModel == 2) carModelAPI = 3311;
          if (carModel == 3) carModelAPI = 3313;
          if (carModel == 4) carModelAPI = 3313;
          if (carModel == 5) carModelAPI = 3315;
          if (carModel == 6) carModelAPI = 3319;
          if (carModel == 7) carModelAPI = 3321;
          if (carModel == 8) carModelAPI = 3325;
          if (carModel == 9) carModelAPI = 3533;
          if (carModel == 10) carModelAPI = 3655;
          if (carModel == 11) carModelAPI = 3457;
          if (carModel == 12) carModelAPI = 3329;
          if (carModel == 13) carModelAPI = 3643;
          if (carModel == 14) carModelAPI = 3331;
          if (carModel == 15) carModelAPI = 3645;
          if (carModel == 16) carModelAPI = 3333;
          if (carModel == 17) carModelAPI = 3803;
          if (carModel == 18) carModelAPI = 3465;
          if (carModel == 19) carModelAPI = 3473;
          if (carModel == 20) carModelAPI = 3499;
          if (carModel == 21) carModelAPI = 3505;
          if (carModel == 22) carModelAPI = 3513;
          if (carModel == 23) carModelAPI = 3521;
          if (carModel == 24) carModelAPI = 3525;
          if (carModel == 25) carModelAPI = 3649;
          if (carModel == 26) carModelAPI = 3529;
          if (carModel == 27) carModelAPI = 3651;
          _selectedLocatioNbmw = newValue;
        }
        if (choice == 4) {
          car = 1025;
          if (carModel == 0) carModelAPI = 3827;
          if (carModel == 1) carModelAPI = 3855;
          if (carModel == 2) carModelAPI = 1233;
          if (carModel == 3) carModelAPI = 1239;
          if (carModel == 4) carModelAPI = 1241;
          if (carModel == 5) carModelAPI = 3545;
          if (carModel == 6) carModelAPI = 3537;
          if (carModel == 7) carModelAPI = 3541;
          if (carModel == 8) carModelAPI = 3895;
          _selectedLocatioNbentley = newValue;
        }
        if (choice == 5) {
          car = 3937;
          if (carModel == 0) carModelAPI = 3953;
          if (carModel == 1) carModelAPI = 3963;
          _selectedLocatioNborgward = newValue;
        }
        if (choice == 6) {
          car = 4005;
          if (carModel == 0) carModelAPI = 4021;
          _selectedLocatioNbrilliance = newValue;
        }
        if (choice == 7) {
          car = 4047;
          if (carModel == 0) carModelAPI = 4057;
          if (carModel == 1) carModelAPI = 4063;
          if (carModel == 2) carModelAPI = 4073;
          if (carModel == 3) carModelAPI = 4075;
          _selectedLocatioNbugatti = newValue;
        }
        if (choice == 8) {
          car = 4083;
          if (carModel == 0) carModelAPI = 4087;
          _selectedLocatioNcmc = newValue;
        }
        if (choice == 9) {
          car = 1027;
          if (carModel == 0) carModelAPI = 4113;
          if (carModel == 1) carModelAPI = 4117;
          if (carModel == 2) carModelAPI = 3551;
          if (carModel == 3) carModelAPI = 1255;
          if (carModel == 4) carModelAPI = 4119;
          if (carModel == 5) carModelAPI = 1257;
          if (carModel == 6) carModelAPI = 3567;
          if (carModel == 7) carModelAPI = 4129;
          if (carModel == 8) carModelAPI = 3571;
          if (carModel == 9) carModelAPI = 4121;
          if (carModel == 10) carModelAPI = 4123;
          if (carModel == 11) carModelAPI = 4125;
          if (carModel == 12) carModelAPI = 4127;
          if (carModel == 13) carModelAPI = 3613;
          _selectedLocatioNcadillac = newValue;
        }
        if (choice == 10) {
          car = 1029;
          if (carModel == 0) carModelAPI = 4105;
          if (carModel == 1) carModelAPI = 4107;
          if (carModel == 2) carModelAPI = 1283;
          if (carModel == 3) carModelAPI = 4111;
          if (carModel == 4) carModelAPI = 4115;
          _selectedLocatioNchangan = newValue;
        }
        if (choice == 11) {
          car = 833;
          if (carModel == 0) carModelAPI = 4169;
          if (carModel == 1) carModelAPI = 4171;
          if (carModel == 2) carModelAPI = 4173;
          if (carModel == 3) carModelAPI = 889;
          if (carModel == 4) carModelAPI = 4175;
          if (carModel == 5) carModelAPI = 891;
          if (carModel == 6) carModelAPI = 893;
          if (carModel == 7) carModelAPI = 4177;
          if (carModel == 8) carModelAPI = 4179;
          if (carModel == 9) carModelAPI = 4181;
          if (carModel == 10) carModelAPI = 4183;
          if (carModel == 11) carModelAPI = 4185;
          if (carModel == 12) carModelAPI = 4187;
          if (carModel == 13) carModelAPI = 4189;
          if (carModel == 14) carModelAPI = 4191;
          if (carModel == 15) carModelAPI = 4193;
          if (carModel == 16) carModelAPI = 4195;
          if (carModel == 17) carModelAPI = 4219;
          if (carModel == 18) carModelAPI = 4197;
          if (carModel == 19) carModelAPI = 4201;
          if (carModel == 20) carModelAPI = 4203;
          if (carModel == 21) carModelAPI = 4199;
          if (carModel == 22) carModelAPI = 4207;
          if (carModel == 23) carModelAPI = 4209;
          if (carModel == 24) carModelAPI = 4211;
          if (carModel == 25) carModelAPI = 4213;
          if (carModel == 26) carModelAPI = 4215;
          if (carModel == 27) carModelAPI = 4217;
          _selectedLocatioNchevrolet = newValue;
        }
        if (choice == 12) {
          car = 1031;
          if (carModel == 0) carModelAPI = 1338;
          if (carModel == 1) carModelAPI = 1344;
          if (carModel == 2) carModelAPI = 4281;
          if (carModel == 3) carModelAPI = 4273;
          if (carModel == 4) carModelAPI = 4275;
          if (carModel == 5) carModelAPI = 4271;
          if (carModel == 6) carModelAPI = 4277;
          if (carModel == 7) carModelAPI = 4279;
          _selectedLocatioNchrysler = newValue;
        }
        if (choice == 13) {
          car = 1033;
          if (carModel == 0) carModelAPI = 4297;
          if (carModel == 1) carModelAPI = 4301;
          if (carModel == 2) carModelAPI = 4303;
          if (carModel == 3) carModelAPI = 1360;
          _selectedLocatioNcitroen = newValue;
        }
        if (choice == 14) {
          car = 4315;
          if (carModel == 0) carModelAPI = 4333;
          if (carModel == 1) carModelAPI = 4337;
          if (carModel == 2) carModelAPI = 4323;
          _selectedLocatioNdaihatsu = newValue;
        }
        if (choice == 15) {
          car = 1035;
          if (carModel == 0) carModelAPI = 4319;
          if (carModel == 1) carModelAPI = 4321;
          if (carModel == 2) carModelAPI = 4325;
          if (carModel == 3) carModelAPI = 1386;
          if (carModel == 4) carModelAPI = 1392;
          if (carModel == 5) carModelAPI = 4327;
          if (carModel == 6) carModelAPI = 4329;
          if (carModel == 7) carModelAPI = 4331;
          if (carModel == 8) carModelAPI = 4335;
          if (carModel == 9) carModelAPI = 4339;
          if (carModel == 10) carModelAPI = 4347;
          if (carModel == 11) carModelAPI = 4343;
          if (carModel == 12) carModelAPI = 4345;
          _selectedLocatioNdodge = newValue;
        }
        if (choice == 16) {
          car = 1037;
          if (carModel == 0) carModelAPI = 4367;
          if (carModel == 1) carModelAPI = 4369;
          if (carModel == 2) carModelAPI = 1408;
          if (carModel == 3) carModelAPI = 4373;
          if (carModel == 4) carModelAPI = 4375;
          if (carModel == 5) carModelAPI = 4377;
          if (carModel == 6) carModelAPI = 4381;
          if (carModel == 7) carModelAPI = 4383;
          if (carModel == 8) carModelAPI = 4385;
          if (carModel == 9) carModelAPI = 4389;
          if (carModel == 10) carModelAPI = 1410;
          if (carModel == 11) carModelAPI = 4391;
          if (carModel == 12) carModelAPI = 4395;
          if (carModel == 13) carModelAPI = 4397;
          if (carModel == 14) carModelAPI = 4399;
          if (carModel == 15) carModelAPI = 4401;
          if (carModel == 16) carModelAPI = 4403;
          if (carModel == 17) carModelAPI = 4405;
          if (carModel == 18) carModelAPI = 4407;
          if (carModel == 19) carModelAPI = 4411;
          if (carModel == 20) carModelAPI = 4409;
          if (carModel == 21) carModelAPI = 4413;
          if (carModel == 22) carModelAPI = 4415;
          if (carModel == 23) carModelAPI = 4423;
          if (carModel == 24) carModelAPI = 4417;
          if (carModel == 25) carModelAPI = 4419;
          if (carModel == 26) carModelAPI = 4421;
          _selectedLocatioNferrari = newValue;
        }
        if (choice == 17) {
          car = 1039;
          if (carModel == 0) carModelAPI = 1432;
          if (carModel == 1) carModelAPI = 1434;
          if (carModel == 2) carModelAPI = 4435;
          if (carModel == 3) carModelAPI = 4437;
          if (carModel == 4) carModelAPI = 4441;
          _selectedLocatioNfiat = newValue;
        }
        /* if (choice == 18) {
                _selectedLocatioNfisker = newValue;
              }*/
        if (choice == 18) {
          car = 835;
          if (carModel == 0) carModelAPI = 4493;
          if (carModel == 1) carModelAPI = 4495;
          if (carModel == 2) carModelAPI = 907;
          if (carModel == 3) carModelAPI = 909;
          if (carModel == 4) carModelAPI = 911;
          if (carModel == 5) carModelAPI = 4497;
          if (carModel == 6) carModelAPI = 4499;
          if (carModel == 7) carModelAPI = 4501;
          if (carModel == 8) carModelAPI = 4503;
          if (carModel == 9) carModelAPI = 4505;
          if (carModel == 10) carModelAPI = 4507;
          if (carModel == 11) carModelAPI = 4509;
          if (carModel == 12) carModelAPI = 4511;
          if (carModel == 13) carModelAPI = 4513;
          if (carModel == 14) carModelAPI = 4515;
          if (carModel == 15) carModelAPI = 4519;
          if (carModel == 16) carModelAPI = 4521;
          if (carModel == 17) carModelAPI = 4541;
          if (carModel == 18) carModelAPI = 4523;
          if (carModel == 19) carModelAPI = 4527;
          if (carModel == 20) carModelAPI = 4529;
          if (carModel == 21) carModelAPI = 4531;
          if (carModel == 22) carModelAPI = 4533;
          if (carModel == 23) carModelAPI = 4535;
          if (carModel == 24) carModelAPI = 4537;
          _selectedLocatioNford = newValue;
        }
        if (choice == 19) {
          car = 4517;
          if (carModel == 0) carModelAPI = 4555;
          if (carModel == 1) carModelAPI = 4539;
          _selectedLocatioNfoton = newValue;
        }
        if (choice == 20) {
          car = 4595;
          if (carModel == 0) carModelAPI = 4603;
          if (carModel == 1) carModelAPI = 4605;
          _selectedLocatioNgac = newValue;
        }
        if (choice == 21) {
          car = 1041;
          if (carModel == 0) carModelAPI = 1454;
          if (carModel == 1) carModelAPI = 4611;
          if (carModel == 2) carModelAPI = 4613;
          if (carModel == 3) carModelAPI = 4627;
          if (carModel == 4) carModelAPI = 1458;
          if (carModel == 5) carModelAPI = 4619;
          if (carModel == 6) carModelAPI = 4617;
          if (carModel == 7) carModelAPI = 4623;
          if (carModel == 8) carModelAPI = 4625;
          if (carModel == 9) carModelAPI = 4621;
          _selectedLocatioNgmc = newValue;
        }
        if (choice == 22) {
          car = 1043;
          if (carModel == 0) carModelAPI = 4629;
          if (carModel == 1) carModelAPI = 1474;
          if (carModel == 2) carModelAPI = 4637;
          if (carModel == 3) carModelAPI = 4645;
          _selectedLocatioNgeely = newValue;
        }
        if (choice == 23) {
          car = 4665;
          if (carModel == 0) carModelAPI = 4691;
          if (carModel == 1) carModelAPI = 4683;
          if (carModel == 2) carModelAPI = 4687;
          if (carModel == 3) carModelAPI = 4681;
          _selectedLocatioNgenesis = newValue;
        }
        /* if (choice == 24) {
                _selectedLocatioNgrandTiger = newValue;
              }*/
        /*if (choice == 24) {
                _selectedLocatioNgreatWall = newValue;
              }*/
        if (choice == 24) {
          car = 4722;
          if (carModel == 0) carModelAPI = 4733;
          if (carModel == 1) carModelAPI = 4735;
          _selectedLocatioNhaval = newValue;
        }
        if (choice == 25) {
          car = 1045;
          if (carModel == 0) carModelAPI = 1482;
          if (carModel == 1) carModelAPI = 4671;
          if (carModel == 2) carModelAPI = 4673;
          if (carModel == 3) carModelAPI = 1488;
          if (carModel == 4) carModelAPI = 4675;
          if (carModel == 5) carModelAPI = 4677;
          if (carModel == 6) carModelAPI = 4679;
          if (carModel == 7) carModelAPI = 4685;
          if (carModel == 8) carModelAPI = 4689;
          if (carModel == 9) carModelAPI = 4693;
          if (carModel == 10) carModelAPI = 4697;
          if (carModel == 11) carModelAPI = 4695;
          _selectedLocatioNhonda = newValue;
        }
        /* if (choice == 26) {
                car = 1047;
                _selectedLocatioNhongqi = newValue;
              }*/
        if (choice == 26) {
          car = 1049;
          if (carModel == 0) carModelAPI = 4774;
          if (carModel == 1) carModelAPI = 4768;
          if (carModel == 2) carModelAPI = 1193;
          _selectedLocatioNhummer = newValue;
        }
        if (choice == 27) {
          car = 837;
          if (carModel == 0) carModelAPI = 871;
          if (carModel == 1) carModelAPI = 4740;
          if (carModel == 2) carModelAPI = 873;
          if (carModel == 3) carModelAPI = 4744;
          if (carModel == 4) carModelAPI = 4746;
          if (carModel == 5) carModelAPI = 875;
          if (carModel == 6) carModelAPI = 4748;
          if (carModel == 7) carModelAPI = 4750;
          if (carModel == 8) carModelAPI = 4752;
          if (carModel == 9) carModelAPI = 4754;
          if (carModel == 10) carModelAPI = 4756;
          if (carModel == 11) carModelAPI = 4776;
          if (carModel == 12) carModelAPI = 4778;
          if (carModel == 13) carModelAPI = 4758;
          if (carModel == 14) carModelAPI = 4780;
          if (carModel == 15) carModelAPI = 4760;
          if (carModel == 16) carModelAPI = 4762;
          if (carModel == 17) carModelAPI = 4764;

          if (carModel == 18) carModelAPI = 4766;
          if (carModel == 19) carModelAPI = 4770;
          if (carModel == 20) carModelAPI = 4772;
          _selectedLocatioNhyundai = newValue;
        }
        if (choice == 28) {
          car = 1051;
          if (carModel == 0) carModelAPI = 4822;
          if (carModel == 1) carModelAPI = 4824;
          if (carModel == 2) carModelAPI = 1209;
          if (carModel == 3) carModelAPI = 1215;
          if (carModel == 4) carModelAPI = 4826;
          if (carModel == 5) carModelAPI = 1217;
          if (carModel == 6) carModelAPI = 4848;
          if (carModel == 7) carModelAPI = 4828;
          if (carModel == 8) carModelAPI = 4830;
          if (carModel == 9) carModelAPI = 4832;
          if (carModel == 10) carModelAPI = 4834;
          if (carModel == 11) carModelAPI = 4836;
          if (carModel == 12) carModelAPI = 4838;
          if (carModel == 13) carModelAPI = 4840;
          if (carModel == 14) carModelAPI = 4842;
          if (carModel == 15) carModelAPI = 4880;
          if (carModel == 16) carModelAPI = 4846;
          _selectedLocatioNinfiniti = newValue;
        }
        if (choice == 29) {
          car = 4882;
          if (carModel == 0) carModelAPI = 4888;
          if (carModel == 1) carModelAPI = 4886;
          _selectedLocatioNisuzu = newValue;
        }
        if (choice == 30) {
          car = 1053;
          if (carModel == 0) carModelAPI = 1247;
          if (carModel == 1) carModelAPI = 4894;
          _selectedLocatioNjAC = newValue;
        }
        if (choice == 31) {
          car = 1055;
          if (carModel == 0) carModelAPI = 4898;
          if (carModel == 1) carModelAPI = 4900;
          if (carModel == 2) carModelAPI = 4902;
          if (carModel == 3) carModelAPI = 4920;
          if (carModel == 4) carModelAPI = 4904;
          if (carModel == 5) carModelAPI = 1263;
          if (carModel == 6) carModelAPI = 1265;
          if (carModel == 7) carModelAPI = 1271;
          if (carModel == 8) carModelAPI = 4908;
          if (carModel == 9) carModelAPI = 4910;
          if (carModel == 10) carModelAPI = 4912;
          if (carModel == 11) carModelAPI = 4914;
          if (carModel == 12) carModelAPI = 4918;
          if (carModel == 13) carModelAPI = 4906;
          if (carModel == 14) carModelAPI = 4916;
          _selectedLocatioNjaguar = newValue;
        }
        if (choice == 32) {
          car = 1057;
          if (carModel == 0) carModelAPI = 1289;
          if (carModel == 1) carModelAPI = 1297;
          if (carModel == 2) carModelAPI = 1291;

          if (carModel == 3) carModelAPI = 4946;
          if (carModel == 4) carModelAPI = 4948;
          if (carModel == 5) carModelAPI = 4950;

          if (carModel == 6) carModelAPI = 4958;
          if (carModel == 7) carModelAPI = 4952;
          if (carModel == 8) carModelAPI = 4954;
          if (carModel == 9) carModelAPI = 4956;
          _selectedLocatioNjeep = newValue;
        }
        if (choice == 33) {
          car = 4960;
          if (carModel == 0) carModelAPI = 4966;
          if (carModel == 1) carModelAPI = 4974;
          _selectedLocatioNjetour = newValue;
        }
        if (choice == 34) {
          car = 1059;
          if (carModel == 0) carModelAPI = 1307;
          if (carModel == 1) carModelAPI = 4986;
          if (carModel == 2) carModelAPI = 1313;
          if (carModel == 3) carModelAPI = 4988;
          if (carModel == 4) carModelAPI = 4990;
          if (carModel == 5) carModelAPI = 4992;
          if (carModel == 6) carModelAPI = 4994;
          if (carModel == 7) carModelAPI = 4996;
          if (carModel == 8) carModelAPI = 5020;
          if (carModel == 9) carModelAPI = 4998;
          if (carModel == 10) carModelAPI = 5000;
          if (carModel == 11) carModelAPI = 5002;
          if (carModel == 12) carModelAPI = 5004;
          if (carModel == 13) carModelAPI = 5006;

          if (carModel == 14) carModelAPI = 5008;
          if (carModel == 15) carModelAPI = 5010;
          if (carModel == 16) carModelAPI = 5012;

          if (carModel == 17) carModelAPI = 5014;
          if (carModel == 18) carModelAPI = 5016;
          if (carModel == 19) carModelAPI = 5018;
          _selectedLocatioNkia = newValue;
        }
        /*if (choice == 36) {
                _selectedLocatioNkingLong = newValue;
              }*/
        if (choice == 35) {
          car = 5032;
          if (carModel == 0) carModelAPI = 5036;
          if (carModel == 1) carModelAPI = 5038;
          if (carModel == 2) carModelAPI = 5040;
          if (carModel == 3) carModelAPI = 5044;
          if (carModel == 4) carModelAPI = 5042;
          _selectedLocatioNlamborghini = newValue;
        }
        if (choice == 36) {
          car = 5076;
          if (carModel == 0) carModelAPI = 5080;
          _selectedLocatioNlancia = newValue;
        }
        if (choice == 37) {
          car = 839;
          if (carModel == 0) carModelAPI = 883;
          if (carModel == 1) carModelAPI = 885;
          if (carModel == 2) carModelAPI = 5086;
          if (carModel == 3) carModelAPI = 5088;
          if (carModel == 4) carModelAPI = 5090;
          if (carModel == 5) carModelAPI = 887;
          if (carModel == 6) carModelAPI = 5094;
          if (carModel == 7) carModelAPI = 5098;
          if (carModel == 8) carModelAPI = 5100;
          if (carModel == 9) carModelAPI = 5096;
          _selectedLocatioNlandRover = newValue;
        }
        if (choice == 38) {
          car = 1061;
          if (carModel == 0) carModelAPI = 1362;
          if (carModel == 1) carModelAPI = 1368;
          if (carModel == 2) carModelAPI = 1370;
          if (carModel == 3) carModelAPI = 5120;
          if (carModel == 4) carModelAPI = 5122;
          if (carModel == 5) carModelAPI = 5124;
          if (carModel == 6) carModelAPI = 5126;
          if (carModel == 7) carModelAPI = 5128;
          if (carModel == 8) carModelAPI = 5130;
          if (carModel == 9) carModelAPI = 5132;
          if (carModel == 10) carModelAPI = 5134;
          if (carModel == 11) carModelAPI = 5136;
          if (carModel == 12) carModelAPI = 5138;
          if (carModel == 13) carModelAPI = 5146;
          if (carModel == 14) carModelAPI = 5140;
          if (carModel == 15) carModelAPI = 5142;
          if (carModel == 16) carModelAPI = 5144;
          _selectedLocatioNlexus = newValue;
        }
        if (choice == 39) {
          car = 1063;
          if (carModel == 0) carModelAPI = 5190;
          if (carModel == 1) carModelAPI = 1394;
          if (carModel == 2) carModelAPI = 1400;
          if (carModel == 3) carModelAPI = 5198;
          if (carModel == 4) carModelAPI = 5202;
          if (carModel == 5) carModelAPI = 5204;
          if (carModel == 6) carModelAPI = 5208;
          if (carModel == 7) carModelAPI = 5214;
          if (carModel == 8) carModelAPI = 5210;
          if (carModel == 9) carModelAPI = 5194;
          _selectedLocatioNlincoln = newValue;
        }
        if (choice == 40) {
          car = 5186;
          if (carModel == 0) carModelAPI = 5188;
          if (carModel == 1) carModelAPI = 5192;
          _selectedLocatioNlotus = newValue;
        }
        if (choice == 41) {
          car = 5212;
          if (carModel == 0) carModelAPI = 5220;
          if (carModel == 1) carModelAPI = 5222;
          if (carModel == 2) carModelAPI = 5224;
          if (carModel == 3) carModelAPI = 5228;
          if (carModel == 4) carModelAPI = 5230;
          if (carModel == 5) carModelAPI = 5232;
          if (carModel == 6) carModelAPI = 5234;
          if (carModel == 7) carModelAPI = 5236;
          if (carModel == 8) carModelAPI = 5226;
          _selectedLocatioNmg = newValue;
        }
        if (choice == 42) {
          car = 1065;
          if (carModel == 0) carModelAPI = 1416;
          if (carModel == 1) carModelAPI = 1418;
          if (carModel == 2) carModelAPI = 5274;
          if (carModel == 3) carModelAPI = 5278;
          if (carModel == 4) carModelAPI = 5270;
          _selectedLocatioNmINI = newValue;
        }
        if (choice == 43) {
          car = 5282;
          if (carModel == 0) carModelAPI = 5286;
          _selectedLocatioNmahindra = newValue;
        }
        if (choice == 44) {
          car = 1067;
          if (carModel == 0) carModelAPI = 1440;
          if (carModel == 1) carModelAPI = 5290;
          if (carModel == 2) carModelAPI = 5296;
          if (carModel == 3) carModelAPI = 1442;
          if (carModel == 4) carModelAPI = 5305;
          if (carModel == 5) carModelAPI = 5301;
          _selectedLocatioNmaserati = newValue;
        }
        if (choice == 45) {
          car = 5309;
          if (carModel == 0) carModelAPI = 5313;
          if (carModel == 1) carModelAPI = 5317;
          if (carModel == 2) carModelAPI = 5315;
          if (carModel == 3) carModelAPI = 5319;
          _selectedLocatioNmaybach = newValue;
        }
        if (choice == 46) {
          car = 1069;
          if (carModel == 0) carModelAPI = 5330;
          if (carModel == 1) carModelAPI = 1446;
          if (carModel == 2) carModelAPI = 1452;
          if (carModel == 3) carModelAPI = 5332;
          if (carModel == 4) carModelAPI = 5335;
          if (carModel == 5) carModelAPI = 5337;
          if (carModel == 6) carModelAPI = 5339;
          if (carModel == 7) carModelAPI = 5343;
          if (carModel == 8) carModelAPI = 5341;
          _selectedLocatioNmazda = newValue;
        }
        if (choice == 47) {
          car = 1071;
          if (carModel == 0) carModelAPI = 1464;
          if (carModel == 1) carModelAPI = 5359;
          if (carModel == 2) carModelAPI = 5361;
          if (carModel == 3) carModelAPI = 5363;
          if (carModel == 4) carModelAPI = 5365;
          if (carModel == 5) carModelAPI = 5369;
          if (carModel == 6) carModelAPI = 5371;
          if (carModel == 7) carModelAPI = 5373;
          if (carModel == 8) carModelAPI = 5375;
          if (carModel == 9) carModelAPI = 5367;
          _selectedLocatioNmcLaren = newValue;
        }
        if (choice == 48) {
          car = 841;
          if (carModel == 0) carModelAPI = 5380;
          if (carModel == 1) carModelAPI = 5382;
          if (carModel == 2) carModelAPI = 8384;
          if (carModel == 3) carModelAPI = 901;
          if (carModel == 4) carModelAPI = 5386;
          if (carModel == 5) carModelAPI = 903;
          if (carModel == 6) carModelAPI = 905;
          if (carModel == 7) carModelAPI = 5388;
          if (carModel == 8) carModelAPI = 5390;
          if (carModel == 9) carModelAPI = 5392;
          if (carModel == 10) carModelAPI = 5394;
          if (carModel == 11) carModelAPI = 5396;
          if (carModel == 12) carModelAPI = 5400;
          if (carModel == 13) carModelAPI = 5402;
          if (carModel == 14) carModelAPI = 5404;
          if (carModel == 15) carModelAPI = 5406;
          if (carModel == 16) carModelAPI = 5408;
          if (carModel == 17) carModelAPI = 5410;
          if (carModel == 18) carModelAPI = 5412;
          if (carModel == 19) carModelAPI = 5416;
          if (carModel == 20) carModelAPI = 5418;
          if (carModel == 21) carModelAPI = 5420;
          if (carModel == 22) carModelAPI = 5422;
          if (carModel == 23) carModelAPI = 5424;
          if (carModel == 24) carModelAPI = 5426;
          if (carModel == 25) carModelAPI = 5430;
          if (carModel == 26) carModelAPI = 5432;
          if (carModel == 27) carModelAPI = 5434;
          if (carModel == 28) carModelAPI = 5436;
          if (carModel == 29) carModelAPI = 5438;
          if (carModel == 30) carModelAPI = 5440;
          if (carModel == 31) carModelAPI = 5444;
          if (carModel == 32) carModelAPI = 5446;

          if (carModel == 33) carModelAPI = 5448;
          if (carModel == 34) carModelAPI = 5450;

          if (carModel == 35) carModelAPI = 5452;
          if (carModel == 36) carModelAPI = 5490;
          if (carModel == 37) carModelAPI = 5454;
          if (carModel == 38) carModelAPI = 5456;
          if (carModel == 39) carModelAPI = 5458;
          if (carModel == 40) carModelAPI = 5460;
          if (carModel == 41) carModelAPI = 5464;
          if (carModel == 42) carModelAPI = 5466;
          if (carModel == 43) carModelAPI = 5474;
          if (carModel == 44) carModelAPI = 5476;
          if (carModel == 45) carModelAPI = 5478;
          if (carModel == 46) carModelAPI = 5480;
          if (carModel == 47) carModelAPI = 5482;

          if (carModel == 48) carModelAPI = 5484;
          if (carModel == 49) carModelAPI = 5486;
          if (carModel == 50) carModelAPI = 5488;
          _selectedLocatioNmercedesBenz = newValue;
        }
        if (choice == 49) {
          car = 1167;
          if (carModel == 0) carModelAPI = 5590;
          if (carModel == 1) carModelAPI = 5592;
          if (carModel == 2) carModelAPI = 1490;
          _selectedLocatioNmercury = newValue;
        }
        if (choice == 50) {
          car = 843;
          if (carModel == 0) carModelAPI = 913;
          if (carModel == 1) carModelAPI = 915;
          if (carModel == 2) carModelAPI = 917;
          if (carModel == 3) carModelAPI = 5596;
          if (carModel == 4) carModelAPI = 5598;
          if (carModel == 5) carModelAPI = 5600;
          if (carModel == 6) carModelAPI = 5602;
          if (carModel == 7) carModelAPI = 5604;
          if (carModel == 8) carModelAPI = 5606;
          if (carModel == 9) carModelAPI = 5608;
          if (carModel == 10) carModelAPI = 5610;
          if (carModel == 11) carModelAPI = 5614;
          if (carModel == 12) carModelAPI = 5616;
          if (carModel == 13) carModelAPI = 5618;
          if (carModel == 14) carModelAPI = 5620;
          if (carModel == 15) carModelAPI = 5622;
          if (carModel == 16) carModelAPI = 5624;
          if (carModel == 17) carModelAPI = 5628;
          if (carModel == 18) carModelAPI = 5612;
          _selectedLocatioNmitsubishi = newValue;
        }
        if (choice == 51) {
          car = 5636;
          if (carModel == 0) carModelAPI = 5642;
          if (carModel == 1) carModelAPI = 5656;
          _selectedLocatioNmorgan = newValue;
        }
        if (choice == 52) {
          car = 845;
          if (carModel == 0) carModelAPI = 5648;
          if (carModel == 1) carModelAPI = 5652;
          if (carModel == 2) carModelAPI = 877;
          if (carModel == 3) carModelAPI = 879;
          if (carModel == 4) carModelAPI = 881;
          if (carModel == 5) carModelAPI = 5654;
          if (carModel == 6) carModelAPI = 5658;
          if (carModel == 7) carModelAPI = 5662;
          if (carModel == 8) carModelAPI = 5664;
          if (carModel == 9) carModelAPI = 5668;
          if (carModel == 10) carModelAPI = 5670;
          if (carModel == 11) carModelAPI = 5674;
          if (carModel == 12) carModelAPI = 5676;
          if (carModel == 13) carModelAPI = 5682;
          if (carModel == 14) carModelAPI = 5684;
          if (carModel == 15) carModelAPI = 5686;
          if (carModel == 16) carModelAPI = 5690;
          if (carModel == 17) carModelAPI = 5694;
          if (carModel == 18) carModelAPI = 5700;

          if (carModel == 19) carModelAPI = 5706;
          if (carModel == 20) carModelAPI = 5708;
          if (carModel == 21) carModelAPI = 5710;
          if (carModel == 22) carModelAPI = 5714;
          if (carModel == 23) carModelAPI = 5716;
          if (carModel == 24) carModelAPI = 5718;
          if (carModel == 25) carModelAPI = 5678;
          _selectedLocatioNnissan = newValue;
        }
        if (choice == 53) {
          car = 1075;
          if (carModel == 0) carModelAPI = 5692;
          if (carModel == 1) carModelAPI = 5696;
          if (carModel == 2) carModelAPI = 5702;
          if (carModel == 3) carModelAPI = 1201;
          if (carModel == 4) carModelAPI = 5704;
          if (carModel == 5) carModelAPI = 1207;
          if (carModel == 6) carModelAPI = 1197;
          _selectedLocatioNopel = newValue;
        }
        //////////////////////////////////////////
        if (choice == 54) {
          car = 1095;
          if (carModel == 0) carModelAPI = 6268;
          if (carModel == 1) carModelAPI = 1480;
          if (carModel == 2) carModelAPI = 6270;
          if (carModel == 3) carModelAPI = 6264;

          _selectedLocatioNothermake = newValue;
        }
        if (choice == 55) {
          car = 5746;
          if (carModel == 0) carModelAPI = 5750;

          _selectedLocatioNoullim = newValue;
        }
        if (choice == 56) {
          car = 1077;
          if (carModel == 0) carModelAPI = 1223;
          if (carModel == 1) carModelAPI = 1225;
          if (carModel == 2) carModelAPI = 5774;
          if (carModel == 3) carModelAPI = 1231;
          if (carModel == 4) carModelAPI = 5790;
          if (carModel == 5) carModelAPI = 5794;
          if (carModel == 6) carModelAPI = 5800;
          if (carModel == 7) carModelAPI = 5808;
          if (carModel == 8) carModelAPI = 5812;
          if (carModel == 9) carModelAPI = 5818;
          if (carModel == 10) carModelAPI = 5822;
          if (carModel == 11) carModelAPI = 5824;
          if (carModel == 12) carModelAPI = 5828;
          if (carModel == 13) carModelAPI = 5830;
          if (carModel == 14) carModelAPI = 5834;
          if (carModel == 15) carModelAPI = 5788;

          _selectedLocatioNpeugeot = newValue;
        }
        if (choice == 57) {
          car = 5766;
          if (carModel == 0) carModelAPI = 5770;

          _selectedLocatioNpontiac = newValue;
        }
        if (choice == 58) {
          car = 847;
          if (carModel == 0) carModelAPI = 5796;
          if (carModel == 1) carModelAPI = 5798;
          if (carModel == 2) carModelAPI = 895;
          if (carModel == 3) carModelAPI = 899;
          if (carModel == 4) carModelAPI = 5802;
          if (carModel == 5) carModelAPI = 5806;
          if (carModel == 6) carModelAPI = 5810;
          if (carModel == 7) carModelAPI = 5814;
          if (carModel == 8) carModelAPI = 897;

          _selectedLocatioNporsche = newValue;
        }
        if (choice == 59) {
          car = 5850;
          if (carModel == 0) carModelAPI = 5858;

          _selectedLocatioNproton = newValue;
        }

        if (choice == 60) {
          car = 1079;
          if (carModel == 0) carModelAPI = 1273;
          if (carModel == 1) carModelAPI = 5862;
          if (carModel == 2) carModelAPI = 5864;
          if (carModel == 3) carModelAPI = 1275;
          if (carModel == 4) carModelAPI = 1281;
          if (carModel == 5) carModelAPI = 5868;
          if (carModel == 6) carModelAPI = 5870;
          if (carModel == 7) carModelAPI = 5872;
          if (carModel == 8) carModelAPI = 5874;
          if (carModel == 9) carModelAPI = 5876;
          if (carModel == 10) carModelAPI = 5880;
          if (carModel == 11) carModelAPI = 5886;
          if (carModel == 12) carModelAPI = 5890;
          if (carModel == 13) carModelAPI = 5898;
          if (carModel == 14) carModelAPI = 5882;

          _selectedLocatioNrenault = newValue;
        }
        if (choice == 61) {
          car = 1081;
          if (carModel == 0) carModelAPI = 5878;
          if (carModel == 1) carModelAPI = 5884;
          if (carModel == 2) carModelAPI = 1299;
          if (carModel == 3) carModelAPI = 1305;
          if (carModel == 4) carModelAPI = 5894;
          if (carModel == 5) carModelAPI = 5896;
          if (carModel == 6) carModelAPI = 5888;

          _selectedLocatioNrollsRoyce = newValue;
        }
        if (choice == 62) {
          car = 5932;
          if (carModel == 0) carModelAPI = 5938;

          _selectedLocatioNrover = newValue;
        }
        if (choice == 63) {
          car = 5948;
          if (carModel == 0) carModelAPI = 5956;
          _selectedLocatioNseat = newValue;
        }
        if (choice == 64) {
          car = 1083;
          if (carModel == 0) carModelAPI = 5972;
          if (carModel == 1) carModelAPI = 5976;
          if (carModel == 2) carModelAPI = 1329;

          _selectedLocatioNskoda = newValue;
        }
        if (choice == 65) {
          car = 5962;
          if (carModel == 0) carModelAPI = 5964;

          _selectedLocatioNsmart = newValue;
        }
        if (choice == 66) {
          car = 5980;
          if (carModel == 0) carModelAPI = 5982;
          _selectedLocatioNsoueast = newValue;
        }
        if (choice == 67) {
          car = 5992;
          if (carModel == 0) carModelAPI = 5996;
          _selectedLocatioNssangYong = newValue;
        }
        if (choice == 68) {
          car = 1085;
          if (carModel == 0) carModelAPI = 6000;
          if (carModel == 1) carModelAPI = 1346;
          if (carModel == 2) carModelAPI = 6004;
          if (carModel == 3) carModelAPI = 1352;
          if (carModel == 4) carModelAPI = 6002;
          if (carModel == 5) carModelAPI = 1354;
          _selectedLocatioNsubaru = newValue;
        }
        if (choice == 69) {
          car = 1087;
          if (carModel == 0) carModelAPI = 6080;
          if (carModel == 1) carModelAPI = 6086;
          if (carModel == 2) carModelAPI = 1376;
          if (carModel == 3) carModelAPI = 6094;
          if (carModel == 4) carModelAPI = 6096;
          if (carModel == 5) carModelAPI = 1384;
          if (carModel == 6) carModelAPI = 6098;
          if (carModel == 7) carModelAPI = 6102;
          if (carModel == 8) carModelAPI = 6104;
          if (carModel == 9) carModelAPI = 6110;
          if (carModel == 10) carModelAPI = 1378;
          _selectedLocatioNsuzuki = newValue;
        }
        if (choice == 70) {
          car = 1089;
          if (carModel == 0) carModelAPI = 6006;
          if (carModel == 1) carModelAPI = 1402;
          _selectedLocatioNtata = newValue;
        }
        if (choice == 71) {
          car = 1091;
          if (carModel == 0) carModelAPI = 1424;
          if (carModel == 1) carModelAPI = 1426;
          if (carModel == 2) carModelAPI = 6014;

          _selectedLocatioNtesla = newValue;
        }
        if (choice == 72) {
          car = 849;
          if (carModel == 0) carModelAPI = 6020;
          if (carModel == 1) carModelAPI = 853;
          if (carModel == 2) carModelAPI = 6022;
          if (carModel == 3) carModelAPI = 855;
          if (carModel == 4) carModelAPI = 857;
          if (carModel == 5) carModelAPI = 6024;
          if (carModel == 6) carModelAPI = 6026;
          if (carModel == 7) carModelAPI = 6030;
          if (carModel == 8) carModelAPI = 6032;
          if (carModel == 9) carModelAPI = 6034;
          if (carModel == 10) carModelAPI = 6036;
          if (carModel == 11) carModelAPI = 6038;
          if (carModel == 12) carModelAPI = 6040;
          if (carModel == 13) carModelAPI = 6042;
          if (carModel == 14) carModelAPI = 6044;
          if (carModel == 15) carModelAPI = 6048;
          if (carModel == 16) carModelAPI = 6050;
          if (carModel == 17) carModelAPI = 6054;
          if (carModel == 18) carModelAPI = 6056;
          if (carModel == 19) carModelAPI = 6058;
          if (carModel == 20) carModelAPI = 6060;
          if (carModel == 21) carModelAPI = 6062;
          if (carModel == 22) carModelAPI = 6064;
          if (carModel == 23) carModelAPI = 6066;
          if (carModel == 24) carModelAPI = 6068;
          if (carModel == 25) carModelAPI = 6070;
          if (carModel == 26) carModelAPI = 6072;
          if (carModel == 27) carModelAPI = 6074;
          if (carModel == 28) carModelAPI = 6076;
          if (carModel == 29) carModelAPI = 6078;
          if (carModel == 30) carModelAPI = 6084;
          if (carModel == 31) carModelAPI = 6090;
          if (carModel == 32) carModelAPI = 6052;
          _selectedLocatioNtoyota = newValue;
        }
        // if (choice == 75) {
        //   _selectedLocatioNuaz = newValue;
        //   }
        if (choice == 73) {
          car = 851;
          if (carModel == 0) carModelAPI = 6046;
          if (carModel == 1) carModelAPI = 919;
          if (carModel == 2) carModelAPI = 6082;
          if (carModel == 3) carModelAPI = 921;
          if (carModel == 4) carModelAPI = 6088;
          if (carModel == 5) carModelAPI = 6092;
          if (carModel == 6) carModelAPI = 923;
          if (carModel == 7) carModelAPI = 6100;
          if (carModel == 8) carModelAPI = 6106;
          if (carModel == 9) carModelAPI = 6108;
          if (carModel == 10) carModelAPI = 6112;
          if (carModel == 11) carModelAPI = 6114;
          if (carModel == 12) carModelAPI = 6116;
          if (carModel == 13) carModelAPI = 6118;
          if (carModel == 14) carModelAPI = 6120;
          if (carModel == 15) carModelAPI = 6124;
          if (carModel == 16) carModelAPI = 6126;
          if (carModel == 17) carModelAPI = 6128;
          if (carModel == 18) carModelAPI = 6134;
          if (carModel == 19) carModelAPI = 6132;
          _selectedLocatioNvolkswagen = newValue;
        }
        if (choice == 74) {
          car = 1093;
          if (carModel == 0) carModelAPI = 1472;
          if (carModel == 1) carModelAPI = 6128;
          if (carModel == 2) carModelAPI = 6220;
          if (carModel == 3) carModelAPI = 6224;
          if (carModel == 4) carModelAPI = 6226;
          if (carModel == 5) carModelAPI = 1466;
          _selectedLocatioNvolvo = newValue;
        }
      }
      Navigator.push(
        context,
        // ignore: missing_return
        MaterialPageRoute(builder: (context) {
          return UsedCarForSale(
            choice : 1 , 
              title: "Used Cars Section",
              carModelAPI: carModelAPI);
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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        if (widget.choice == false)
          Text("${translator.translate("Now_choose_the_right")}",
              style: new TextStyle(
                  fontSize: 5.w,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800])),
        if (widget.choice == false)
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        if (widget.choice == false)
          Text("${translator.translate("category_for_your_ad")}",
              style: new TextStyle(
                  fontSize: 5.w,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800])),
        if (widget.choice == true)
          Text("${translator.translate("choose_the_category2")}",
              style: new TextStyle(fontSize: 5.w, color: Colors.grey[800])),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Row(
          children: [
            Text(
                "... > ${translator.translate('${widget.section}')} > ${translator.translate('${widget.innersection}')} > ${translator.translate('${widget.carModel}')}  ",
                style: new TextStyle(fontSize: 3.5.w, color: Colors.grey[800])),
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
            itemCount: carModels.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              onTap: () {
                setState(() {});
                gotoScreen(
                    widget.index, index, 2, widget.carModel, carModels[index]);
                // if (index == 1) gotoScreen(1);
                //   if (index == 5) gotoScreen(5);
                //   if (index == )
                /* if (index == 0) gotoScreen(0);
                    if (index == 1) gotoScreen(1);
                    if (index == 2) gotoScreen(2);
                    if (index == 3) gotoScreen(3);
                    if (index == 4) gotoScreen(4);
                    if (index == 5) gotoScreen(5);*/
              },
              title: Text(carModels[index], style: TextStyle(fontSize: 5.w)),
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

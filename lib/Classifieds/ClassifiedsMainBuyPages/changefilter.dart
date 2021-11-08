import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ChangeFilter extends StatelessWidget {
  static List<String> usage, age, condition, warranty;
  Map<String, bool> materialList;

  @override
  Widget build(BuildContext context) {
    warranty = [
      "all",
      "Yes",
      "No",
      "Does not Apply",
    ];
    /* usage = [
      translator.translate("all"),
      translator.translate("Never Used"),
      translator.translate("Used Once or less"),
      translator.translate("Light Usage or less"),
      translator.translate("Normal Usage or less"),
      translator.translate("Heavy Usage or less"),
    ];*/
    condition = [
      "All",
      "Perfect inside and out",
      "Almost no noticeable problems or flaws",
      "A bit of wear and tear, but in good working condition",
      "Normal wear and tear for the age of the item, a few problems here and there",
      "Above avearge wear and tear.The item may need a bit of repair to work properly",
    ];
    usage = [
      "All",
      "Still in original packaging",
      "Out of original packaging but only used once",
      "Used only a few times",
      "Used an average amount as frequently as would be expected",
      "Used an above average amount since purchased",
    ];
    /* condition = [
      translator.translate("all"),
      translator.translate("Flawless"),
      translator.translate("Excellent or better"),
      translator.translate("Good or better"),
      translator.translate("Average or better"),
      translator.translate("Poor or better"),
    ];*/
    age = [
      "all",
      'Brand New',
      '0-1 month',
      '1-6 month',
      '6-12 month',
      '1-2 years',
      '2-5 years',
      '5-10 years',
      '10+ years',
    ];
    materialList = {
      'Amber': false,
      'Beads': false,
      'Bronze': false,
      'Ceramic': false,
      'Crystal': false,
      'CZ': false,
      'Diamond': false,
      'Gemstone': false,
      'Leather': false,
      'Plastic': false,
      'Platinum': false,
      'Rhinestones': false,
      'Rubber': false,
      'Semi Precious/Birth Stones': false,
      'Shell, Bone, Coral': false,
      'Silver': false,
      'Steel': false,
      'Titanium': false,
      'White Gold': false,
      'Wood': false,
      'Yellow Gold': false,
      'Other Material': false,
      'Other Metal': false,
    };

    print("age${age.elementAt(1)}");

    return Container();
  }
}

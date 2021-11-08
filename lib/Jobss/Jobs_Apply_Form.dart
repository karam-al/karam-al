import "package:flutter/material.dart";

class JobsInputForm extends StatefulWidget {
  @override
  _JobsInputFormState createState() => _JobsInputFormState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _JobsInputFormState extends State<JobsInputForm>
    with AutomaticKeepAliveClientMixin {
  String _email = ' ', _name = ' ', _postName = ' ', _location = ' ';
  List<String> gender = ['Male', 'Female'];
  List<String> nationality = ['Test1', 'Test2'];
  String _selectedLocationGender;
  String _selectedLocationnationality;
  int choice, choice2;

  Widget _buildName(BuildContext context, double x, String text, int choice) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: x,
        height: MediaQuery.of(context).size.height * 0.125,
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              isDense: true,
              errorStyle: TextStyle(fontSize: 11.0),
              labelText: text,
              enabledBorder: new OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: new BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black, width: 1.0))),
          style: new TextStyle(color: Colors.black),
          // ignore: missing_return
          validator: (String value) {
            if (choice == 3) {
              if (value.isEmpty) {
                return 'Email is Required';
              }

              if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
                return 'Please enter a valid email Address';
              }
            }

            if (choice == 1) {
              if (value.isEmpty) {
                return 'Post Name is Required';
              }
            }

            if (choice == 2) {
              if (value.isEmpty) {
                return 'Name is Required';
              }
            }

            if (choice == 5) {
              if (value.isEmpty) {
                return 'Your location is Required';
              }
            }
          },
          onSaved: (String value) {
            if (choice == 1) {
              _postName = value;
            }
            if (choice == 2) {
              _name = value;
            }
            if (choice == 3) {
              _email = value;
            }
            if (choice == 5) {
              _location = value;
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apply For This Job",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          new TextEditingController().clear();
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(18),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildName(context, MediaQuery.of(context).size.width,
                        "Post Name", 1),
                    _buildName(
                        context, MediaQuery.of(context).size.width, "Name", 2),
                    _buildName(
                        context, MediaQuery.of(context).size.width, "Email", 3),
                    _buildName(context, MediaQuery.of(context).size.width,
                        "Date Of Birth", 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey,
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              contentPadding:
                                  EdgeInsets.fromLTRB(15, 30, 15, 0),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                              )),
                          items: gender.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                          // ignore: missing_return
                          validator: (String value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please select a Gender';
                            }
                          },
                          hint: Text("\tGender"), // Not necessary for Option 1
                          value: _selectedLocationGender,
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedLocationGender = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 25, 10, 0),
                              isDense: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                              )),
                          items: nationality.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                          // ignore: missing_return
                          validator: (String value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please select a Nationality';
                            }
                          },
                          hint:
                              Text("Nationality"), // Not necessary for Option 1
                          value: _selectedLocationnationality,
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedLocationnationality = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    _buildName(context, MediaQuery.of(context).size.width,
                        "Location", 5),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text("Next"),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print("_name$_name");
                          print("_email$_email");
                          print("_postName$_postName");
                          print("_location$_location");
                          FocusScope.of(context).unfocus();
                          new TextEditingController().clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NextStepJobApply();
                              },
                            ),
                          );
                        })
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class NextStepJobApply extends StatefulWidget {
  @override
  _NextStepJobApplyState createState() => _NextStepJobApplyState();
}

class _NextStepJobApplyState extends State<NextStepJobApply> {
  Widget _test(String s, List<String> ss, String sss, String selected,
      String validText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 25, 10, 0),
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            )),
        items: ss.map((location) {
          return DropdownMenuItem(
            child: new Text(location),
            value: location,
          );
        }).toList(),
        // ignore: missing_return
        validator: (String value) {
          if (value?.isEmpty ?? true) {
            return validText;
          }
        },
        hint: Text(sss), // Not necessary for Option 1
        value: selected,
        onChanged: (String newValue) {
          setState(() {
            selected = newValue;
          });
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedLocationEducation;
  String selectedLocationLevel;
  String selectedLocationBackground;
  String selectedLocationPosition;
  String selectedLocationExpectations;
  String selectedLocationcommitmentLevel;
  String selectedLocationnoticePeriod;
  String selectedLocationVisaStatus;

  List<String> education = [
    'N / A',
    'High-School',
    'Bachelors Degree',
    'Masters Degree',
    'phD'
  ];
  List<String> careerLevel = ['First Choice', 'Second Choice', 'Third Choice'];
  List<String> background = ['0 - 1 Years', '1 - 2 Years', '2 - 3 Years'];
  List<String> position = ['First Choice', 'Second Choice', 'Third Choice'];
  List<String> expectations = [
    'Unspecified',
    '0 - 1,999',
    '2,000 - 3,999',
    '4,000 - 5,999'
  ];
  List<String> commitmentLevel = [
    'Full Time',
    'Part Time',
    'Contract',
    'Temporary',
    'Other'
  ];
  List<String> noticePeriod = ['none', '1 Week', '2 Week', '3 Week'];
  List<String> visaStatus = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Apply For This Job",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white10,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(18),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      _test(
                          "Education",
                          education,
                          "Education",
                          selectedLocationEducation,
                          "Please Select an Education"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "Career Level",
                          careerLevel,
                          "Career Level",
                          selectedLocationLevel,
                          "Please Select a Career Level"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "Background",
                          background,
                          "Background",
                          selectedLocationBackground,
                          "Please Select a Background"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test("Position", position, "Position",
                          selectedLocationPosition, "Please Select a Position"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "Salary Expectations",
                          expectations,
                          "Salary Expectations",
                          selectedLocationExpectations,
                          "Please Select a Salary Expectations"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "commitment level",
                          commitmentLevel,
                          "commitment level",
                          selectedLocationcommitmentLevel,
                          "Please Select a commitment level"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "notice period",
                          noticePeriod,
                          "notice period",
                          selectedLocationnoticePeriod,
                          "Please Select a notice period"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      _test(
                          "Visa Status",
                          visaStatus,
                          "Visa Status",
                          selectedLocationVisaStatus,
                          "Please Select a Visa Status"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text("Apply"),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            FocusScope.of(context).unfocus();
                            new TextEditingController().clear();
                            /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NextStepJobApply();
                              },
                            ),
                          );*/
                          })
                    ])))));
  }
}

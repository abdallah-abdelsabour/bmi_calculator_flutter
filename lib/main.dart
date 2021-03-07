import 'package:bmi_calculator_flutter/result_page.dart';
import 'package:bmi_calculator_flutter/reusableCard.dart';
import 'package:bmi_calculator_flutter/user_info.dart';
import 'package:flutter/material.dart';
import 'consts.dart';
import 'genderCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int personHeight = 120;

  int weight = 60;
  int age = 15;

  Gender selectedGeder = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGeder = Gender.male;
                    });
                  },
                  child: ResusableCard(
                    onpress: () {
                      setState(() {
                        selectedGeder = Gender.male;
                      });
                    },
                    cardColor: selectedGeder == Gender.male
                        ? activeColor
                        : notActiveColor,
                    cardChild: GenderCard(
                      kindName: "MALE",
                      textStyle: lableTextStyle,
                      genderIcon: maleIcon,
                    ),
                  ),
                )),
                Expanded(
                    child: ResusableCard(
                  onpress: () {
                    setState(() {
                      selectedGeder = Gender.femal;
                    });
                  },
                  cardChild: GenderCard(
                    textStyle: lableTextStyle,
                    kindName: "FEMALE",
                    genderIcon: femalIcon,
                  ),
                  cardColor: selectedGeder == Gender.femal
                      ? activeColor
                      : notActiveColor,
                )),
              ],
            ),
          ),
          Expanded(
              child: ResusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: lableTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      personHeight.toString(),
                      style: numberStyle,
                    ),
                    Text("cm"),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(thumbColor: Colors.red),
                  child: Slider(
                      value: personHeight.toDouble(),
                      min: 100.00,
                      max: 220.00,
                      activeColor: Color(0xffFEFEFE),
                      onChanged: (double changedValue) {
                        setState(() {
                          personHeight = changedValue.round();
                        });
                      }),
                )
              ],
            ),
            cardColor: Color(0xff1D1F33),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    
                    child: ResusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: lableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DegreeButton(
                                icnshape: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              DegreeButton(
                                icnshape: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      cardColor: activeColor,
                    )),
                Expanded(
                    child: ResusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: lableTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DegreeButton(
                            icnshape: FontAwesomeIcons.plus,
                            onpress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          DegreeButton(
                            icnshape: FontAwesomeIcons.minus,
                            onpress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  cardColor: activeColor,
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
            final  user =UserInfo(height:personHeight,weight: weight );
               final  String bmie =user.calculateBMI();
              final String theResult = user.getResult();
              
              final  String interpreatione = user.getInterpretation();

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(bmi: bmie,result: theResult,interpreation: interpreatione)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEC4556),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child: Center(
                  child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              )),
              width: double.infinity,
              height: 60,
              
            ),
          ),
        ],
      ),
    );
  }
}

class DegreeButton extends StatelessWidget {
  final Function onpress;
  final IconData icnshape;

  DegreeButton({
    this.onpress,
    this.icnshape,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      child: Icon(icnshape),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xff222747),
      shape: CircleBorder(),
    );
  }
}

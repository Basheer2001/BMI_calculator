import 'package:bmi_calculater/Screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/buttom_button.dart';
import '../components/icon-content.dart';
import '../components/reusable_card.dart';
import '../components/roundiconbutton.dart';
import '../constants.dart';
import 'dart:math';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  late double bmi;
  double getBmi(){
    return bmi= weight / pow(height/100,2);
  }

  // void updateCardColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColor == inactiveColor) {
  //       maleCardColor = activeColor;
  //       femaleCardColor = inactiveColor;
  //
  //     } else {
  //       maleCardColor = inactiveColor;
  //     }
  //
  //   } else {
  //     if (femaleCardColor == inactiveColor) {
  //       femaleCardColor = activeColor;
  //       maleCardColor = inactiveColor;
  //
  //     } else {
  //       femaleCardColor = inactiveColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecontainer(
                      onPressed: () {
                        //print('kmn');

                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      )),
                ),
                Expanded(
                  child: Reusablecontainer(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: iconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecontainer(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HIGHT',
                          style: kLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLableTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTickMarkColor: const Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29EB1555),
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),
                          ),


                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 120.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusablecontainer(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WIEGHT',style: kLableTextStyle,),
                        Text(weight.toString(),style: kNumberTextStyle,),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon : FontAwesomeIcons.plus,
                              function: (){
                                setState(() {
                                  weight++;
                                });
                              },

                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon : FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            // FloatingActionButton(
                            //     onPressed: (){}
                            // ),
                          ],
                        ),

                      ],
                    ),
                    onPressed: (){},
                  ),
                ),
                Expanded(
                  child: Reusablecontainer(
                    colour: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLableTextStyle,),
                        Text(age.toString(),style: kNumberTextStyle,),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(

                              icon : FontAwesomeIcons.plus,
                              function: (){
                                setState(() {
                                  age++;
                                });
                              },

                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon : FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            // FloatingActionButton(
                            //     onPressed: (){}
                            // ),
                          ],
                        ),

                      ],
                    ),
                    onPressed: (){},

                  ),
                ),
              ],
            ),
          ),
          BottumBotton(buttonTitle: 'Calculate',
            onTap: (){
              setState(() {
                getBmi();
              });
              Navigator.push(context,MaterialPageRoute (
                builder: (context) =>  ResultPage(height,weight,age,bmi),
              ),
              );
            },),
        ],
      ),
    );
  }
}



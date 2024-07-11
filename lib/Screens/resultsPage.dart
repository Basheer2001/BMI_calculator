import 'package:flutter/material.dart';
import '../components/buttom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.height, this.weight, this.age,this.bmi);

  int height;
  int weight;
  int age;
  double bmi;
  String getState(){
    if(bmi<18.5)
      return 'underweight';
    if(bmi>25)
      return 'overweight';
    return 'normal';
  }
  String getInfo(){
    if(bmi<18) {
      return 'You are too skinny, you need to eat more.';
    }
    if(bmi>40) {
      return 'You are over the normal pace, you need to take care of your health';
    }
    return 'Great! you are fit and have a good health, keep the good work going.';
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculater'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(

            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecontainer(
              onPressed: (){},
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly
                ,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(getState(),style: kResultTextStyle,),
                  Text(bmi.toStringAsFixed(1),style: kBMITextStyle,),
                  Text(getInfo(),style: kBodyTextStyle,
                    textAlign: TextAlign.center,),
                ],
              ),
            ),

          ),
          BottumBotton(buttonTitle: 'Recalculate', onTap: (
              ){
            Navigator.pop(context);
          }
          )

        ],
      ),

    );
  }

}

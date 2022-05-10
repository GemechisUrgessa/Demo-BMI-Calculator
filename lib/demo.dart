import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/logic_model.dart';

class DemoBmi extends StatelessWidget {
  const DemoBmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 44, 78),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
        ),
      ),
      body: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Consumer<LogicModel>(
      builder: (context, logicModel, child) {
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 11),
                  child: Consumer<LogicModel>(
                    builder: (context, logicModel, child) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: logicModel.color1,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          width: 160,
                          height: 110,
                          child: Column(
                            children: const <Widget>[
                              Icon(
                                Icons.female,
                                size: 80,
                              ),
                              Text("FEMALE"),
                            ],
                          ),
                        ),
                        onTap: () {
                          logicModel.setGenderFemale();
                          logicModel.setColor1();
                        },
                        onDoubleTap: () {
                          logicModel.setGenderNone();
                          logicModel.reSetColor1();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 11),
                  child: Consumer<LogicModel>(
                    builder: (context, logicModel, child) {
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: logicModel.color2,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          width: 160,
                          height: 110,
                          child: Column(
                            children: const <Widget>[
                              Icon(Icons.male, size: 80),
                              Text("MALE"),
                            ],
                          ),
                        ),
                        onTap: () {
                          logicModel.setGenderMale();
                          logicModel.setColor2();
                        },
                        onDoubleTap: () {
                          logicModel.setGenderNone();
                          logicModel.reSetColor2();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<LogicModel>(
              builder: (context, logicModel, child) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 10, 10, 10),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  height: 130,
                  width: 300.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text('${logicModel.height}',
                              style: const TextStyle(fontSize: 50.0)),
                          const Text(
                            'CM',
                          )
                        ],
                      ),
                      Slider(
                        value: logicModel.height.toDouble(),
                        max: 200,
                        min: 1,
                        divisions: 200,
                        onChanged: (value) {
                          logicModel.scaleIncrement(value);
                        },
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Padding(
                Consumer<LogicModel>(
                  builder: (context, logicModel, child) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 20, 20, 20),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      width: 160,
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("AGE"),
                          Text('${logicModel.age}',
                              style: const TextStyle(fontSize: 50)),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RawMaterialButton(
                                  onPressed: () {
                                    logicModel.ageDecrement();
                                  },
                                  child: const Icon(Icons
                                      .do_not_disturb_on_total_silence_rounded),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: const CircleBorder(),
                                  elevation: 6.0,
                                  fillColor: const Color(0XFF4C4F5E),
                                ),
                                RawMaterialButton(
                                  onPressed: () {
                                    logicModel.ageIncrement();
                                  },
                                  child: const Icon(Icons.add),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: const CircleBorder(),
                                  elevation: 6.0,
                                  fillColor: const Color(0XFF4C4F5E),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Consumer<LogicModel>(
                  builder: (context, logicModel, child) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 24, 23),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      width: 160,
                      height: 150,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          const Text("WEIGHT"),
                          Text('${logicModel.weight}',
                              style: const TextStyle(fontSize: 50)),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RawMaterialButton(
                                  onPressed: () {
                                    logicModel.weightDecrement();
                                  },
                                  child: const Icon(Icons
                                      .do_not_disturb_on_total_silence_rounded),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: const CircleBorder(),
                                  elevation: 6.0,
                                  fillColor: const Color(0XFF4C4F5E),
                                ),
                                RawMaterialButton(
                                  onPressed: () {
                                    logicModel.weightIncrement();
                                  },
                                  child: const Icon(Icons.add),
                                  constraints: const BoxConstraints.tightFor(
                                    width: 56.0,
                                    height: 56.0,
                                  ),
                                  shape: const CircleBorder(),
                                  elevation: 6.0,
                                  fillColor: const Color(0XFF4C4F5E),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Container(
                child: const Center(
                  child: Text(
                    'CALCULATE BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: double.infinity,
              ),
              onTap: () {
                //
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        height: logicModel.height,
                        weight: logicModel.weight,
                        age: logicModel.age,
                        gender: logicModel.gender,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender})
      : super(key: key);
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  int _iBM() {
    return (weight ~/ ((height / 100) * (height / 100)));
  }

  String _mSG() {
    if (_iBM() >= 20 && _iBM() <= 38) {
      return 'U are in healthy state';
    } else {
      return 'U are not in healthy state';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 4, 4),
        title: const Center(
          child: Text("Your BMI is.."),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 49, 57, 63),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          width: double.infinity,
          height: 100,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Your BMI is: ${_iBM()}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Text(
                  "Hey ${gender == Gender.male ? 'Mr' : gender == Gender.female ? 'Mis' : ''} ${_mSG()} "),
            ],
          ),
        ),
      ),
    );
  }
}

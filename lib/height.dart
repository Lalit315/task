import 'package:assignment1/weight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class Height extends StatefulWidget {
  String? gender;
  Height({this.gender, super.key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  double _value = 145;
  bool _cm = false;
  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      double delta = details.delta.dy / 2;
      _value = (_value - delta).clamp(145, 190);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Weight()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Color(0xff522ED2), fontSize: 14),
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xff455B64),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 5,
                  width: 80,
                  color: const Color(0xff522ED2),
                ),
                Container(
                  height: 5,
                  width: 80,
                  color: const Color(0xff522ED2),
                ),
                Container(
                  height: 5,
                  width: 80,
                  color: const Color(0xff522ED2),
                ),
                Container(
                  height: 5,
                  width: 80,
                  color: const Color(0xffF1F4F8),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("What's your height",
                  style: TextStyle(
                      color: Color(0xff4E4866),
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Help us to create your personalize plan",
                  style: TextStyle(color: Color(0xff626C72), fontSize: 12)),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _cm = !_cm;
              });
            },
            child: _cm == true
                ? Container(
                    height: 50,
                    width: 178,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xff522ED2)),
                    child: const Center(
                      child: Text(
                        "Cm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Container(
                    height: 50,
                    width: 178,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffF1F4F8)),
                    child: const Center(
                      child: Text(
                        "Cm",
                        style: TextStyle(color: Color(0xff979797)),
                      ),
                    ),
                  ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              "assets/Group.png",
              scale: 4,
            ),
            GestureDetector(
              onVerticalDragUpdate: _onDragUpdate,
              child: SizedBox(
                width: 100,
                height: 400,
                child: SfLinearGauge(
                  orientation: LinearGaugeOrientation.vertical,
                  minimum: 145,
                  maximum: 190,
                  interval: 5,
                  showTicks: true,
                  showLabels: true,
                  ranges: <LinearGaugeRange>[
                    LinearGaugeRange(
                      startValue: 145,
                      endValue: _value,
                      color: Colors.blue,
                    ),
                  ],
                  markerPointers: <LinearMarkerPointer>[
                    LinearShapePointer(
                      value: _value,
                      color: Colors.red,
                      height: 20,
                      width: 20,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 4, color: const Color(0xff522ED2)),
                    shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Weight(
                                  gender: widget.gender,
                                  Cm: "CM",
                                  height: _value,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff6C4DDA), Color(0xff522ED2)],
                          begin: Alignment.center,
                          end: Alignment.center,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

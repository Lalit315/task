import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Weight extends StatefulWidget {
  String? gender;
  String? Cm;
  double? height;
  Weight({this.gender, this.Cm, this.height, super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  bool _iskg = false;
  bool _islbs = false;
  double _pointerValue = 90;
  String? weight;
  Future<void> sendData() async {
    // Replace with your API endpoint
    const url = 'http://157.15.202.189:7002/patient/patient_info?patientId=73';

    // Sample data
    final data = {
      "gender": widget.gender,
      "height": widget.height,
      "heightType": widget.Cm,
      "weight": _pointerValue,
      "weightType": weight.toString()
    };

    // Token (replace with your actual token)
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVbWVzaCIsInJvbGVJZCI6MiwiZXhwIjoxNzU0NDU1MDY5LCJpYXQiOjE3MjI5MTkwNjl9.WwBZtiNMQAeerkqkQL2MQjNVyfAEn7gE8CzzU0XpCIE';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(data);
        print(response.body);
        final snackBar = SnackBar(
          content: Text('${response.body}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Success
      } else {
        // Error
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _updateNeedleValue(Offset position) {
    // Calculate the value based on the position of the drag
    double angle = (position.dy - (MediaQuery.of(context).size.height / 2)) /
            (MediaQuery.of(context).size.height / 2) *
            40 +
        90;

    // Clamp the value between 80 and 120
    angle = angle.clamp(80, 120);
    setState(() {
      _pointerValue = angle; // Update the pointer value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  color: const Color(0xff522ED2),
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
              Text("What's your Weight",
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
          Container(
            height: 50,
            width: 356,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffF1F4F8)),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _iskg = !_iskg;
                        _islbs = false;
                        weight = "KG";
                      });
                    },
                    child: _iskg == true
                        ? Container(
                            height: 50,
                            width: 178,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xff522ED2)),
                            child: const Center(
                              child: Text(
                                "Kg",
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
                                "Kg",
                                style: TextStyle(color: Color(0xff979797)),
                              ),
                            ),
                          )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _islbs = !_islbs;
                        _iskg = false;
                        weight = "LBS";
                      });
                    },
                    child: _islbs == true
                        ? Container(
                            height: 50,
                            width: 178,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xff522ED2)),
                            child: const Center(
                              child: Text(
                                "LBS",
                                style: TextStyle(color: Color(0xff979797)),
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
                                "LBS",
                                style: TextStyle(color: Color(0xff979797)),
                              ),
                            ),
                          )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          GestureDetector(
            onPanUpdate: (details) {
              _updateNeedleValue(details.localPosition);
            },
            child: Center(
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minorTicksPerInterval: 5,
                    minorTickStyle:
                        const MinorTickStyle(thickness: 1.5, length: 8),
                    showTicks: true,
                    majorTickStyle: const MajorTickStyle(
                        color: Color(0xff522ED2), length: 12),
                    showAxisLine: false,
                    // isInversed: true, // Set to true to reverse the gauge
                    minimum: 80, // Minimum value
                    maximum: 120, // Maximum value0
                    startAngle: 180, // Start angle
                    endAngle: 0, // End angle
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        needleColor: const Color(0xff522ED2),
                        needleStartWidth: 1,
                        needleEndWidth: 17,
                        value: _pointerValue,
                        enableAnimation: true,
                        knobStyle: const KnobStyle(
                          knobRadius: 0.1,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: Color(0xff522ED2),
                        ),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _pointerValue.toStringAsFixed(0),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff522ED2)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Kg',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4E4866)),
                            ), // Display the weight value without decimal places
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                    onAxisTapped: (double value) {
                      setState(() {
                        _pointerValue = value; // Update pointer value on tap
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
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
                    print("hello");
                    sendData();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => Weight()));
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

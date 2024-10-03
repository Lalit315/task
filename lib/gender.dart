import 'package:assignment1/height.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  bool _ismale = false;
  bool _isfemale = false;
  bool _isothers = false;
  String? _selectedOption = "option1";
  String? gender;
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
                    context, MaterialPageRoute(builder: (_) => Height()));
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
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
                    color: const Color(0xffF1F4F8),
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
                Text("Select your Gender",
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
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _isfemale == true
                              ? Radio<String>(
                                  value: "option1",
                                  groupValue: _selectedOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption = value;
                                    });
                                  },
                                )
                              : Container(
                                  height: 5,
                                ),
                          _ismale == true
                              ? Radio<String>(
                                  value: "option1",
                                  groupValue: _selectedOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption = value;
                                    });
                                  },
                                )
                              : Container(
                                  height: 5,
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/Group 1.png",
                    scale: 4,
                  ),
                  Image.asset(
                    "assets/Group 2.png",
                    scale: 4,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: _isothers == true
                          ? Border.all(color: Colors.green)
                          : Border.all(color: const Color(0xffe9e9e9)),
                      borderRadius: BorderRadius.circular(5)),
                  height: 59,
                  width: 159,
                  child: const Center(
                    child: Text(
                      "Others",
                      style: TextStyle(color: Color(0xff4E4866), fontSize: 14),
                    ),
                  ),
                ),
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
                          _isfemale = !_isfemale;
                          _ismale = false;
                          _isothers = false;
                          gender = "Female";
                        });
                      },
                      child: _isfemale == true
                          ? Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff522ED2)),
                              child: const Center(
                                child: Text(
                                  "Female",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffF1F4F8)),
                              child: const Center(
                                child: Text(
                                  "Female",
                                  style: TextStyle(color: Color(0xff979797)),
                                ),
                              ),
                            )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _ismale = !_ismale;
                          _isfemale = false;
                          _isothers = false;
                          gender = "Male";
                        });
                      },
                      child: _ismale == true
                          ? Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff522ED2)),
                              child: const Center(
                                child: Text(
                                  "male",
                                  style: TextStyle(color: Color(0xff979797)),
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffF1F4F8)),
                              child: const Center(
                                child: Text(
                                  "male",
                                  style: TextStyle(color: Color(0xff979797)),
                                ),
                              ),
                            )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isothers = !_isothers;
                          _isfemale = false;
                          _ismale = false;
                          gender = "Others";
                        });
                      },
                      child: _isothers == true
                          ? Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff522ED2)),
                              child: const Center(
                                child: Text(
                                  "Others",
                                  style: TextStyle(color: Color(0xff979797)),
                                ),
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 118,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffF1F4F8)),
                              child: const Center(
                                child: Text(
                                  "Others",
                                  style: TextStyle(color: Color(0xff979797)),
                                ),
                              ),
                            ))
                ],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  Height(gender: gender.toString())));
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
      ),
    );
  }
}

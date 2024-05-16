import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:prototype/main.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});
  final int maxDigits = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(
                top: 70.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset('images/upm-logo.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: const Text(
                      'Welcome !',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Card(
                        color: Colors.white,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 40.0, left: 20.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                          child: Text(
                                                            'Enter the activation code you received via SMS . ',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                            right: 20.0,
                                                          ),
                                                          child: const Icon(
                                                            Icons.info_outlined,
                                                            color: Colors.black,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 30.0),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 23.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: constraints.maxWidth *
                                                      0.75,
                                                  height:
                                                      constraints.maxHeight *
                                                          0.3,
                                                  child: TextField(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 25.0,
                                                              horizontal: 15.0),
                                                      hintText: 'OTP',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      alignLabelWithHint: true,
                                                      hintStyle:
                                                          const TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    maxLength: maxDigits,
                                                    onChanged: (value) {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Didn't receive? ",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const AccountActivationPage(),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                "Tap here",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        const MyHomePage(),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.grey[100]),
                                              child: const Text(
                                                'Activate',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: const Text(
                            'Disclaimer | Privacy Statement',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        const Text(
                          'Copyright UPM & Kejuruteraan Minyak Sawit\nCSS Sdn. Bhd.',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

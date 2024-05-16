import 'package:flutter/material.dart';
import 'package:prototype/home_page.dart';
import 'otp_confirmation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AccountActivationPage(),
      routes: {
        '/profile': (context) => const MyHomePage()
      },
    );
  }
}

class AccountActivationPage extends StatefulWidget {
  const AccountActivationPage({Key? key}) : super(key: key);

  @override
  State<AccountActivationPage> createState() => _AccountActivationPageState();
}

class _AccountActivationPageState extends State<AccountActivationPage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * 0.45,
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
                      color: Colors.red[100],
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 20.0),
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
                                                      'Enter your mobile number to activate your account. ',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 20.0),
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
                                    margin: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/malaysia-flag.png',
                                            width: 35,
                                            height: 35,
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            '+60',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: 50,
                                            child: TextField(
                                              key: const Key(
                                                  'phone_number_input_field'),
                                              keyboardType: TextInputType.phone,
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                              ),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0,
                                                        horizontal: 15.0),
                                                hintText: null,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Colors.black),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          value: isChecked ?? false,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                          fillColor: MaterialStateProperty.all(
                                              Colors.blue),
                                        ),
                                        const Text(
                                          'I agree to the terms & conditions',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 15.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ConfirmationPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Get Activation Code',
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, bottom: 10.0),
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
    );
  }
}

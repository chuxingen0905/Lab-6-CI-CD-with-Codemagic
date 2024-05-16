import 'package:flutter/material.dart';
import 'profile_invitation.dart';
import 'factory_button.dart';

class ProfileScreen extends StatefulWidget {
  final Function(int) onFactorySelected;
  const ProfileScreen({Key? key, required this.onFactorySelected})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedFactory = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 470,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      child: Card(
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            const ProfileTexts(
                              name: 'Ben',
                              phoneNumber: '\u2022 +60109219938',
                            ),
                            const ProfileTexts(
                              name: 'Testing 1',
                              phoneNumber: '\u2022 +601234567891',
                            ),
                            const ProfileTexts(
                              name: 'Hello',
                              phoneNumber: '\u2022 +60123456789',
                            ),
                            const SizedBox(
                              height: 65.0,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const Invitation(),
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FactoryButton(
                              label: 'Factory 1',
                              icon: Icons.factory,
                              isSelected: selectedFactory == 1,
                              onTap: () {
                                setState(() {
                                  selectedFactory = 1;
                                  widget.onFactorySelected(1);
                                });
                              },
                            ),
                            FactoryButton(
                              label: 'Factory 2',
                              icon: Icons.factory,
                              isSelected: selectedFactory == 2,
                              onTap: () {
                                setState(() {
                                  selectedFactory = 2;
                                  widget.onFactorySelected(2);
                                });
                              },
                            ),
                            FactoryButton(
                              label: 'Factory 3',
                              icon: Icons.factory,
                              isSelected: selectedFactory == 3,
                              onTap: () {
                                setState(() {
                                  selectedFactory = 3;
                                  widget.onFactorySelected(3);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileTexts extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ProfileTexts({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              phoneNumber,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

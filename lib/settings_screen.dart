import 'package:flutter/material.dart';
import 'settings_value_input.dart';
import 'factory_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.onFactorySelected})
      : super(key: key);

  final Function(int) onFactorySelected;

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isEditing = false;
  double steamPressure = 0;
  double steamFlow = 0;
  double waterLevel = 0;
  double powerFrequency = 0;

  int currentIndex = 1;
  int selectedFactory = 1;

  Color factory1 = Colors.grey;
  Color factory2 = Colors.grey;
  Color factory3 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  alignment: Alignment.topLeft,
                  width: constraints.maxWidth,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 26, left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Minimum Threshold',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.info_outlined,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            const SizedBox(width: 15),
                            Align(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isEditing = !isEditing;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(56, 44),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(isEditing ? Icons.done : Icons.edit),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ValueInput(
                                    title1: 'Steam',
                                    title2: 'Pressure',
                                    unit: 'bar',
                                    isEditing: isEditing,
                                    initialValue: '29',
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: ValueInput(
                                    title1: 'Steam',
                                    title2: 'Flow',
                                    unit: 'T/H',
                                    isEditing: isEditing,
                                    initialValue: '22',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ValueInput(
                                    title1: 'Water',
                                    title2: 'Level',
                                    unit: '%',
                                    isEditing: isEditing,
                                    initialValue: '53',
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: ValueInput(
                                    title1: 'Power',
                                    title2: 'Frequency',
                                    unit: 'Hz',
                                    isEditing: isEditing,
                                    initialValue: '48',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
    );
  }
}

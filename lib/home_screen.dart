import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'factory_button.dart';

class HomeScreen extends StatefulWidget {
  final Function(int) onFactorySelected;
  const HomeScreen({Key? key, required this.onFactorySelected})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  int selectedFactory = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                child: selectedFactory == 1
                    ? const Factory1Content()
                    : const Factory2Content(),
              );
            },
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
    ));
  }
}

class Factory1Content extends StatelessWidget {
  const Factory1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          alignment: Alignment.topCenter,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.amber,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ADB1234 IS UNREACHABLE !',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 3.5),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Gauge(
                                title: 'Steam Pressure',
                                value: 0,
                                unit: 'bar',
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Gauge(
                                title: 'Steam Flow',
                                value: 0,
                                unit: 'T/H',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Gauge(
                                title: 'Water Level',
                                value: 0,
                                unit: '%',
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Gauge(
                                title: 'Power Frequency',
                                value: 0,
                                unit: 'Hz',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    '--:--',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Factory2Content extends StatelessWidget {
  const Factory2Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          alignment: Alignment.topCenter,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  '1549.7kW',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 3.5),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Gauge(
                                title: 'Steam Pressure',
                                value: 34.19,
                                unit: 'bar',
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Gauge(
                                title: 'Steam Flow',
                                value: 22.82,
                                unit: 'T/H',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Gauge(
                                title: 'Water Level',
                                value: 55.41,
                                unit: '%',
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Gauge(
                                title: 'Power Frequency',
                                value: 50.08,
                                unit: 'Hz',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    getCurrentDate(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String getCurrentDate() {
  final now = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  return dateFormat.format(now);
}

class Gauge extends StatelessWidget {
  final String title;
  final double value;
  final String unit;

  const Gauge({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: 160,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              child: SfRadialGauge(
                title: GaugeTitle(
                  text: title,
                  textStyle: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                    axisLineStyle: const AxisLineStyle(thickness: 15),
                    startAngle: 180,
                    endAngle: 360,
                    interval: 50,
                    minimum: 0,
                    maximum: 100,
                    canScaleToFit: true,
                    showLabels: false,
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          axisValue: value,
                          positionFactor: 0,
                          verticalAlignment: GaugeAlignment.near,
                          widget: Text(
                            '$value $unit',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ))
                    ],
                    pointers: <GaugePointer>[
                      MarkerPointer(
                        enableAnimation: true,
                        value: value,
                        color: Colors.grey,
                        markerOffset: -10,
                      ),
                      RangePointer(
                        value: value,
                        width: 15,
                        enableAnimation: true,
                        color: value <= 25 || value >= 80
                            ? Colors.red
                            : Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

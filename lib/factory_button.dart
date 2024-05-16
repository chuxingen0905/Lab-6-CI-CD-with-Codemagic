import 'package:flutter/material.dart';

class FactoryButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color selectedColor;
  final VoidCallback onTap;
  final bool isSelected;

  const FactoryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    this.selectedColor = Colors.blue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FactoryButtonState createState() => _FactoryButtonState();
}

class _FactoryButtonState extends State<FactoryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Align(
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 171,
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.isSelected ? widget.selectedColor : Colors.grey,
                  width: 3),
              color: const Color.fromRGBO(254, 255, 254, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Icon(
                  widget.icon,
                  size: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Color.fromRGBO(88, 88, 88, 1),
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

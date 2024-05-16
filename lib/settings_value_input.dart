import 'package:flutter/material.dart';

class ValueInput extends StatefulWidget {
  final String title1;
  final String title2;
  final String unit;
  final bool isEditing;
  final String initialValue; // Add this line

  const ValueInput({
    Key? key,
    required this.title1,
    required this.title2,
    required this.unit,
    required this.isEditing,
    required this.initialValue, // Add this line
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ValueInputState createState() => _ValueInputState();
}

class _ValueInputState extends State<ValueInput> {
  late TextEditingController _controller; // Modify this line

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.initialValue); // Add this line
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBorderColor() {
    if (widget.isEditing) {
      return Colors.black;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 150,
      margin: const EdgeInsets.only(top: 20, left: 10),
      child: Column(
        children: [
          Text(
            '${widget.title1}\n${widget.title2}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 47,
                  width: 75,
                  child: TextFormField(
                    controller: _controller,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    enabled: widget.isEditing,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 50),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: _getBorderColor()),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 47,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _getBorderColor(),
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Center(
                    child: Text(
                      widget.unit,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

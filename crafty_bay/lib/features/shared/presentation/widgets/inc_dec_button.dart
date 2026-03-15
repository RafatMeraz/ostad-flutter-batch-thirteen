import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChange, this.initialValue});

  final Function(int) onChange;
  final int? initialValue;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _counter = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (_counter > 1) {
              _counter--;
              widget.onChange(_counter);
              setState(() {});
            }
          },
          icon: Icon(Icons.remove),
        ),
        Text('$_counter', style: TextStyle(fontSize: 16)),
        IconButton(
          onPressed: () {
            _counter++;
            widget.onChange(_counter);
            setState(() {});
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}

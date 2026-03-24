import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onSelected,
    this.initialValue,
  });

  final String? initialValue;
  final List<String> colors;
  final Function(String) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedColor = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          'Color',
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: .bold),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: .horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              String color = widget.colors[index];
              return GestureDetector(
                onTap: () {
                  _selectedColor = color;
                  widget.onSelected(color);
                  setState(() {});
                },
                child: Container(
                  padding: .symmetric(horizontal: 10, vertical: 5),
                  margin: .only(right: 8),
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    border: .all(color: Colors.grey),
                    color: color == _selectedColor
                        ? AppColors.themeColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    color,
                    style: TextStyle(
                      color: color == _selectedColor
                          ? Colors.white
                          : Colors.black,
                      fontWeight: .bold
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

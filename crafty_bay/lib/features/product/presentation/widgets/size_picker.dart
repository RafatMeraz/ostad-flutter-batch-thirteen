import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.sizes,
    required this.onSelected,
    this.initialValue,
  });

  final String? initialValue;
  final List<String> sizes;
  final Function(String) onSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedSize = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          'Size',
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: .bold),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: .horizontal,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              String size = widget.sizes[index];
              return GestureDetector(
                onTap: () {
                  _selectedSize = size;
                  widget.onSelected(size);
                  setState(() {});
                },
                child: Container(
                  width: 50,
                  padding: .symmetric(horizontal: 10, vertical: 5),
                  margin: .only(right: 8),
                  alignment: .center,
                  decoration: BoxDecoration(
                    borderRadius: .circular(4),
                    border: .all(color: Colors.grey),
                    color: size == _selectedSize
                        ? AppColors.themeColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                      color: size == _selectedSize
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


import 'package:at_clinic/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);
  final List<String> items;
  final Function(int) onItemSelected;
  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  int selIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) => ChoiceChip(
          selectedColor: ColorName.colorLoginButton,
          backgroundColor: ColorName.colorLoginButton.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          label: Text(widget.items[index],
              style: TextStyle(
                  color: selIndex == index ? Colors.white : Colors.black)),
          selected: selIndex == index,
          onSelected: (value) {
            setState(() {
              selIndex = index;
            });
            widget.onItemSelected.call(index);
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
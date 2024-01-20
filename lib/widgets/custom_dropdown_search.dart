import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearch extends StatelessWidget {
  final String titel;
  final List<String> items;
  final Function(List<String>) onChanged;


  const CustomDropdownSearch({
    Key? key,
    required this.titel,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearch<String>.multiSelection(
        items: items,
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: const TextStyle(color: Colors.black),
          dropdownSearchDecoration: InputDecoration(
            hintText: titel,
            border: InputBorder.none,

          ),
        ),
        popupProps: PopupPropsMultiSelection<String>.bottomSheet(
          showSearchBox: true,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
            child: Text(
              "Search and select",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Search ${titel}',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

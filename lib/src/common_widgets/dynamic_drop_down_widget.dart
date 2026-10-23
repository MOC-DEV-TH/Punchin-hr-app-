
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DynamicDropDownWidget<T> extends ConsumerStatefulWidget {
  const DynamicDropDownWidget({
    super.key,
    required this.items,
    required this.onSelect,
    this.defaultBgColor = true,
    this.hintText,
    this.initValue,
  });

  final List<dynamic> items;
  final void Function(dynamic) onSelect;
  final bool defaultBgColor;
  final dynamic initValue;
  final String? hintText;

  @override
  ConsumerState<DynamicDropDownWidget<T>> createState() =>
      _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T>
    extends ConsumerState<DynamicDropDownWidget<T>> {
  late final ValueNotifier<dynamic> _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = ValueNotifier<dynamic>(
      _validValue(widget.initValue, widget.items),
    );
  }

  // Ensure the selected value exists in the dropdown list.
  dynamic _validValue(
      dynamic value,
      List<dynamic> items,
      ) {
    if (value == null) return null;

    for (final item in items) {
      if (item == value) {
        return item;
      }
    }

    return null;
  }

  @override
  void didUpdateWidget(
      covariant DynamicDropDownWidget<T> oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);

    // Handle changes to the initial selection or item list.
    if (oldWidget.initValue != widget.initValue ||
        oldWidget.items != widget.items) {
      final requestedValue =
      oldWidget.initValue != widget.initValue
          ? widget.initValue
          : _selectedValue.value;

      _selectedValue.value = _validValue(
        requestedValue,
        widget.items,
      );
    }
  }

  String _getItemName(dynamic item) {
    if (item == null) return '';

    try {
      return item.name?.toString() ?? '';
    } catch (_) {
      return item.toString();
    }
  }

  @override
  void dispose() {
    _selectedValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items.toSet().toList();

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: DropdownButtonFormField2<dynamic>(
        valueListenable: _selectedValue,

        hint: Text(
          widget.hintText ?? '',
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),

        isExpanded: true,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: widget.defaultBgColor
              ? Colors.white
              : Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 2,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((item) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _getItemName(item),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }).toList();
        },

        items: items.map<DropdownItem<dynamic>>((item) {
          return DropdownItem<dynamic>(
            value: item,
            child: Text(
              _getItemName(item),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          );
        }).toList(),

        onChanged: (value) {
          if (value == null) return;

          _selectedValue.value = value;
          widget.onSelect(value);
        },

        validator: (value) {
          if (value == null) {
            return 'Please select';
          }
          return null;
        },

        buttonStyleData: const FormFieldButtonStyleData(
          padding: EdgeInsets.only(right: 2),
        ),

        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),

        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
        ),

        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}

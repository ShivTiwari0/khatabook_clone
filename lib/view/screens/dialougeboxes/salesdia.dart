import 'package:flutter/material.dart';

class SalesDia extends StatefulWidget {
  const SalesDia({Key? key, required this.items}) : super(key: key);
  final List<String> items;

  @override
  State<SalesDia> createState() => _SalesDiaState();
}

class _SalesDiaState extends State<SalesDia> {
  String? _selectedItem;

  void _itemChange(String? itemValue) {
    setState(() {
      _selectedItem = itemValue;
    });
  }

  void _cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void _onSubmit() {
    Future.delayed(Duration.zero, () {
      Navigator.pop(context, _selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Time'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map(
                (item) => RadioListTile<String>(
                  value: item,
                  groupValue: _selectedItem,
                  title: Text(item),
                  onChanged: (value) => _itemChange(value),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => _cancel(context), child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () => _onSubmit(), child: const Text('Submit'))
      ],
    );
  }
}

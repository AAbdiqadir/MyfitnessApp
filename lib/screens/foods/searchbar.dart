
import 'package:flutter/material.dart';

import '../../constants.dart';
class search extends StatefulWidget {
  const search({Key? key,
  required this.onChanged
  }

      ) : super(key: key);
  final Function(String) onChanged;
  @override
  State<search> createState() => _searchState();
}
   // final Function(String) onChanged;
class _searchState extends State<search> {

  late TextEditingController _textEditingController;
  @override
  void initState() {

    _textEditingController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 59,
      alignment: Alignment.center,
      decoration: BoxDecoration(

        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(18),

      ),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _textEditingController,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          isDense: true,
          contentPadding: EdgeInsets.only(top: 10.0, left: 20
          ),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          fillColor: Color(0xFF211E1E),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search',
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          suffixIcon: _textEditingController.text.isNotEmpty? IconButton(
            constraints: const BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            splashRadius: 24,
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              _textEditingController.clear();
              widget.onChanged(_textEditingController.text);
              FocusScope.of(context).unfocus();
            },
          ): null,
        ),
      ),
    );

  }
}

import 'package:flutter/material.dart';

class SeachProducts extends StatelessWidget {
  const SeachProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: Key("inputSearch"),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        hintText: "Buscar no Mercado Livre",
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}

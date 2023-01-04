import 'package:flutter/material.dart';

class DropPage extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

  DropPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropDown Menu'),
        elevation: 0,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: dropValue,
            builder: (BuildContext context, String value, _) {
              return SizedBox(
                width: 280,
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.drive_eta),
                  hint: const Text('Escolha a marca'),
                  decoration: InputDecoration(
                    label: const Text('Marca'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (escolha) => dropValue.value = escolha.toString(),
                  items: dropOpcoes
                      .map((op) => DropdownMenuItem(
                            value: op,
                            child: Text(op),
                          ))
                      .toList(),
                ),
              );
            }),
      ),
    );
  }
}

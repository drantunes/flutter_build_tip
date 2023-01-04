import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_build_tip/widgets/pessoas_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends HookWidget {
  // late TextEditingController controller;
  // final busca = ValueNotifier<String>('');
  // // Color color = Colors.orange;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = TextEditingController(text: '');
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = useState<Color>(Colors.orange);
    final busca = useValueNotifier<String>('');
    final controller = useTextEditingController(text: '');

    useEffect(() {
      debugPrint('✅ Teste Effect');
      return null;
    }, [color.value]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.value,
        title: const Text('Lista de Pessoas'),
        elevation: 0,
        actions: [
          IconButton(
            // onPressed: () => setState(() {
            //   color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
            // }),
            onPressed: () => color.value = Colors.primaries[Random().nextInt(Colors.primaries.length)],
            icon: const Icon(Icons.color_lens),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: busca,
        builder: (BuildContext context, String termo, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 100),
            child: PessoasList(
              termo: termo,
            ),
          );
        },
      ),
      bottomSheet: Container(
        height: 120,
        color: color.value.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, _) {
                return TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    hintText: 'Filtrar a lista...',
                    suffixIcon: IconButton(
                      iconSize: 30,
                      color: Colors.black,
                      icon: const Icon(Icons.filter_list),
                      onPressed: () => busca.value = controller.text,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

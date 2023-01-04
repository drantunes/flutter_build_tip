import 'package:flutter/material.dart';

const List<String> pessoasList = [
  'Abilio',
  'Anderson',
  'Andressa',
  'Antônio',
  'Bernardo',
  'Bernadete',
  'Bianca',
  'Carla',
  'Camila',
  'Carlos',
  'Danilo',
  'Daniel',
  'Daniela',
  'Diego',
  'Everson',
];

class PessoasList extends StatefulWidget {
  final String termo;

  const PessoasList({
    Key? key,
    required this.termo,
  }) : super(key: key);

  @override
  State<PessoasList> createState() => _PessoasListState();
}

class _PessoasListState extends State<PessoasList> {
  late List<String> listaFiltrada;

  @override
  void initState() {
    super.initState();
    listaFiltrada = filtrarListaComTermo(widget.termo);
  }

  @override
  void didUpdateWidget(PessoasList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.termo != widget.termo) {
      listaFiltrada = filtrarListaComTermo(widget.termo);
    }
  }

  List<String> filtrarListaComTermo(String termo) {
    debugPrint('👉🏻 Filtrando Lista...');
    return pessoasList
        .where((pessoa) => pessoa.toLowerCase().contains(
              termo.toLowerCase(),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('👉🏻 Building PessoasList...');

    return ListView.separated(
      itemCount: listaFiltrada.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Text(listaFiltrada[index].substring(0, 1)),
        ),
        title: Text(listaFiltrada[index]),
      ),
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}






// class PessoasList extends StatefulWidget {
//   final String termo;

//   const PessoasList({
//     Key? key,
//     required this.termo,
//   }) : super(key: key);

//   @override
//   State<PessoasList> createState() => _PessoasListState();
// }

// class _PessoasListState extends State<PessoasList> {
//   late List<String> listaFiltrada;

//   @override
//   void initState() {
//     super.initState();
//     listaFiltrada = filtrarListaComTermo(widget.termo);
//   }

//   @override
//   void didUpdateWidget(PessoasList oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.termo != widget.termo) {
//       listaFiltrada = filtrarListaComTermo(widget.termo);
//     }
//   }

//   List<String> filtrarListaComTermo(String termo) {
//     debugPrint('👉🏻 Filtrando Lista...');
//     return pessoasList.where((pessoa) => pessoa.toLowerCase().contains(termo.toLowerCase())).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint('👉🏻 Building PessoasList...');

//     return ListView.separated(
//       itemCount: listaFiltrada.length,
//       itemBuilder: (context, index) => ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.grey.shade300,
//           child: Text(listaFiltrada[index].substring(0, 1)),
//         ),
//         title: Text(listaFiltrada[index]),
//       ),
//       separatorBuilder: (_, __) => const Divider(),
//     );
//   }
// }

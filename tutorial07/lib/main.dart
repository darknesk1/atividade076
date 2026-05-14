import 'package:flutter/material.dart';
import 'database.dart';
import 'model/filme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Filme> filmes = Database.getFilmes();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial07 CineFlutter"),
      ),
      body: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];

          return ListTile(
            leading: Icon(
              Icons.star,
              color: filme.imdb > 8.5 ? Colors.amber : Colors.grey,
            ),
            title: Text(filme.titulo),
            subtitle: Text("Ano: ${filme.anoLancamento} | IMDB: ${filme.imdb}"),
            onTap: () {
              print("Clicou em ${filme.titulo}");
            },
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Você clicou LongPress no filme ${filme.titulo}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

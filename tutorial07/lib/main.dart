import 'package:flutter/material.dart';
import 'database.dart';
import 'model/filme_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // It is good practice to initialize your data here
  final List<Filme> filmes = Database.getFilmes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tutorial07-Pedro"),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white, // Ensures text is readable
          ),
  body: ListView.builder(
  itemCount: filmes.length,
  itemBuilder: (context, index) {
  final filme = filmes[index];
  return ListTile(
              leading: const Icon(
                Icons.movie,
                color: Colors.blue,
              ),
            title: Text(filme.titulo),
            subtitle: Text("Ano: ${filme.anoLancamento}"),
            trailing: SizedBox(
            width: 60, // Gives enough space for the row content
            child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                    Icon(
                      Icons.star, // Added missing IconData
                      color: filme.imdb > 8.5 ? Colors.amber : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(filme.imdb.toString()),
                  ],
                ),
              ),
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Você segurou em: ${filme.titulo}"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
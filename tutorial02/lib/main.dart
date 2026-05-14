import 'package:flutter/material.dart';

void main() {
  runApp(const VikingsApp());
}

class VikingsApp extends StatelessWidget {
  const VikingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vikings Fã-App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.brown[800],
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/characters': (context) => const CharactersPage(),
        '/episodes': (context) => const EpisodesPage(),
      },
    );
  }
}

// Página Inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vikings - Fã-App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Mundo de Vikings!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/characters');
              },
              child: const Text('Ver Personagens'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/episodes');
              },
              child: const Text('Ver Episódios'),
            ),
          ],
        ),
      ),
    );
  }
}

// Página de Personagens
class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  final List<Map<String, String>> characters = const [
    {
      'name': 'Ragnar Lothbrok',
      'description': 'Líder lendário dos Vikings, guerreiro astuto e explorador.',
      'image': 'https://upload.wikimedia.org/wikipedia/en/f/fc/Ragnar_Lothbrok.png',
    },
    {
      'name': 'Lagertha',
      'description': 'Valquíria e guerreira feroz, ex-esposa de Ragnar.',
      'image': 'https://upload.wikimedia.org/wikipedia/en/7/7b/Lagertha.png',
    },
    {
      'name': 'Bjorn Ironside',
      'description': 'Filho de Ragnar, líder guerreiro e explorador de terras distantes.',
      'image': 'https://upload.wikimedia.org/wikipedia/en/8/8b/Bjorn_Ironside.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personagens')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final char = characters[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(char['name']!),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(char['image']!, height: 150),
                      const SizedBox(height: 12),
                      Text(char['description']!),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
              );
            },
            child: Card(
              color: Colors.brown[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(char['image']!),
                ),
                title: Text(
                  char['name']!,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  char['description']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(Icons.info, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Página de Episódios
class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  final List<Map<String, String>> episodes = const [
    {
      'title': 'Temporada 1, Episódio 1',
      'summary': 'Ragnar inicia sua jornada e se envolve com o rei e sua vila.',
    },
    {
      'title': 'Temporada 1, Episódio 2',
      'summary': 'Ragnar constrói seu primeiro navio e se prepara para a viagem.',
    },
    {
      'title': 'Temporada 1, Episódio 3',
      'summary': 'Conflitos internos surgem enquanto novas terras são exploradas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episódios')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          final ep = episodes[index];
          return Card(
            color: Colors.brown[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                ep['title']!,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                ep['summary']!,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Episódio "${ep['title']}" selecionado!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
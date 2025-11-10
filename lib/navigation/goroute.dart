import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          // Ini contoh event handling yang akan pindah ke page lain.
          // Yang ditulis adalah pathnya. GoRouter yang akan mencocokkan path dengan screen.
          onPressed: () => context.go('/about'),
          child: Text('Pergi ke Halaman About'),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: ElevatedButton(
          // Nilai 435 akan dikirimkan sebagai argumen id.
          onPressed: () => context.go('/profile/435'),
          child: Text('Pergi ke Halaman Profile'),
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  final String userId;
  final String path;

  const NewsPage({Key? key, required this.userId, required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("News Detail Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Center(
              child: Text(
                "News Detail Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
          SizedBox(height: 16),
          Text("User ID: $userId"),
          Text("News URL: \nhttps://$userId.medium.com/$path")
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  // Argumen id pada konstruktor (baris 81) akan disimpan pada variabel ini.
  final String id;

  // Argumen ditangkap melalui konstruktor
  ProfileScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('ID Profil: $id'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/news/dwirandyh/flutter-deeplink-example');
              // context.pushNamed("/news", pathParameters: {
              //   "id": "dwirandyh",
              //   "path": "flutter-deeplink-example"
              // });
            },
            child: const Text("Go to Profile Page"),
          )
        ],
      )
    );
  }
}

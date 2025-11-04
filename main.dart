import 'package:flutter/material.dart';

void main() {
  runApp(const CuacaApp());
}

class CuacaApp extends StatelessWidget {
  const CuacaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi Cuaca',
      debugShowCheckedModeBanner: false,
      home: const HalamanUtama(),
    );
  }
}

// ================= HALAMAN UTAMA ==================
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca Hari Ini'),
        backgroundColor: Colors.blueAccent,
        actions: [
          TextButton(
            onPressed: () {
              // Navigasi ke halaman kota lain
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HalamanKotaLain()),
              );
            },
            child: const Text(
              'Cek Kota Lain',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wb_sunny, color: Colors.orange, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Kota Semarang',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cerah, 31°C',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanKotaLain()),
                );
              },
              child: const Text('Lihat Kota Lain'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN KOTA LAIN ==================
class HalamanKotaLain extends StatelessWidget {
  const HalamanKotaLain({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data cuaca
    final List<Map<String, String>> dataCuaca = [
      {'kota': 'Jakarta', 'cuaca': 'Berawan, 32°C'},
      {'kota': 'Bandung', 'cuaca': 'Hujan Ringan, 25°C'},
      {'kota': 'Yogyakarta', 'cuaca': 'Cerah, 30°C'},
      {'kota': 'Surabaya', 'cuaca': 'Panas, 34°C'},
      {'kota': 'Denpasar', 'cuaca': 'Cerah Berawan, 31°C'},
      {'kota': 'Medan', 'cuaca': 'Hujan Sedang, 27°C'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca Kota Lain'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // kembali ke halaman utama
          },
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: ListView.builder(
        itemCount: dataCuaca.length,
        itemBuilder: (context, index) {
          final item = dataCuaca[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.location_city, color: Colors.blue),
              title: Text(item['kota']!),
              subtitle: Text(item['cuaca']!),
            ),
          );
        },
      ),
    );
  }
}

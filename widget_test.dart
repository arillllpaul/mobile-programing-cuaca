// ignore_for_file: unused_import


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutters_app/main.dart';

void main() {
  testWidgets('Menampilkan judul aplikasi cuaca', (WidgetTester tester) async {
    // Jalankan aplikasi utama
    await tester.pumpWidget(const CuacaApp());

    // Cek apakah teks "Cuaca Hari Ini" tampil di layar
    expect(find.text('Cuaca Hari Ini'), findsOneWidget);

    // Cek apakah tombol "Lihat Cuaca Besok" ada
    expect(find.text('Lihat Cuaca Besok'), findsOneWidget);

    // Simulasikan klik tombol untuk pindah halaman
    await tester.tap(find.text('Lihat Cuaca Besok'));
    await tester.pumpAndSettle();

    // Cek apakah halaman detail terbuka
    expect(find.text('Cuaca Besok'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'imt.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, Ria Suci',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari informasi gizi',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        buildCard(
                          "Index Masa Tubuh", 
                          "Ketahui status gizimu melalui perbandingan berat dan tinggi badan",
                           Colors.green,
                           '/index_masa_tubuh',
                           context,
                        ),
                        buildCard(
                          "Energi Basal", 
                          "Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh",
                           Colors.orange,
                           '/energi_basal',
                           context,
                        ),
                        buildCard(
                          "Energi Expenditure", 
                          "Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk membertahankan kehidupan",
                           Colors.purple,
                           '/energi_expenditure',
                           context,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String subtitle, Color cardColor, String routeName, BuildContext context) {
    return Card(
      color: cardColor,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMICalculator()),
                  );
                  // Tambahkan logika login di sini
                },
                child: Text('Cek Sekarang'),
              ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../util/style.dart';

class InformationCredit extends StatelessWidget {
  const InformationCredit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Text("Informasi Kredit", style: TextStyle(color: kTextColor, fontSize: 18)),
        ),
        body: SizedBox(
          width: _width,
          height: _height,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: [

              InformationWidget(
                text: 'Status',
                fill: 'Aktif',
              ),
              InformationWidget(
                text: 'Tanggal Pengajuan Kredit',
                fill: '2 Agustus 2023',
              ),
              InformationWidget(
                text: 'Tanggal Persetujuan Kredit',
                fill: '14 Agustus 2023',
              ),
              InformationWidget(
                text: 'Lama Tenor',
                fill: '5 Tahun/60 Bulan',
              ),
              InformationWidget(
                text: 'Sisa Waktu Pinjaman',
                fill: '23 Bulan',
              ),
              InformationWidget(
                text: 'Cicilan per Hari',
                fill: 'Rp.15.000',
              ),
              InformationWidget(
                text: 'Cicilan per Bulan',
                fill: 'Rp.450.000',
              ),
              InformationWidget(
                text: 'Jumlah Cicilan Belum Terbayar',
                fill: 'Rp.50.000',
              ),
              InformationWidget(
                text: 'Nama Penjamin',
                fill: 'Ibu Surniyati',
              ),
            ],
          ),
        )
      ),
    );
  }
}



class InformationWidget extends StatelessWidget {

  final String text;
  final String fill;

  const InformationWidget({Key? key,
    required this.text,
    required this.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      width: _width,
      height: 60,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: kPrimaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${text}:',
                style: const TextStyle(
                    fontSize: 15,
                    color: kTextColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(fill,
                style: const TextStyle(
                    fontSize: 15,
                    color: kTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ppbl/sqlite/mahasiswa.dart';
import 'package:ppbl/sqlite/form_edit.dart';
import 'package:ppbl/sqlite/connection.dart';

Future<List<Mahasiswa>> fetchMahasiswa() async{
  List<Mahasiswa> daftarMahasiswa = [];
  final db = await openMyDatabase();

  daftarMahasiswa = await db.query('mahasiswa').then((maps) {
    return List.generate(maps.length, (i) {
      return Mahasiswa(
        id: maps[i]['_id'] as int,
        name: maps[i]['name'] as String,
        age: maps[i]['age'] as int,
      );
    });
  });

  return daftarMahasiswa;
}

class ReadData extends StatefulWidget{
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData>{
  List<Mahasiswa> futureMahasiswa = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Data"),
      ),
      body: Center(
        child: FutureBuilder(
            future: fetchMahasiswa(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                futureMahasiswa = snapshot.data!;
              }
              else if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else{
                return const Center(
                  child: Text("Tidak ada data"),
                );
              }
              return ListView.builder(
                itemCount: futureMahasiswa.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormEdit(mahasiswa:futureMahasiswa[index])
                        ),
                      );
                    },
                      onLongPress:  () async{
                        final db = await openMyDatabase();
                        db.delete('mahasiswa', where: '_id = ?', whereArgs: [futureMahasiswa[index].id])
                            .then((message){
                          final snackBar = SnackBar(content: Text('Data berhasil dihapus'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          setState(() {
                            futureMahasiswa.removeAt(index);
                          });
                        })
                            .catchError((err){
                          final snackBar = SnackBar(content: Text('Terjadi kesalahan: $err'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                    child:ListTile(
                      leading: Text(futureMahasiswa[index].id.toString()),
                      title: Text(futureMahasiswa[index].name),
                      subtitle: Text(futureMahasiswa[index].age.toString()),

                    )
                  );
                },
              );
            }
        )
    ),);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_atividade_2608/list_view_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _alunos = [];

  final TextEditingController _raController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  void _cadastrarAluno() {
    final String ra = _raController.text;
    final String nome = _nomeController.text;

    if (ra.isNotEmpty && nome.isNotEmpty) {
      setState(() {
        _alunos.add({'RA': ra, 'Nome': nome});
      });
      _raController.clear();
      _nomeController.clear();
    }
  }

  void _irParaListaDeAlunos() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListViewScreen(alunos: _alunos),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos',style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _irParaListaDeAlunos,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.school,
              color: Colors.teal,
              size: 100,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _raController,
              decoration: InputDecoration(
                labelText: 'RA',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.assignment_ind),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _cadastrarAluno,
              icon: Icon(Icons.add),
              label: Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: (){
                _raController.clear();
                _nomeController.clear();
              },
              icon: Icon(Icons.cleaning_services_outlined),
              label: Text('Limpar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

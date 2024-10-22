import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Alumnos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class Persona {
  final String name;
  final String lastName;
  final String cuenta;

  Persona(this.name, this.lastName, this.cuenta);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Persona> _personas = [
    Persona('Ignacio', 'Martinez', '20195151'),
    Persona('Alberto', 'Guzman', '20195151'),
    Persona('Natanael', 'Cano', '20195151'),
    Persona('El Pirata', 'De Culiacan', '20195151'),
    Persona('Nata Fidel', 'Castro', '20195151')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTADO DE ALUMNOS'),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${_personas[index].name} ${_personas[index].lastName}'),
            subtitle: Text(_personas[index].cuenta),
            leading: CircleAvatar(
              child: Text(_personas[index].name.substring(0, 1)),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.people_alt_outlined),
        onPressed: _agregarAlumno,
      ),
    );
  }

  void _agregarAlumno() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        String lastName = '';
        String cuenta = '';

        return AlertDialog(
          title: const Text('Agregar Alumno'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Apellido'),
                onChanged: (value) => lastName = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Cuenta'),
                onChanged: (value) => cuenta = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                setState(() {
                  _personas.add(Persona(name, lastName, cuenta));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
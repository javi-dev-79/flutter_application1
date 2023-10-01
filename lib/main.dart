import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Deshabilita la pancarta de depuración
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Javi App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white; // Color de fondo inicial

  void _changeBackgroundColor() {
    setState(() {
      // Cambia el color de fondo a azul claro al hacer clic en el botón
      _backgroundColor = Colors.lightBlue;
    });
  }

  void _resetBackgroundColor() {
    setState(() {
      // Restaura el color de fondo al blanco por defecto al hacer clic en el botón
      _backgroundColor = Colors.white;
    });
  }

  void _showHelloWorldMessage() {
    // Muestra un SnackBar con el mensaje "Hola Mundo!"
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('HOLA MUNDO!'),
      ),
    );
  }

  void _hideHelloWorldMessage() {
    // Oculta el SnackBar actual si existe
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Usa el color de fondo definido en la variable _backgroundColor
      backgroundColor: _backgroundColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Push the button to change background color:',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _changeBackgroundColor();
              _showHelloWorldMessage();
            },
            tooltip: 'Change Background Color',
            child: const Text(
                'Greeting'), // Agrega una "A" como contenido del botón
          ),
          const SizedBox(height: 16), // Espacio entre los botones
          FloatingActionButton(
            onPressed: () {
              _resetBackgroundColor();
              _hideHelloWorldMessage();
            },
            tooltip: 'Reset Background Color',
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

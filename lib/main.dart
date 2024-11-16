import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Menu(),
    debugShowCheckedModeBanner: false,
  ));
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 202, 200, 185),
      ),
      backgroundColor: const Color.fromARGB(255, 169, 174, 169),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
         children: [
          const Text('Elige uns de las opciones para interactuar'),
          const SizedBox(height: 60,),
          ElevatedButton(
            onPressed: ()async{
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const Palindromo()));
            },
            child: const Text('Palindromo')),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: ()async{
            await Navigator.push(context, MaterialPageRoute(builder: (context) => const NumerosAmigos()));
          }, 
          child: const Text('Numeros Amigos')),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: ()async{
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const Binario()));
            },
          child: const Text('Numero a Binario'))
         ],
      ),
      )
    );
  }
}

class Palindromo extends StatefulWidget {
  const Palindromo({super.key});

  @override
  State<Palindromo> createState() => _PalindromoState();
}

class _PalindromoState extends State<Palindromo> {
  final TextEditingController _paliController = TextEditingController();


  String _paligramo = '';
  String _respPalin = '';


  // ignore: non_constant_identifier_names
  void Palindromo(){
    setState(() {
      _paligramo = _paliController.text;
       String textoNormalizado = _paligramo.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();
         if (textoNormalizado == textoNormalizado.split('').reversed.join('')) {
            _respPalin = 'Palindromo: ($textoNormalizado)';
         }
         else{
          _respPalin = 'No es palindromo';
         }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindromo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _paliController,
              decoration: const InputDecoration(
                label: Text('Ingrese una oracion')
              ),
            ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () =>Palindromo(),
            child: const Text('Resolver')),
            const SizedBox(height: 50,),
            Text('Respuesta: $_respPalin')
          ],
        ),
      ),
    );
  }
}

class NumerosAmigos extends StatefulWidget {
  const NumerosAmigos({super.key});

  @override
  State<NumerosAmigos> createState() => _NumerosAmigosState();
}

class _NumerosAmigosState extends State<NumerosAmigos> {
    final TextEditingController _unoController = TextEditingController();
    final TextEditingController _dosController = TextEditingController();
    
    int _num1 = 0;
    int _num2 = 0;
    int _divnum1 =0;
    int _divnum2 = 0;
    String _resp = '';

    // ignore: non_constant_identifier_names
    void NumerosAmigo(){
      setState(() {
        _divnum1 =0;
        _divnum2 = 0;
        _num1 = int.parse(_unoController.text);
        _num2 = int.parse(_dosController.text);
        for (int i=1; i<_num1; i++){
          if(_num1%i==0){
            _divnum1 = _divnum1+i;
          }
        }
        for (int i=1; i<_num2; i++){
          if(_num2%i==0){
            _divnum2 = _divnum2+i;
          }
        }
        if(_divnum1 == _num2 || _divnum2 == _num1){
          _resp = 'Son amigos';
        }else{
          _resp = 'No son amigos';
        }
     });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numeros amigos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _unoController,
              decoration: const InputDecoration(
                label: Text('Ingrese un numero')
              ),
              keyboardType: TextInputType.number,
            ),
            ),
             Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _dosController,
              decoration: const InputDecoration(
                label: Text('Ingrese un numero')
              ),
              keyboardType: TextInputType.number,
            ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () =>NumerosAmigo(),
            child: const Text('Resolver')),
            const SizedBox(height: 50,),
            Text('Los numeros $_num1 = $_divnum1 y $_num2 = $_divnum2: $_resp')
          ],
        ),
      ),
    );
  }
}

class Binario extends StatefulWidget {
  const Binario({super.key});

  @override
  State<Binario> createState() => _BinarioState();
}

class _BinarioState extends State<Binario> {
  final TextEditingController _controller = TextEditingController();
  int _numero = 0;
  String _binario = '';
  void Convertir(){
    setState(() {
      _numero = int.parse(_controller.text);
      _binario = _numero.toRadixString(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor a numero binario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('Ingrese un numero')
              ),
              keyboardType: TextInputType.number,
            ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () =>Convertir(),
            child: const Text('Resolver')),
            const SizedBox(height: 50,),
            const Text('Respuesta:'),
            Text(_binario)
          ],
        ),
      ),
    );
  }
}
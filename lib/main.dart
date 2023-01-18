import 'package:auto_animation/widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Auto Animated",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
        centerTitle: true,
      ),
      body: LiveGrid(
        padding: const EdgeInsets.all(16),
        showItemInterval: const Duration(milliseconds: 50),
        showItemDuration: const Duration(milliseconds: 150),
        visibleFraction: 0.001,
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: animationItemBuilder((index) => HorizontalItem(title: index.toString())),
      ),
    );
  }
}
class HorizontalItem extends StatelessWidget {
  const HorizontalItem({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) 
  {
    return Card(
      child: SizedBox(
        width: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Material(
            color: Colors.green,
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
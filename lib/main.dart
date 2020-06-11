import 'package:covid_impact/presentation/pages/input_estimates_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('COVID-19 Estimate'),
        ),
        body: InputEstimatesPage(),
      ),
    );
  }
}
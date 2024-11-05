import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:praktikum_screen/widget/takepicture_screen.dart';
import 'package:praktikum_screen/provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PictureProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: TakePictureScreen(camera: firstCamera),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
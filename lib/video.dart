import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Viewer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _fileWidget;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.single;

      if (file.extension == 'pdf') {
        _fileWidget = PDFView(
          filePath: file.path!,
        );
      } else if (file.extension == 'mp4') {
        VideoPlayerController controller = VideoPlayerController.file(
          File(file.path!),
        );
        await controller.initialize();
        _fileWidget = AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        );
      } else if (file.extension == 'jpg' || file.extension == 'png') {
        _fileWidget = Image.file(
          File(file.path!),
          fit: BoxFit.contain,
        );
      } else {
        _fileWidget = Text(
          'Unsupported File Type',
          style: TextStyle(fontSize: 16),
        );
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Viewer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Open File Picker'),
            ),
            SizedBox(height: 20),
            if (_fileWidget != null) _fileWidget,
          ],
        ),
      ),
    );
  }
}

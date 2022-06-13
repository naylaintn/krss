@JS()
library javascript_compress;

import 'package:js/js.dart';

@JS()
external String canvas(String base64Image);
external String compress();

String imageCanvas(String text) => canvas(text);
String imageCompress() => compress();
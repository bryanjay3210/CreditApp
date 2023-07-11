import 'package:logger/logger.dart';

void logThis({required String text, bool isError = false}) {
  var logger = Logger();

  isError ? logger.wtf(text) : logger.i(text);
}

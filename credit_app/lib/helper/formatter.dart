import 'package:intl/intl.dart';

class Formatter {
  String formatCurrency(double value) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return '₱ ${oCcy.format(value)}';
  }

  String formatDateTime(DateTime value) {
    return DateFormat('MM-dd-yyyy  h:mm a').format(value);
  }
}

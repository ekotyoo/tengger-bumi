
String getAgeYearAndMonth(DateTime date){
  DateTime now = DateTime.now();
  int months = (now.year - date.year) * 12 + (now.month - date.month);
  String age;
  if(months > 12 && months % 2 == 0){
    age = "${(months/12).toInt()} tahun";
  } else if (months > 12) {
    age = "${(months/12).toInt()} tahun ${months%12} bulan";
  } else if (months > 0) {
    age = "${months%12} bulan";
  } else {
    age = "0 bulan";
  }
  return age;
}
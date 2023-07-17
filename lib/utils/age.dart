
String getAgeYearAndMonth(DateTime date){
  DateTime now = DateTime.now();
  int months = (now.year - date.year) * 12 + (now.month - date.month);
  String age;
  if(months > 12 ){
    if(months % 12 == 0){
      age = "${(months/12).toInt()} tahun";
      return age;
    }
    return age = "${(months/12).toInt()} tahun ${months%12} bulan";
  } else if (months > 0) {
    return age = "${months%12} bulan";
  } else {
    return age = "0 bulan";
  }
}
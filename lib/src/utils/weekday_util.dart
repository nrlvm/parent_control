class WeekdayUtil {
  String getDay(int i) {
    int num = DateTime.now().weekday + i;
    if(num > 7){
      num %= 7;
    }
    switch (num) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'error';
    }
  }
}
final weekdayUtil = WeekdayUtil();
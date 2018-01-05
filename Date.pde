class Date { 
  final String[] days = {"Monday ", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
  int today;
  int hour;
  int minute;
  boolean before_noon;

  Date(int d, int h, int m, boolean beforeNoon) {


if (h<13)//If the hour is in 12-hour format, the beforeNoon argument is used
      before_noon=beforeNoon;
    else {
      if ((h%24)>=12) {//If not, the time of day is determined by the 24-hour clock equivalent of the inputted hour (e.g. hour 14 is interpreted as 2PM)
        before_noon= false;
      } else 
      before_noon = true;
    }
    
    if (m>=60) {//Adjusts minute/hour
      h+=(m/60);
      
    }
    if (h>24) {//Adjusts hour/day
      d+=(h/24);
  }
    

    today=d%7;
    hour = h%12;
    if(hour==0 && before_noon==false){//If hour is 12PM (noon), 12 PM is displayed
    hour =12;

    }//if hour is 12 AM then 00 AM is displayed
    minute = m%60;
  }
  Date(Date d) {

    today = d.today;
    hour = d.hour;
    minute = d.minute;
    before_noon = d.before_noon;
  }


  void addHour() {
    hour +=1;
    if (hour==12) {
      if (before_noon==true)  //If AM, change to PM
        before_noon=false;
      else {//If PM, change to AM
        before_noon=true;
        today+=1;
        if (today==7)//If day is increased from sunday to monday, the today value is ajusted
          today=0;
      }
    }
    if (hour == 13)
    hour=1;
    
    }
    
    void addMinute(){
    minute+=1;
    if(minute==60){
    addHour();
    minute =0;
    }
    
    }


    String toString() {

      String date = days[today];
      //Format hour
      if (hour<10)
        date +=" 0"+ hour;
      else 
      date +=" "+hour;
      //Format minute;
      if (minute<10)
        date+=":0"+minute;
      else date+=":"+minute;
      //Format Time of Day
      if (before_noon)
        date+="AM";
      else 
      date+="PM";

      return date;
    }
}
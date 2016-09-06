class Timer {
  int startSec, startMin, startHour;
  int curSec, curMin, curHour;
  int duration;
  boolean start, end;
  Timer(int d) {
    duration = d;
    start = end = false;
  }
  void init() {
    if(!start) {
      startSec = second();
      startMin = minute();
      startHour = hour(); 
      start = end = true;
    }
  }
  void countdown() {
    curSec = second();
    if(curSec != startSec) {
      duration--;
      startSec = curSec;
    }
    if(duration <= 0) end = true;
  }
  int getTime() {
    return duration; 
  }
}
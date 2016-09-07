class Timer {
  int startSec, startMin, startHour;
  int curSec, curMin, curHour;
  int duration, ODURATION;
  boolean start, end;
  Timer(int d) {
    ODURATION = duration = d;
    start = end = false;
  }
  void init() {
    if(!start) {
      startSec = second();
      startMin = minute();
      startHour = hour(); 
      start = true;
    }
  }
  void countdown() {
    init();
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
  void reset() {
    duration = ODURATION;
    start = end = false;
  }
}
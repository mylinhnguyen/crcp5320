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
    if(start) {
      startSec = second();
      startMin = minute();
      startHour = hour(); 
    }
  }
  void countdown() {
    if(!end && start) {
      curSec = second();
      if(curSec != startSec) {
        duration--;
        startSec = curSec;
      }
      if(duration < 0) end = true;
    }
  }
  void go() {
    if(!start) {
      start = true;
      init();
    }
  }
  int getTime() {
    return duration; 
  }
  void reset() {
    duration = ODURATION;
    start = end = false;
  }
  void quickReset() {
    duration = ODURATION;
    end = false;
    start = true;
  }
}
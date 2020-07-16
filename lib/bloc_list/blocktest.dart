import 'package:rxdart/rxdart.dart';

class CounterBlock{
int initialCount = 0;
BehaviorSubject<int> _subjectCounter;
CounterBlock({this.initialCount}){
  _subjectCounter = new BehaviorSubject<int>.seeded(this.initialCount);
}

Stream get observable =>_subjectCounter.stream;
void increment(){
  initialCount++;
  _subjectCounter.sink.add(initialCount);
}

void decrement(){
  initialCount--;
  _subjectCounter.sink.add(initialCount);
}

void dispose(){
  _subjectCounter.close();
}
}
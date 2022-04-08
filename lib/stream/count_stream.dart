// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:timer_04/model/count.dart';

class CountStream {
  double _radius = 1;
  bool _isActive = true;
  late Duration _currentTime;
  late Duration _fullTime;
//async* para que se pueda retornar varias veces unr esultado, no se usa solo async porque es para future y las future se ejecutan 1 sola vez
//yield indica que es un resultado parcial, es decir se va a ejecutar varias veces , emite los valores de un stream
// los * es porque estamos usando strings

  Stream<Count> stream() async* {
    print("en el stream");
    yield* Stream.periodic(Duration(seconds: 1), (int s) {
      if (_isActive) {
        print("currentime $_currentTime");
        print("radius $_radius");
        _currentTime -= Duration(seconds: 1);
        _radius = _currentTime.inSeconds / _fullTime.inSeconds;

        if (_currentTime.inSeconds <= 0) {
          _isActive = false;
        }
      }

      return Count(_currentTime.inSeconds.toString(), _radius);
    });
  }

  void start() {
    _isActive = true;
  }

  void stop() {
    _isActive = false;
  }

  bool getActive() {
    return _isActive;
  }

  void setTime(int seconds) {
    _currentTime = Duration(seconds: seconds);
    _fullTime = Duration(seconds: seconds);
  }

  void restart() {
    _currentTime = _fullTime;
  }
}

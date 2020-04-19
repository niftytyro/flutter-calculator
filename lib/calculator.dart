class Calculator {
  static const List<String> _possibleKeys = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  static const List<String> _operators = ['+', '-', '×', '/'];
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _currentOperator = '+';
  String _inputBuffer = '';

  bool _isValidKey(String key) {
    return _isIn(key, _possibleKeys);
  }

  bool _isIn(String val, List list) {
    for (int i = 0; i < list.length; i++) {
      if (val == list[i]) {
        return true;
      }
    }
    return false;
  }

  String getInputBuffer() {
    return _inputBuffer;
  }

  String sendKey(key) {
    if (_isValidKey(key)) {
      if (_inputBuffer.length > 9) {
        _inputBuffer = _inputBuffer.substring(0, _inputBuffer.length - 1) + key;
        return _inputBuffer;
      }
      _inputBuffer += key;
      return _inputBuffer;
    } else {
      if (key == '.') {
        for (int j = 0; j < _inputBuffer.length; j++) {
          if (_inputBuffer[j] == '.') {
            return _inputBuffer;
          }
        }
        if (_inputBuffer.length > 9) {
          return _inputBuffer;
        }
        _inputBuffer += key;
        return _inputBuffer;
      }
    }
  }

  String setOperator(String op) {
    if (_isIn(_inputBuffer[_inputBuffer.length - 1], _operators)) {
      _inputBuffer = _inputBuffer.substring(0, _inputBuffer.length - 1) + op;
      return _inputBuffer;
    }
    _inputBuffer = getValue();
    var val = _inputBuffer;
    _currentOperator = op;
    _inputBuffer = '';
    print(val + op);
    return val + op;
  }

  String getValue() {
    if (_inputBuffer[_inputBuffer.length - 1] == '.') {
      _inputBuffer += '0';
    }
    _num2 = double.parse(_inputBuffer);
    if (_currentOperator == '+') {
      _num1 += _num2;
      _inputBuffer = _num1.toString();
    } else if (_currentOperator == '-') {
      _num1 -= _num2;
      _inputBuffer = _num1.toString();
    } else if (_currentOperator == '×') {
      _num1 *= _num2;
      _inputBuffer = _num1.toString();
    } else if (_currentOperator == '/') {
      _num1 /= _num2;
      _inputBuffer = _num1.toString();
    }
    _currentOperator = '';
    _num2 = 0.0;
    if (_inputBuffer.substring(_inputBuffer.length - 2) == '.0') {
      _inputBuffer = _inputBuffer.substring(0, _inputBuffer.length - 2);
    }
    return _inputBuffer;
  }

  String clearLast() {
    _inputBuffer = _inputBuffer.substring(0, _inputBuffer.length - 1);
    return _inputBuffer;
  }

  String clear() {
    _inputBuffer = '';
    return _inputBuffer;
  }

  String clearAll() {
    _inputBuffer = '';
    _num2 = _num1 = 0.0;
    _currentOperator = '+';
  }
}

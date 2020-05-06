class Memory {
  static const OPERATIONS = const ['/', '*', '-', '+', '='];

  final _buffer = <double>[0.0, 0.0];
  int _bufferIndex = 0;
  String _operation;
  String _lastOperation;
  bool _wipeValue = false;
  String _value = '0';
  String get value {
    return _value;
  }

  void applyButtonPressed(String text) {
    if (_isReplacingOperation(text)) {
      _operation = text;
      return;
    }

    if (text == 'AC') {
      _allClear();
    } else if (OPERATIONS.contains(text)) {
      _setOperation(text);
    } else {
      _setDigit(text);
    }

    _lastOperation = text;
  }

  _allClear() {
    _value = '0';
    _buffer.setAll(0, <double>[0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
  }

  _setOperation(String operation) {
    bool isEqual = operation == '=';

    if (_bufferIndex == 0) {
      if (!isEqual) {
        _operation = operation;
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      
      _operation = isEqual ? null : operation;
      _bufferIndex = isEqual ? 0 : 1;
    }

    _wipeValue = true;
  }

  _setDigit(String digit) {
    final isDot = digit == '.';
    final isPercent = digit == '%';
    final isBackspace = digit == '<';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if ((isDot || isPercent) && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;

    if (isPercent) {
      final digitValue = double.tryParse(currentValue) ?? 0.0;
      final percentValue = digitValue / 100;
      _value = percentValue.toString();
    } if (isBackspace) {
      _value = _value.substring(0, _value.length - 1);
      if (_value.length == 0) {
        _value = '0';
      }
    } else {
      _value = currentValue + digit;
    }
    
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0.0;
  }

  _calculate() {
    switch (_operation) {
      case '/': return _buffer[0] / _buffer[1];
      case '*': return _buffer[0] * _buffer[1];
      case '-': return _buffer[0] - _buffer[1];
      case '+': return _buffer[0] + _buffer[1];
      default: return _buffer[0];
    }
  }

  _isReplacingOperation(String operation) {
    return OPERATIONS.contains(_lastOperation)
      && OPERATIONS.contains(operation)
      && _lastOperation != '='
      && operation != '=';
  }
}
import 'package:expressions/expressions.dart';
enum CalculatorAction {final _operations = [];
String _expression = "0";
String get expression => _expression;

void addSymbol(String symbol) {
  _expression = _expression == "0" ? symbol : _expression + symbol;
}

void equals() {
  final expression = Expression.parse(_expression);
  final result = ExpressionEvaluator().eval(expression, {}).toString();
  _operations.add('$expression=$result');
  _expression = result;
}
List getAllOperations() => _operations;

void backspace() {
  final displayContentSize = _expression.length - 1;
  if(displayContentSize > 0) {
    _expression = _expression.substring(0, _expression.length - 1);
  } else {
    _expression = "0";
  }
}
void getLastOperation() {
  _expression = _operations.last.expression;
}
void clear() {
  _expression = "0";
}
  ADD_SYMBOL, EQUALS, BACKSPACE, CLEAR, GET_LAST_OPERATION
}
class Calculator {

}

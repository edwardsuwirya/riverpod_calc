enum CalculatorOperator {
  none,
  plus,
  minus,
  equal,
}

CalculatorOperator CalcOprToEnum(String opr) {
  switch (opr) {
    case '+':
      return CalculatorOperator.plus;
    case '-':
      return CalculatorOperator.minus;
    case '=':
      return CalculatorOperator.equal;
    default:
      return CalculatorOperator.none;
  }
}

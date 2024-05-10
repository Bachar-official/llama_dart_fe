import 'package:ask_titmouse/entity/condition.dart';
import 'package:ask_titmouse/entity/condition_exception.dart';

void checkConditions(List<Condition> conditions) {
  for (var cond in conditions) {
    if (cond.condition) {
      throw ConditionException(cond.message);
    }
  }
}

void checkCondition(Condition condition) {
  if (condition.condition) {
    throw ConditionException(condition.message);
  }
}

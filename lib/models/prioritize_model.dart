enum PriorityLevel { low, medium, high }

class PrioritizeModel {
  PriorityLevel priorityLevel;
  PrioritizeModel({this.priorityLevel = PriorityLevel.low});
}
import 'package:todo_list_system/models/task_model.dart';
import 'package:todo_list_system/models/prioritize_model.dart';

class PrioritizeService {

  //method to prioritize the task
  void updateTaskPriority(Task task, PriorityLevel newPriority) {
    task.priority = newPriority.index; 
    
  }
}
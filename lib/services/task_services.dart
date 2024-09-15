import 'package:todo_list_system/models/task_model.dart';

class TaskService {
  List<Task> tasks = [];
  int nextId = 1;

  //method for aadding a task
  void addTask(Task task) {
    task.id ??= nextId++; // Assign id if it's null
    tasks.add(task);
  }

    //List for veiwing a task
    List<Task> viewTasks() {
    return tasks; 
  }
   
   //method for marking a task as completed
   void markTaskCompleted(int id) {
  tasks.firstWhere((task) => task.id == id).isCompleted = true;
}

  //method for deleting a task
  void deleteTask(int id) {
    tasks.removeWhere((task) => task.id == id);
  }

  //method for updating a task
  void updateTask(Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
    }
  }
}
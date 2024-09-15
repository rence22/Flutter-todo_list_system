import 'dart:io';
import 'package:collection/collection.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_list_system/providers.dart';
import 'package:todo_list_system/models/task_model.dart';
import 'package:todo_list_system/models/prioritize_model.dart';

void main(){
  
  //Create a variable container to get the provider 
  final container = ProviderContainer();

  //Create a container.read to retrieve the data in our services
  final taskService = container.read(taskServiceProvider);
  final prioritizeService = container.read(prioritizeServiceProvider);

  while(true){
    print('\nSimple To-Do List Application');
    print('a. Add Task');
    print('b. View all Tasks');
    print('c. Mark a task as completed');
    print('d. Update Tasks');
    print('e. Delete a task');
    print('f. Prioritize a task');
    print('g. Exit');
    print('Enter your choice:');

     var options = stdin.readLineSync();

    switch (options) {


     ////////// Add Task /////////// 
      case 'a':
        print('Enter a tasks: ');
        var title = stdin.readLineSync()!;

        var newTask = Task(title: title);

        taskService.addTask(newTask);
        print('Task added successfully!');
        break;


    ////////// View Task ///////////
     case 'b':
  var tasks = taskService.viewTasks();
  if (tasks.isEmpty) {
    print('No tasks found!');
  } else {
    for (var i = 0; i < tasks.length; i++) {
      var priorityText = ''; 
      switch (PriorityLevel.values[tasks[i].priority]) {
        case PriorityLevel.low:
          priorityText = 'Low';
          break;
        case PriorityLevel.medium:
          priorityText = 'Medium';
          break;
        case PriorityLevel.high:
          priorityText = 'High';
          break;
      }
      print('${i + 1}. ${tasks[i].title} - ${tasks[i].isCompleted ? 'Completed' : 'Pending'} - Priority: $priorityText');
    }
  }
  break;


    ////////// Mark a Task as Completed ///////////
      case 'c':
          print('Enter the task ID to mark as completed: ');
          var taskId = int.parse(stdin.readLineSync()!);
          
          taskService.markTaskCompleted(taskId);
          print('Task marked as completed!');
         break;


    ////////// Update Task ///////////
      case 'd':
          print('Enter the task ID to update: ');
          var taskId = int.parse(stdin.readLineSync()!); 

          print('Enter the new title: ');
          var newTitle = stdin.readLineSync()!;

          var taskToUpdate = taskService.tasks.firstWhere((task) => task.id == taskId);

          // Create a new Task object with the updated title and description
          var updatedTask = Task(
            id: taskId,
            title: newTitle,
            isCompleted: taskToUpdate.isCompleted, 
            priority: taskToUpdate.priority, 
          );

            taskService.updateTask(updatedTask);
            print('Task updated successfully!');
            break;


    ////////// Delete Task ///////////
      case 'e':
          print('Enter the task ID to delete: ');
          var taskId = int.parse(stdin.readLineSync()!);

          taskService.deleteTask(taskId);
          print('Task deleted successfully!');
         break;


    ////////// Prioritize Task ///////////
     case 'f':
  print('Enter the task ID to prioritize: ');
  var taskId = int.parse(stdin.readLineSync()!);

  // Find the task
  Task? task = taskService.tasks.firstWhereOrNull(
    (task) => task.id == taskId
  );

  if (task != null) {
    print('Select priority: 1 for Low, 2 for Medium, 3 for High');
    var choice = stdin.readLineSync()!;

    // Map user input to PriorityLevel
    PriorityLevel? newPriority;
    if (choice == '1') newPriority = PriorityLevel.low;
    if (choice == '2') newPriority = PriorityLevel.medium;
    if (choice == '3') newPriority = PriorityLevel.high;

    if (newPriority != null) {
      prioritizeService.updateTaskPriority(task, newPriority);
      print('Priority updated to ${newPriority.name}.');
    } else {
      print('Invalid priority selection.');
    }
  } else {
    print('Task not found.');
  }
  break;

    ////////// Quit ///////////
      case 'g':
        print('Thank you for using the application!');
        exit(0);
      default:
        print('Invalid option!');

     }
  }
}
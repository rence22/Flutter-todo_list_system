import 'package:riverpod/riverpod.dart';
import 'services/prioritize_services.dart';
import 'services/task_services.dart';

final taskServiceProvider = Provider<TaskService>((ref) => TaskService());
final prioritizeServiceProvider = Provider<PrioritizeService>((ref) => PrioritizeService());
final taskListProvider = Provider<List>((ref) => []);

  
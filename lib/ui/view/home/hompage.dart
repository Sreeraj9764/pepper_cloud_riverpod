import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gritstone_test/extensions/extensions.dart';
import 'package:gritstone_test/infrastructure/task/task.dart';
import 'package:gritstone_test/ui/theme/theme.dart';
import 'package:gritstone_test/ui/view/widgets/text_renderer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: tasks.when(
        data: (taskList) {
          return taskList.isEmpty
              ? const Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 260,
                      child: WavyTextRendering(
                        text: "To do list is empty",
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text("*This is text is rendered using text painter")
                  ],
                ))
              : ListView.separated(
                  itemCount: taskList.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  itemBuilder: (context, index) {
                    final task = taskList[index];
                    return MergeSemantics(
                      child: ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        titleTextStyle: context.textTheme.titleLarge,
                        subtitleTextStyle: context.textTheme.labelLarge,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(task.dateTime.toDateTimeString),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () => ref
                                    .read(taskListProvider.notifier)
                                    .deleteTask(task.key),
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: AppColors.kBorderColor, width: 2)),
                        leading: Checkbox(
                          value: task.completed,
                          onChanged: (_) => ref
                              .read(taskListProvider.notifier)
                              .toggleTaskCompletion(task.id),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const AddTaskDialog(),
        ),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTaskDialog extends HookConsumerWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: 'Task Title',
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Semantics(
            label: 'Task Description',
            child: TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Semantics(
            label: 'Cancel',
            button: true,
            child: const Text('Cancel'),
          ),
        ),
        TextButton(
          onPressed: () {
            final title = titleController.text.trim();
            final description = descriptionController.text.trim();

            if (title.isNotEmpty) {
              final time = DateTime.now();
              final task = Task(
                  id: time.toIso8601String(),
                  title: title,
                  description: description,
                  completed: false,
                  dateTime: time);

              ref.read(taskListProvider.notifier).addTask(task);

              titleController.clear();
              descriptionController.clear();

              Navigator.pop(context);
            }
          },
          child: Semantics(
            label: 'Add Task',
            button: true,
            enabled: true,
            child: const Text('Add'),
          ),
        ),
      ],
    );
  }
}

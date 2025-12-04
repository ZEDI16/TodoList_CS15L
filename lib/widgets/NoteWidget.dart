import 'package:flutter/material.dart';
import 'package:todolist5/models/ListItemWidget.dart';
import 'package:todolist5/models/list_item_model.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({super.key});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final List<ListItemModel> taskList = [];
  final TextEditingController taskController = TextEditingController();

  void addTask(String t) {
    if (taskController.text.isEmpty) return;
    setState(() {
      taskList.add(ListItemModel(task: t));
      taskController.clear();
    });
  }

  void updateStatus(bool? status, int index) {
    setState(() {
      taskList[index].isDone = status;
    });
  }

  void removeItem(ListItemModel item) {
    setState(() {
      taskList.remove(item);
    });
  }

  void clearList() {
    setState(() {
      taskList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Modern AMOLED dark black
      backgroundColor: const Color(0xFF0D0D0D),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // 🔹 Modern input bar with add button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A), // visible dark grey
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Add a new task...",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () => addTask(taskController.text),
                      icon: const Icon(Icons.add_circle),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: clearList,
                  child: const Text(
                    "Clear All",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1C), // card visible on black
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListItem(
                          listItemModel: taskList[index],
                          updateTask: (value) => updateStatus(value, index),
                          removeItem: () => removeItem(taskList[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

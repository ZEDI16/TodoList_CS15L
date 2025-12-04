import 'package:flutter/material.dart';

class DynamicWidgetPage extends StatefulWidget {
  const DynamicWidgetPage({super.key});

  @override
  State<DynamicWidgetPage> createState() => _DynamicWidgetPageState();
}

class _DynamicWidgetPageState extends State<DynamicWidgetPage> {
  final List<String> items = [];
  final TextEditingController _controller = TextEditingController();

  void addItem() {
    if (_controller.text.isEmpty) return; 
    setState(() {
      items.add(_controller.text);
      _controller.clear(); 
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Widgets")),
      body: Column(
        children: [
  
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(1),
            color: Colors.blueGrey.shade100,
            // child: const Text(
            //   "Dynamic Widget List",
            //   style: TextStyle(fontSize: 1, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Enter item",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: addItem, child: const Text("Add")),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(items[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

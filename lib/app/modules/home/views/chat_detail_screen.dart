import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailScreen extends StatefulWidget {
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<Map<String, dynamic>> messages = [
    {'isSender': false, 'message': 'Hello, how are you?', 'time': '10:00 AM'},
    {'isSender': true, 'message': 'I\'m good, thank you!', 'time': '10:05 AM'},
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          'isSender': true,
          'message': _messageController.text,
          'time': '10:10 AM',
        });
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments; // Menerima argument user dari halaman pesan
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigasi kembali ke halaman pesan
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(user['profileImage']),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user['name']),
                Text(
                  'Last active: ${user['lastActive']}',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message['isSender']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message['isSender']
                          ? Colors.pink[100]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: message['isSender']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(message['message']),
                        SizedBox(height: 5),
                        Text(
                          message['time'],
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    // Tambah fitur atau file
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

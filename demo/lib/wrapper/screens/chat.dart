import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final List<String> timestamp = [];
  final CollectionReference _messagesCollection =
  FirebaseFirestore.instance.collection('messages');

  TextEditingController _textEditingController = TextEditingController();


  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messagesCollection.orderBy('timestamp').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child:
                      CircularProgressIndicator()
                  );
                }


                messages.clear();
                snapshot.data!.docs.forEach((doc) {
                  messages.add((doc.data() as Map<String, dynamic>)['message'] as String);
                });

                timestamp.clear();
                snapshot.data!.docs.forEach((doc) {
                  timestamp.add((doc.data() as Map<String, dynamic>)['timestamp'] as String);
                });




                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final reversedIndex = messages.length - 1 - index;
                    return ListTile(
                      title: Text(messages[reversedIndex]),
                      subtitle: Text(timestamp[reversedIndex]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      _messagesCollection.add({'message': text,'timestamp':DateTime.now().toString()}).then((_) {
        setState(() {
          _textEditingController.clear();
        });
      }).catchError((error) {
        // Handle error
        print('Failed to send message: $error');
      });
    }
  }
}
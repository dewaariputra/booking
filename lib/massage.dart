import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bot Chat'),
      ),
      body: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      ChatMessage message = ChatMessage(
        text: text,
        isCustomer: true,
      );

      setState(() {
        _messages.insert(0, message);
      });

      // Simulate bot response
      _sendMessageToBot(text);
    }
  }

  void _sendMessageToBot(String text) {
    // Simulate bot response
    String botResponse = 'This is a bot response.';

    Future.delayed(Duration(milliseconds: 500), () {
      ChatMessage botMessage = ChatMessage(
        text: botResponse,
        isCustomer: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    });
  }

  Widget _buildMessageList() {
    return ListView.builder(
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildMessageItem(index);
      },
    );
  }

  Widget _buildMessageItem(int index) {
    final message = _messages[index];

    return ListTile(
      title: Text(
        message.text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      leading: message.isCustomer ? null : Icon(Icons.person),
      trailing: message.isCustomer ? Icon(Icons.person) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildMessageList(),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(''), // Add your logic here
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isCustomer;

  ChatMessage({required this.text, required this.isCustomer});
}

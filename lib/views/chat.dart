import 'package:flutter/material.dart';
import 'package:doctor_consultation/models/message.dart';
import 'package:doctor_consultation/models/doctor.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final Doctor doctor;

  ChatScreen({required this.doctor});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 61, 139, 253),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.image),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                //color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.image),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: Color.fromARGB(255, 77, 212, 172),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.9),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 5.0),
                ),
                hintText: 'Send a message...',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Color.fromARGB(255, 61, 139, 253),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //TODO: APPBAR
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 61, 139, 253),
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: widget.doctor.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(text: '\n'),
              widget.doctor.isOnline
                  ? TextSpan(
                      text: 'Online',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : TextSpan(
                      text: 'Offline',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    )
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                Message messagePrev;
                int indexPrev = index - 1;
                int doctorId = widget.doctor.id;
                print(doctorId);
                if (message.sender.id == 0 || message.sender.id == doctorId) {
                  print(message.sender.id);
                  if (index != 0) {
                    Message messagePrev = messages[indexPrev];
                    print(indexPrev);
                    final bool isMe = message.sender.id == 0;
                    final bool isSameUser =
                        messagePrev.sender.id == message.sender.id;
                    return _chatBubble(message, isMe, isSameUser);
                  } else {
                    return _chatBubble(message, true, false);
                  }
                } else {
                  return SizedBox(height: 0);
                }
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _postController = TextEditingController();
  final List<Map<String, dynamic>> _posts = [
    {"user": "jack_8892", "time": "6min", "views": 175, "text": "My spokes are getting rusted !! help me #query", "replies": []},
    {"user": "daniel_89921", "time": "10min", "views": 10, "text": "\"Why is my car’s air conditioning blowing hot air?\" #query", "replies": []},
    {"user": "bruce_1999", "time": "1d", "views": 654, "text": "Why is my car making a weird noise when I turn the steering wheel?", "replies": []},
    {"user": "messi_2014", "time": "3d", "views": 854, "text": "How do I know if my car’s battery is dead or just needs a jump start?", "replies": []},
  ];

  void _addPost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        _posts.insert(0, {"user": "You", "time": "Just now", "views": 0, "text": _postController.text, "replies": []});
        _postController.clear();
      });
    }
  }

  void _addReply(int index, String reply) {
    if (reply.isNotEmpty) {
      setState(() {
        _posts[index]["replies"].add(reply);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Community', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.inbox, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _postController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Ask a question...",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _addPost,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey[900],
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${_posts[index]["user"]} - ${_posts[index]["time"]} - ${_posts[index]["views"]} views",
                            style: TextStyle(color: Colors.white60, fontSize: 12)),
                        const SizedBox(height: 5),
                        Text(_posts[index]["text"], style: TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                _showReplyDialog(index);
                              },
                              icon: Icon(Icons.reply, color: Colors.blue),
                              label: Text("Reply", style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                        if (_posts[index]["replies"].isNotEmpty)
                          Column(
                            children: _posts[index]["replies"].map<Widget>((reply) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10, top: 5),
                                child: Text("- $reply", style: TextStyle(color: Colors.white70)),
                              );
                            }).toList(),
                          ),
                      ],
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

  void _showReplyDialog(int index) {
    TextEditingController replyController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Reply", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: replyController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Type your reply...",
              hintStyle: TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                _addReply(index, replyController.text);
                Navigator.pop(context);
              },
              child: Text("Send", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}

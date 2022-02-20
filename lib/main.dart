import 'package:assignment_10/PostInfo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySite(),
    );
  }
}

class MySite extends StatefulWidget {

  @override
  State<MySite> createState() => _MySiteState();
}

class _MySiteState extends State<MySite> {

  final List<PostInfo> postInfo = [
    PostInfo('Barbatos', 'assets/images/Venti_Pro.jpg', 'assets/images/Venti.jpg', 'Anemo Archon', {'Baal': 'Come fight me.', 'Morax' : 'you Idiot.'}),
    PostInfo('Morax', 'assets/images/Zhongli_Pro.jpg', 'assets/images/Zhongli.png', 'Geo Archon', {'Venti' : 'Ehe.', 'Baal' : 'Long time no see.'}),
    PostInfo('Baal', 'assets/images/Raiden_Pro.jpg', 'assets/images/Raiden.png', 'Electro Archon', {'Venti' : 'Ehe', 'Morax' : "It's been a while"}),
    ];

  String userName = "Xawel's";

  TextEditingController _controller  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Archon Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            for(int i = 0; i< postInfo.length; i++) buildPost(position: i),
          ],
        ),
      ),
    );
  }

  Widget buildPost({int? position}) {

    var _commentUserName = postInfo[position!].comment.keys.toList();
    var _commentUser = postInfo[position].comment.values.toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 8.0, right: 20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(postInfo[position].userImage),
                        ),
                        SizedBox(width: 8.0,),
                        Text(postInfo[position].user, style: TextStyle(fontSize: 25.0),),
                      ],
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert,),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
            ),

            Image.asset(postInfo[position].postImage),
            Text(postInfo[position].postMessage, style: TextStyle(fontSize: 50.0),),

            for(int i = 0; i < _commentUserName.length; i++) Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(_commentUserName[i] + " : " ,style: TextStyle(fontSize: 25.0, color: Colors.blue),),
                  Text(_commentUser[i], style: TextStyle(fontSize: 25.0),),
                ],
              ),
            ),

            Row(
              children: [
                buildButton(position: position),
                buildCommentField(position: position),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({int? position}) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            postInfo[position!].pressLike();
          });
        },
        icon: Icon((postInfo[position!].liked) ? Icons.thumb_up : Icons.thumb_up_outlined, size: 30.0,),
      ),
    );
  }

  Widget buildCommentField({int? position}) {
    return Flexible(
      child: Container(
        height: 30.0,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'Add a Comment',),
            controller: _controller,
            onSubmitted: (String comment) {
              setState(() {
                postInfo[position!].comment.addAll({userName : comment});
                _controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}

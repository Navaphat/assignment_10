import 'Model.dart';
import 'package:flutter/material.dart';

class customWidget2 extends StatefulWidget {

  @override
  State<customWidget2> createState() => _customWidget2State();
}

class _customWidget2State extends State<customWidget2> {

  final List<PostInfo> _postInfo = [
    PostInfo('Barbatos', 'assets/images/Venti_Pro.jpg', 'assets/images/Venti.jpg', "    A bard that seems to have arrived on some unknown wind — sometimes sings songs as old as the hills, and other times sings poems fresh and new. Likes apples and lively places but is not a fan of cheese or anything sticky. When using his Anemo power to control the wind, it often appears as feathers, as he's fond of that which appears light and breezy.", ['Baal', 'Morax'], ['Come fight me.', 'You idiot.']),
    PostInfo('Morax', 'assets/images/Zhongli_Pro.jpg', 'assets/images/Zhongli.png', "   Wangsheng Funeral Parlor's mysterious consultant. Handsome, elegant, and surpassingly learned.Though no one knows where Zhongli is from, he is a master of courtesy and rules. From his seat at Wangsheng Funeral Parlor, he performs all manner of rituals.", ['Barbatos','Baal'], ['Ehe.', 'Long  time no see.']),
    PostInfo('Baal', 'assets/images/Raiden_Pro.jpg', 'assets/images/Raiden.png', '    The Raiden Shogun is the awesome and terrible power of thunder incarnate, the exalted ruler of the Inazuma Shogunate. With the might of lightning at her disposal, she commits herself to the solitary pursuit of eternity.', ['Barbatos', 'Morax'], ['Ehe.', "It's been a while."]),
  ];

  String _userName = "Xawel's";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Genshin Impact'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Genshin_Impact_Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: ListView.builder(
            itemCount: _postInfo.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    buildPost(position: index),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }

  Widget buildPost({int? position}) {

    var post = _postInfo[position!];

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Container(
        //color: Colors.red,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
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
                          backgroundImage: AssetImage(post.getUserImage()),
                        ),
                        SizedBox(width: 8.0,),
                        Text(post.getUser(), style: TextStyle(fontSize: 25.0),),
                      ],
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert,),
                      //alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
            ),

            Image.asset(post.getPostImage()),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Flexible(child: Text(post.getPostMessage(), style: TextStyle(fontSize: 16.0), textAlign: TextAlign.justify,)),
                ],
              ),
            ),

            for(int i = 0; i < post.getCommentUserLength(); i++) Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text("${post.getCommentUserName(i: i)} : " ,style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                  Text('${post.getCommentMessage(i: i)}', style: TextStyle(fontSize: 20.0),),
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

    var post = _postInfo[position!];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            post.pressLike();
          });
        },
        icon: Icon((post.getLiked()) ? Icons.thumb_up : Icons.thumb_up_outlined, size: 30.0, ),
      ),
    );
  }

  Widget buildCommentField({int? position}) {

    var post = _postInfo[position!];
    var controller = post.getController();

    return Flexible(
      child: Container(
        height: 30.0,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'Add a Comment'),
            controller: controller,
            onSubmitted: (String comment) {
              setState(() {
                post.addCommentUserName(userName: _userName);
                post.addCommentMessage(message: comment);
                controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}
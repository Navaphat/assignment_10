import 'Model.dart';
import 'package:flutter/material.dart';

class customWidget extends StatefulWidget {

  @override
  State<customWidget> createState() => _customWidgetState();
}

class _customWidgetState extends State<customWidget> {

  final List<model> _postInfo = [
    model('Hu Tao', 'assets/images/Hutao_Pro.jpg', 'assets/images/HuTao.jpg', "   Hu Tao is the 77th Director of the Wangsheng Funeral Parlor, a person vital to managing Liyue's funerary affairs. She does her utmost to flawlessly carry out a person's last rites and preserve the world's balance of yin and yang. Aside from this, she is also a talented poet whose many" + '"masterpieces" have passed around' + "Liyue's populace by word of mouth.", ['Zhongli'], ['Hello there.']),
    model('Barbatos', 'assets/images/Venti_Pro.jpg', 'assets/images/Venti.jpg', "    A bard that seems to have arrived on some unknown wind — sometimes sings songs as old as the hills, and other times sings poems fresh and new. Likes apples and lively places but is not a fan of cheese or anything sticky. When using his Anemo power to control the wind, it often appears as feathers, as he's fond of that which appears light and breezy.", ['Baal', 'Morax'], ['Come fight me.', 'You idiot.']),
    model('Morax', 'assets/images/Zhongli_Pro.jpg', 'assets/images/Zhongli.png', "   Wangsheng Funeral Parlor's mysterious consultant. Handsome, elegant, and surpassingly learned.Though no one knows where Zhongli is from, he is a master of courtesy and rules. From his seat at Wangsheng Funeral Parlor, he performs all manner of rituals.", ['Barbatos','Baal'], ['Ehe.', 'Long  time no see.']),
    model('Baal', 'assets/images/Raiden_Pro.jpg', 'assets/images/Raiden.png', '    The Raiden Shogun is the awesome and terrible power of thunder incarnate, the exalted ruler of the Inazuma Shogunate. With the might of lightning at her disposal, she commits herself to the solitary pursuit of eternity.', ['Barbatos', 'Morax'], ['Ehe.', "It's been a while."]),
  ];

  String _userName = "Xawel's";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 20.0),
          itemCount: _postInfo.length,
          itemBuilder: (BuildContext Context, int index) {
            return Column(
              children: [
                SizedBox(height: 10.0,),
                buildPost(position: index),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget buildPost({int? position}) {

    var post = _postInfo[position!];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 8.0, right: 20.0),
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

                  Material(
                    color: Colors.white,
                    child: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.more_vert,),
                      //alignment: Alignment.centerRight,
                    ),
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

          viewComment(position: position),

          Row(
            children: [
              buildButton(position: position),
              buildCommentField(position: position),
            ],
          ),
        ],
      ),
    );
  }

  Widget viewComment({int? position}) {

    var post = _postInfo[position!];

    return ListView.builder(
      shrinkWrap: true,
      //physics: ClampingScrollPhysics(),
      itemCount: post.getCommentUserLength(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              Text("${post.getCommentUserName(i: index)} : " ,style: TextStyle(fontSize: 20.0, color: Colors.blue),),
              Flexible(child: Text('${post.getCommentMessage(i: index)}', style: TextStyle(fontSize: 20.0),)),
            ],
          ),
        );
      },
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
        icon: Material(child: Icon((post.getLiked()) ? Icons.thumb_up : Icons.thumb_up_outlined, size: 30.0, )),
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
                post.addComment(comment: comment);
                controller.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}
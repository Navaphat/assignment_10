import 'package:flutter/material.dart';

class PostInfo {
  var user;
  var userImage;
  var postImage;
  var postMessage;
  bool liked = false;
  List<String> commentUserName = [];
  List<String> commentMessage = [];

  TextEditingController _controller  = TextEditingController();


  PostInfo(var user, var userImage, var postImage, var postMessage, List<String> commentUserName, List<String> commentMessage) {
    this.user = user;
    this.userImage = userImage;
    this.postImage = postImage;
    this.postMessage = postMessage;
    this.commentUserName = commentUserName;
    this.commentMessage = commentMessage;
  }

  pressLike() {
    liked = !liked;
  }

  getController() {
    return _controller;
  }

  getCommentUserLength() {
    return commentUserName.length;
  }
}
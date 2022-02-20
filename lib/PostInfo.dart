import 'package:flutter/material.dart';

class PostInfo {
  var user;
  var userImage;
  var postImage;
  var postMessage;
  Map<String, String> comment = {};
  bool liked = false;
  TextEditingController _controller  = TextEditingController();

  PostInfo(var user, var userImage, var postImage, var postMessage, Map<String, String> comment) {
    this.user = user;
    this.userImage = userImage;
    this.postImage = postImage;
    this.postMessage = postMessage;
    this.comment = comment;
  }

  pressLike() {
    liked = !liked;
  }

  getController() {
    return _controller;
  }
}
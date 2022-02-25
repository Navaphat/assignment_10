import 'package:flutter/material.dart';

class model {
  var _user;
  var _userImage;
  var _postImage;
  var _postMessage;
  bool _liked = false;
  List<String> _commentUserName = [];
  List<String> _commentMessage = [];

  TextEditingController _controller  = TextEditingController();


  model(var user, var userImage, var postImage, var postMessage, List<String> commentUserName, List<String> commentMessage) {
    this._user = user;
    this._userImage = userImage;
    this._postImage = postImage;
    this._postMessage = postMessage;
    this._commentUserName = commentUserName;
    this._commentMessage = commentMessage;
  }

  getUser() {
    return _user;
  }

  getUserImage() {
    return _userImage;
  }

  getPostImage() {
    return _postImage;
  }

  getPostMessage() {
    return _postMessage;
  }

  getLiked() {
    return _liked;
  }

  pressLike() {
    _liked = !_liked;
  }

  getController() {
    return _controller;
  }

  getCommentUserName({int? i}) {
    return _commentUserName[i!].characters;
  }

  addCommentUserName({String? userName}) {
    _commentUserName.add(userName!);
  }

  getCommentMessage({int? i}) {
    return _commentMessage[i!].characters;
  }

  addCommentMessage({String? message}) {
    _commentMessage.add(message!);
  }

  getCommentUserLength() {
    return _commentUserName.length;
  }
}
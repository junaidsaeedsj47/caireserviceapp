import 'package:caireapp/constants/caireColors.dart';
import 'package:caireapp/util/appUtil.dart';
import 'package:caireapp/util/text.dart';
import 'package:flutter/material.dart';

class ChattingDetailScreen extends StatefulWidget {
  @override
  _ChattingDetailScreenState createState() => _ChattingDetailScreenState();
}

class _ChattingDetailScreenState extends State<ChattingDetailScreen> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.instance.themeColor,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.instance.appTextColor,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "John",
                        style: TextStyleUtil.textStyleRaqiBookBold(context),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("Online",
                          style: TextStyleUtil.textStyleRaqiBook(context,
                              fontSize: 13,
                              color: AppColors.instance.backGroundColor)),
                    ],
                  ),
                ),
                Icon(
                  Icons.call,
                  color: AppColors.instance.appTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                child: Text(
                  messages[index].messageContent!,
                  style: TextStyleUtil.textStyleRaqiBook(context,
                      fontSize: 14),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColors.instance.themeColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyleUtil.textStyleRaqiBookBold(context,
                              fontSize: 14, color: Color(0xffB4B4B4)),
                          border: InputBorder.none),
                    ),

                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: AppColors.instance.themeColor,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  String? messageContent;
  String? messageType;

  ChatMessage({@required this.messageContent, @required this.messageType});
}

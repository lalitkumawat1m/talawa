import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/size_config.dart';

class Message extends StatelessWidget {
  const Message({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 2),
      child: Row(
        mainAxisAlignment:
            message.sender!.firstName == userConfig.currentUser.firstName
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal! * 2,
              vertical: SizeConfig.blockSizeVertical! * 1.2,
            ),
            decoration: BoxDecoration(
              color:
                  message.sender!.firstName == userConfig.currentUser.firstName
                      ? Colors.white
                      : Colors.green,
              borderRadius:
                  message.sender!.firstName == userConfig.currentUser.firstName
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
            ),
            child: Text(
              message.messageContent!,
              style: TextStyle(
                color: message.sender!.firstName ==
                        userConfig.currentUser.firstName
                    ? Colors.black
                    : Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
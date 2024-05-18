import 'package:ask_titmouse/entity/message.dart';
import 'package:ask_titmouse/ui/containers/loading_card.dart';
import 'package:ask_titmouse/utils/remove_tags.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: message.sentByMe
              ? const Color(0xFF003C71)
              : const Color(0xFFED8B00),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: message.text == ''
            ? const Padding(
                padding: EdgeInsets.all(15.0),
                child: LoadingCard(),
              )
            : Linkify(
                options: const LinkifyOptions(humanize: false),
                text: message.text,
                onOpen: (link) {
                  if (kIsWeb) {
                    html.window.open(removeTagsFromUrl(link.url), '');
                  } else {
                    launchUrl(Uri.parse(removeTagsFromUrl(link.url)));
                  }
                },
                style: TextStyle(
                    color: message.sentByMe ? Colors.white : Colors.black),
              ),
      ),
    );
  }
}

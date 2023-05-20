import 'package:chat_app_flutter/domain/entities/message.dart';
import 'package:flutter/material.dart';

class PartnerBubble extends StatelessWidget {
  final Message message;
  const PartnerBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(
          url: message.imageUrl!,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url;

  const _ImageBubble({required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url,
        width: size.width * .7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 150,
            width: size.width * .7,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Recibiendo mensaje...'),
          );
        },
      ),
    );
  }
}

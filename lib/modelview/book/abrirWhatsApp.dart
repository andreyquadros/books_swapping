import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

launchWhatsAppUri(numero) async {
  final link = WhatsAppUnilink(
    phoneNumber: '${numero}',
    text: "Oi! Tenho interesse no seu livro!",
  );

  await canLaunchUrl(link.asUri());
}

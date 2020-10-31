// import 'package:flutter/material.dart';

// import '../app_theme.dart';

// class AppAvatar extends StatelessWidget {
//   final Contact contact;
//   final double size;
//   final TextStyle initialTextStyle;
//   final Color fillColor;
//   final Color borderColor;
//   final bool hasBorder;

//   AppAvatar(
//       {this.contact,
//       this.size,
//       this.initialTextStyle,
//       this.fillColor,
//       this.borderColor,
//       this.hasBorder = false});

//   @override
//   Widget build(BuildContext context) {
//     return contact.avatar == null || contact.avatar.isEmpty
//         ? Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: size,
//                 height: size,
//                 decoration: BoxDecoration(
//                   color: fillColor != null
//                       ? fillColor
//                       : AppTheme.instance.activeColor,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: borderColor != null
//                         ? borderColor
//                         : AppTheme.instance.activeColor,
//                     width: 1.0,
//                   ),
//                 ),
//               ),
//               Container(
//                   width: hasBorder ? size - 4 : size,
//                   height: hasBorder ? size - 4 : size,
//                   child: Center(
//                     child: Text(
//                       StringUtil.instance.getInitials(contact.name),
//                       textAlign: TextAlign.center,
//                       style: initialTextStyle,
//                     ),
//                   )),
//             ],
//           )
//         : Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: size,
//                 height: size,
//                 decoration: BoxDecoration(
//                   color: fillColor != null
//                       ? fillColor
//                       : AppTheme.instance.activeColor,
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: borderColor != null
//                         ? borderColor
//                         : AppTheme.instance.regularGreyColor,
//                     width: 1.0,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: hasBorder ? size - 4 : size,
//                 height: hasBorder ? size - 4 : size,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage(contact.avatar),
//                   ),
//                 ),
//               ),
//             ],
//           );
//   }
// }

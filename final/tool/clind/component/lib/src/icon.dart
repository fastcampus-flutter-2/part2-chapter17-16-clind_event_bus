import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_component/gen/gen.dart';

class ClindIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const ClindIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  factory ClindIcon.arrowBack({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icArrowBack, color: color, size: size);
  }

  factory ClindIcon.bookmark({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icBookmark, color: color, size: size);
  }

  factory ClindIcon.cancel({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icCancel, color: color, size: size);
  }

  factory ClindIcon.chatBubble({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icChatBubble, color: color, size: size);
  }

  factory ClindIcon.chevronRight({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icChevronRight, color: color, size: size);
  }

  factory ClindIcon.circleNotifications({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icCircleNotifications, color: color, size: size);
  }

  factory ClindIcon.close({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icClose, color: color, size: size);
  }

  factory ClindIcon.doNotDisturbOn({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icDoNotDisturbOn, color: color, size: size);
  }

  factory ClindIcon.edit({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icEdit, color: color, size: size);
  }

  factory ClindIcon.expandMore({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icExpandMore, color: color, size: size);
  }

  factory ClindIcon.favorite({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icFavorite, color: color, size: size);
  }

  factory ClindIcon.featuredSeasonalAndGifts({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icFeaturedSeasonalAndGifts, color: color, size: size);
  }

  factory ClindIcon.filterNone({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icFilterNone, color: color, size: size);
  }

  factory ClindIcon.flagCircle({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icFlagCircle, color: color, size: size);
  }

  factory ClindIcon.homeOff({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icHomeOff, color: color, size: size);
  }

  factory ClindIcon.homeOn({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icHomeOn, color: color, size: size);
  }

  factory ClindIcon.imagesMode({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icImagesMode, color: color, size: size);
  }

  factory ClindIcon.logo({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icLogo, color: color, size: size);
  }

  factory ClindIcon.logoSmall({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icLogoSmall, color: color, size: size);
  }

  factory ClindIcon.logout({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icLogout, color: color, size: size);
  }

  factory ClindIcon.mail({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icMail, color: color, size: size);
  }

  factory ClindIcon.moreHoriz({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icMoreHoriz, color: color, size: size);
  }

  factory ClindIcon.notificationsOff({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icNotificationsOff, color: color, size: size);
  }

  factory ClindIcon.notificationsOn({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icNotificationsOn, color: color, size: size);
  }

  factory ClindIcon.payments({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icPayments, color: color, size: size);
  }

  factory ClindIcon.personOff({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icPersonOff, color: color, size: size);
  }

  factory ClindIcon.personOn({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icPersonOn, color: color, size: size);
  }

  factory ClindIcon.restartAlt({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icRestartAlt, color: color, size: size);
  }

  factory ClindIcon.search({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icSearch, color: color, size: size);
  }

  factory ClindIcon.settings({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icSettings, color: color, size: size);
  }

  factory ClindIcon.sms({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icSms, color: color, size: size);
  }

  factory ClindIcon.sourceEnvironment({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icSourceEnvironment, color: color, size: size);
  }

  factory ClindIcon.upload({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icUpload, color: color, size: size);
  }

  factory ClindIcon.visibility({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icVisibility, color: color, size: size);
  }

  factory ClindIcon.volunteerActivism({Color? color, double? size}) {
    return ClindIcon(icon: Assets.images.svgs.icVolunteerActivism, color: color, size: size);
  }

  @override
  Widget build(BuildContext context) {
    return ClindSvgPicture.asset(
      icon,
      color: color,
      width: size,
      height: size,
    );
  }
}

class ClindSvgPicture extends CoreSvgPicture {
  ClindSvgPicture.asset(
    super.assetName, {
    super.key,
    super.matchTextDirection,
    super.bundle,
    super.package = kToolClindComponentPackageName,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.theme,
    super.colorFilter,
    super.color,
    super.colorBlendMode,
    super.cacheColorFilter,
  }) : super.asset();
}

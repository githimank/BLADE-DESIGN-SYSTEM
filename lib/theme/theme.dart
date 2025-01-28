// import 'package:flutter/material.dart';
//
// import 'app_color.dart';
//
// class MaterialTheme {
//   const MaterialTheme(this.textTheme);
//
//   final TextTheme textTheme;
//
//   static ColorScheme lightScheme() {
//     return const ColorScheme(
//       brightness: Brightness.light,
//       primary: Color(0xff7E1780),
//       surfaceTint: Color(0xff7e1780),
//       onPrimary: Color(0xffffffff),
//       primaryContainer: Color(0xffFDF0FC),
//       onPrimaryContainer: Color(0xff7A297A),
//       secondary: Color(0xff190D1B),
//       onSecondary: Color(0xffffffff),
//       secondaryContainer: Color(0xffF6F5F6),
//       onSecondaryContainer: Color(0xff190D1B),
//       tertiary: Color(0xff685e30),
//       onTertiary: Color(0xffffffff),
//       tertiaryContainer: Color(0xfff1e3a8),
//       onTertiaryContainer: Color(0xff211b00),
//       error: Color(0xffFD5154),
//       onError: Color(0xffffffff),
//       errorContainer: Color(0xffFFEAEA),
//       onErrorContainer: Color(0xffF72225),
//       surface: Color(0xffFFFFFF),
//       onSurface: AppColors.onSurfaceLight,
//       onSurfaceVariant: AppColors.onSurfaceVariantLight,
//       outline: Color(0xff101010),
//       outlineVariant: Color(0xff979DA3),
//       shadow: Color(0xff000000),
//       scrim: Color(0xff000000),
//       inverseSurface: Color(0xff392e2a),
//       inversePrimary: Color(0xffffb599),
//       primaryFixed: Color(0xffffdbce),
//       onPrimaryFixed: Color(0xff370e00),
//       primaryFixedDim: Color(0xffffb599),
//       onPrimaryFixedVariant: Color(0xff71361d),
//       secondaryFixed: Color(0xffffdbce),
//       onSecondaryFixed: Color(0xff2c160d),
//       secondaryFixedDim: Color(0xffe7beaf),
//       onSecondaryFixedVariant: Color(0xff5d4035),
//       tertiaryFixed: Color(0xfff1e3a8),
//       onTertiaryFixed: Color(0xff211b00),
//       tertiaryFixedDim: Color(0xffd4c78e),
//       onTertiaryFixedVariant: Color(0xff1a5021),
//       surfaceDim: Color(0xffe8d6d1),
//       surfaceBright: Color(0xffFFFFFF),
//       surfaceContainerLowest: Color(0xffffffff),
//       surfaceContainerLow: Color(0xff979DA3),
//       surfaceContainer: Color(0xffF1F2F3),
//       surfaceContainerHigh: Color(0xfff7e4df),
//       surfaceContainerHighest: Color(0xfff1dfd9),
//     );
//   }
//
//   ThemeData light() {
//     return theme(lightScheme());
//   }
//
//   static ColorScheme darkScheme() {
//     return const ColorScheme(
//       brightness: Brightness.dark,
//       primary: Color(0xff9C459D),
//       surfaceTint: Color(0xffffb599),
//       onPrimary: Color(0xffFFFFFF),
//       primaryContainer: Color(0xff27192A),
//       onPrimaryContainer: Color(0xffB542B5),
//       secondary: Color(0xffF5F5F6),
//       onSecondary: Color(0xff0D0B10),
//       secondaryContainer: Color(0xff323035),
//       onSecondaryContainer: Color(0xffF5F5F6),
//       tertiary: Color(0xffd4c78e),
//       onTertiary: Color(0xff383006),
//       tertiaryContainer: Color(0xff50471a),
//       onTertiaryContainer: Color(0xfff1e3a8),
//       error: Color(0xffD54B4F),
//       onError: Color(0xffFFFFFF),
//       errorContainer: Color(0xff391A1F),
//       onErrorContainer: Color(0xffD23538),
//       surface: Color(0xff1a110e),
//       onSurface: Color(0xfff1dfd9),
//       onSurfaceVariant: Color(0xffd8c2bb),
//       outline: Color(0xffa08d86),
//       outlineVariant: Color(0xff53433e),
//       shadow: Color(0xff53433e),
//       scrim: Color(0xff53433e),
//       inverseSurface: Color(0xfff1dfd9),
//       inversePrimary: Color(0xFFFE5D03),
//       primaryFixed: Color(0xffffdbce),
//       onPrimaryFixed: Color(0xff370e00),
//       primaryFixedDim: Color(0xffffb599),
//       onPrimaryFixedVariant: Color(0xff71361d),
//       secondaryFixed: Color(0xffffdbce),
//       onSecondaryFixed: Color(0xff2c160d),
//       secondaryFixedDim: Color(0xffe7beaf),
//       onSecondaryFixedVariant: Color(0xff5d4035),
//       tertiaryFixed: Color(0xfff1e3a8),
//       onTertiaryFixed: Color(0xff211b00),
//       tertiaryFixedDim: Color(0xffd4c78e),
//       onTertiaryFixedVariant: Color(0xff50471a),
//       surfaceDim: Color(0xff1a110e),
//       surfaceBright: Color(0xff423733),
//       surfaceContainerLowest: Color(0xff140c09),
//       surfaceContainerLow: Color(0xff231a16),
//       surfaceContainer: Color(0xff271e1a),
//       surfaceContainerHigh: Color(0xff322824),
//       surfaceContainerHighest: Color(0xff3d322f),
//     );
//   }
//
//   ThemeData dark() {
//     return theme(darkScheme());
//   }
//
//   ThemeData theme(ColorScheme colorScheme) => ThemeData(
//         useMaterial3: true,
//         brightness: colorScheme.brightness,
//         colorScheme: colorScheme,
//         fontFamily: 'Inter',
//         textTheme: textTheme.apply(
//           bodyColor: colorScheme.onSurface,
//           displayColor: colorScheme.onSurface,
//         ),
//         scaffoldBackgroundColor: colorScheme.surface,
//         canvasColor: colorScheme.surface,
//       );
// }
//
// class ExtendedColors extends ThemeExtension<ExtendedColors> {
//   const ExtendedColors({
//     required this.onSurfaceVariantLight,
//     required this.onSurfaceLight,
//     required this.surfaceContainerHighestLight,
//     required this.success,
//     required this.onSuccess,
//     required this.successContainer,
//     required this.onSuccessContainer,
//     required this.notice,
//     required this.onNotice,
//     required this.noticeContainer,
//     required this.onNoticeContainer,
//     required this.onSurfaceVariantMid,
//     required this.outlineLow,
//     required this.surfaceVariantLight,
//     required this.outlineStrong,
//     required this.surfaceVariantMid,
//     required this.surfaceVariantDark,
//   });
//
//   final Color onSurfaceVariantLight;
//   final Color onSurfaceLight;
//   final Color surfaceContainerHighestLight;
//   final Color success;
//   final Color onSuccess;
//   final Color successContainer;
//   final Color onSuccessContainer;
//   final Color notice;
//   final Color onNotice;
//   final Color noticeContainer;
//   final Color onNoticeContainer;
//   final Color onSurfaceVariantMid;
//   final Color outlineLow;
//   final Color surfaceVariantLight;
//   final Color outlineStrong;
//   final Color surfaceVariantMid;
//   final Color surfaceVariantDark;
//
//   @override
//   ThemeExtension<ExtendedColors> copyWith({
//     Color? onSurfaceVariantLight,
//     Color? onSurfaceLight,
//     Color? surfaceContainerHighestLight,
//     Color? success,
//     Color? onSuccess,
//     Color? successContainer,
//     Color? onSuccessContainer,
//     Color? notice,
//     Color? onNotice,
//     Color? noticeContainer,
//     Color? onNoticeContainer,
//     Color? onSurfaceVariantMid,
//     Color? outlineLow,
//     Color? surfaceVariantLight,
//     Color? outlineStrong,
//     Color? surfaceVariantMid,
//     Color? surfaceVariantDark,
//   }) {
//     return ExtendedColors(
//       onSurfaceLight: onSurfaceLight ?? this.onSurfaceLight,
//       success: success ?? this.success,
//       onSuccess: onSuccess ?? this.onSuccess,
//       successContainer: successContainer ?? this.successContainer,
//       onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
//       notice: notice ?? this.notice,
//       onNotice: onNotice ?? this.onNotice,
//       noticeContainer: noticeContainer ?? this.noticeContainer,
//       onNoticeContainer: onNoticeContainer ?? this.onNoticeContainer,
//       onSurfaceVariantLight:
//           onSurfaceVariantLight ?? this.onSurfaceVariantLight,
//       surfaceContainerHighestLight:
//           surfaceContainerHighestLight ?? this.surfaceContainerHighestLight,
//       onSurfaceVariantMid: onSurfaceVariantMid ?? this.onSurfaceVariantMid,
//       outlineLow: outlineLow ?? this.outlineLow,
//       surfaceVariantLight: surfaceVariantLight ?? this.surfaceVariantLight,
//       outlineStrong: outlineStrong ?? this.outlineStrong,
//       surfaceVariantMid: surfaceVariantMid ?? this.surfaceVariantMid,
//       surfaceVariantDark: surfaceVariantDark ?? this.surfaceVariantDark,
//     );
//   }
//
//   @override
//   ThemeExtension<ExtendedColors> lerp(
//     covariant ThemeExtension<ExtendedColors>? other,
//     double t,
//   ) {
//     if (other is! ExtendedColors) {
//       return this;
//     }
//     return ExtendedColors(
//       onSurfaceLight: Color.lerp(onSurfaceLight, other.onSurfaceLight, t) ??
//           AppColors.darkThemeSuccessContainer,
//       onSuccessContainer:
//           Color.lerp(onSuccessContainer, other.onSuccessContainer, t) ??
//               AppColors.lightThemeOnSuccessContainer,
//       success:
//           Color.lerp(success, other.success, t) ?? AppColors.lightThemeSuccess,
//       successContainer:
//           Color.lerp(successContainer, other.successContainer, t) ??
//               AppColors.lightThemeSuccessContainer,
//       onSuccess: Color.lerp(onSuccess, other.onSuccess, t) ??
//           AppColors.lightThemeOnSuccess,
//       onSurfaceVariantLight:
//           Color.lerp(onSurfaceVariantLight, other.onSurfaceVariantLight, t) ??
//               AppColors.lightThemeOnSurfaceVariantLight,
//       surfaceContainerHighestLight: Color.lerp(
//             surfaceContainerHighestLight,
//             other.surfaceContainerHighestLight,
//             t,
//           ) ??
//           AppColors.surfaceContainerHighestLight,
//       onSurfaceVariantMid:
//           Color.lerp(onSurfaceVariantMid, other.onSurfaceVariantMid, t) ??
//               AppColors.lightThemeOnSurfaceVariantMid,
//       outlineStrong: Color.lerp(outlineStrong, other.outlineStrong, t) ??
//           AppColors.lightThemeOutlineStrong,
//       outlineLow: Color.lerp(outlineLow, other.outlineLow, t) ??
//           AppColors.darkThemeOutlineLow,
//       onNoticeContainer:
//           Color.lerp(onNoticeContainer, other.onNoticeContainer, t) ??
//               AppColors.lightThemeOnNoticeContainer,
//       notice: Color.lerp(notice, other.notice, t) ?? AppColors.lightThemeNotice,
//       noticeContainer: Color.lerp(noticeContainer, other.noticeContainer, t) ??
//           AppColors.lightThemeNoticeContainer,
//       onNotice: Color.lerp(onNotice, other.onNotice, t) ??
//           AppColors.lightThemeOnNotice,
//       surfaceVariantLight:
//           Color.lerp(surfaceVariantLight, other.surfaceVariantLight, t) ??
//               AppColors.lightThemeSurfaceVariantLight,
//       surfaceVariantMid:
//           Color.lerp(surfaceVariantMid, other.surfaceVariantMid, t) ??
//               AppColors.lightThemeSurfaceVariantMid,
//       surfaceVariantDark:
//           Color.lerp(surfaceVariantDark, other.surfaceVariantDark, t) ??
//               AppColors.lightThemeSurfaceVariantDark,
//     );
//   }
// }
//
// class AppTextTheme extends ThemeExtension<AppTextTheme> {
//   final TextStyle displayXLarge;
//   final TextStyle displayLarge;
//   final TextStyle displayMedium;
//   final TextStyle displaySmall;
//   final TextStyle heading2XLarge;
//   final TextStyle headingXLarge;
//   final TextStyle headingLarge;
//   final TextStyle headingMedium;
//   final TextStyle headingSmall;
//   final TextStyle bodyLarge;
//   final TextStyle bodyMedium;
//   final TextStyle bodySmall;
//   final TextStyle bodyXSmall;
//   final TextStyle captionMedium;
//   final TextStyle codeMedium;
//   final TextStyle codeSmall;
//
//   const AppTextTheme({
//     required this.displayXLarge,
//     required this.displayLarge,
//     required this.displayMedium,
//     required this.displaySmall,
//     required this.heading2XLarge,
//     required this.headingXLarge,
//     required this.headingLarge,
//     required this.headingMedium,
//     required this.headingSmall,
//     required this.bodyLarge,
//     required this.bodyMedium,
//     required this.bodySmall,
//     required this.bodyXSmall,
//     required this.captionMedium,
//     required this.codeMedium,
//     required this.codeSmall,
//   });
//
//   // @override
//   // ThemeExtension<AppTextTheme> copyWith({
//   //   TextStyle? displayXLarge,
//   // }) {
//   //   return AppTextTheme(
//   //     displayXLarge: displayXLarge ?? this.displayXLarge,
//   //   );
//   // }
//
//   @override
//   ThemeExtension<AppTextTheme> copyWith({
//     TextStyle? displayXLarge,
//     TextStyle? displayLarge,
//     TextStyle? displayMedium,
//     TextStyle? displaySmall,
//     TextStyle? heading2XLarge,
//     TextStyle? headingXLarge,
//     TextStyle? headingLarge,
//     TextStyle? headingMedium,
//     TextStyle? headingSmall,
//     TextStyle? bodyLarge,
//     TextStyle? bodyMedium,
//     TextStyle? bodySmall,
//     TextStyle? bodyXSmall,
//     TextStyle? captionMedium,
//     TextStyle? codeMedium,
//     TextStyle? codeSmall,
//   }) {
//     return AppTextTheme(
//       displayXLarge: displayXLarge ?? this.displayXLarge,
//       displayLarge: displayLarge ?? this.displayLarge,
//       displayMedium: displayMedium ?? this.displayMedium,
//       displaySmall: displaySmall ?? this.displaySmall,
//       heading2XLarge: heading2XLarge ?? this.heading2XLarge,
//       headingXLarge: headingXLarge ?? this.headingXLarge,
//       headingLarge: headingLarge ?? this.headingLarge,
//       headingMedium: headingMedium ?? this.headingMedium,
//       headingSmall: headingSmall ?? this.headingSmall,
//       bodyLarge: bodyLarge ?? this.bodyLarge,
//       bodyMedium: bodyMedium ?? this.bodyMedium,
//       bodySmall: bodySmall ?? this.bodySmall,
//       bodyXSmall: bodyXSmall ?? this.bodyXSmall,
//       captionMedium: captionMedium ?? this.captionMedium,
//       codeMedium: codeMedium ?? this.codeMedium,
//       codeSmall: codeSmall ?? this.codeSmall,
//     );
//   }
//
//   @override
//   ThemeExtension<AppTextTheme> lerp(
//     covariant ThemeExtension<AppTextTheme>? other,
//     double t,
//   ) {
//     if (other is! AppTextTheme) {
//       return this;
//     }
//
//     return AppTextTheme(
//       displayXLarge: TextStyle.lerp(displayXLarge, other.displayXLarge, t) ??
//           displayXLarge,
//       displayLarge:
//           TextStyle.lerp(displayLarge, other.displayLarge, t) ?? displayLarge,
//       displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t) ??
//           displayMedium,
//       displaySmall:
//           TextStyle.lerp(displaySmall, other.displaySmall, t) ?? displaySmall,
//       heading2XLarge: TextStyle.lerp(heading2XLarge, other.heading2XLarge, t) ??
//           heading2XLarge,
//       headingXLarge: TextStyle.lerp(headingXLarge, other.headingXLarge, t) ??
//           headingXLarge,
//       headingLarge:
//           TextStyle.lerp(headingLarge, other.headingLarge, t) ?? headingLarge,
//       headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t) ??
//           headingMedium,
//       headingSmall:
//           TextStyle.lerp(headingSmall, other.headingSmall, t) ?? headingSmall,
//       bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t) ?? bodyLarge,
//       bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t) ?? bodyMedium,
//       bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t) ?? bodySmall,
//       bodyXSmall: TextStyle.lerp(bodyXSmall, other.bodyXSmall, t) ?? bodyXSmall,
//       captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t) ??
//           captionMedium,
//       codeMedium: TextStyle.lerp(codeMedium, other.codeMedium, t) ?? codeMedium,
//       codeSmall: TextStyle.lerp(codeSmall, other.codeSmall, t) ?? codeSmall,
//     );
//   }
// }

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280378503),
      surfaceTint: Color(4280378503),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291225599),
      onPrimaryContainer: Color(4278197806),
      secondary: Color(4280837002),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291487487),
      onSecondaryContainer: Color(4278197808),
      tertiary: Color(4278217072),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288540920),
      onTertiaryContainer: Color(4278198306),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294376190),
      onSurface: Color(4279770144),
      onSurfaceVariant: Color(4282468429),
      outline: Color(4285626494),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4287811317),
      primaryFixed: Color(4291225599),
      onPrimaryFixed: Color(4278197806),
      primaryFixedDim: Color(4287811317),
      onPrimaryFixedVariant: Color(4278209644),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278209392),
      tertiaryFixed: Color(4288540920),
      onTertiaryFixed: Color(4278198306),
      tertiaryFixedDim: Color(4286633179),
      onTertiaryFixedVariant: Color(4278210388),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981433),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278208614),
      surfaceTint: Color(4280378503),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282219423),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278208362),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282546849),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209360),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280516743),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376190),
      onSurface: Color(4279770144),
      onSurfaceVariant: Color(4282205257),
      outline: Color(4284047462),
      outlineVariant: Color(4285889409),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4287811317),
      primaryFixed: Color(4282219423),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280181381),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282546849),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280639879),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280516743),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216301),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981433),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199607),
      surfaceTint: Color(4280378503),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208614),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199610),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278208362),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200106),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209360),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294376190),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280165674),
      outline: Color(4282205257),
      outlineVariant: Color(4282205257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4292603903),
      primaryFixed: Color(4278208614),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202438),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278208362),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202441),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209360),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202934),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981433),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287811317),
      surfaceTint: Color(4287811317),
      onPrimary: Color(4278203467),
      primaryContainer: Color(4278209644),
      onPrimaryContainer: Color(4291225599),
      secondary: Color(4288072952),
      onSecondary: Color(4278203471),
      secondaryContainer: Color(4278209392),
      onSecondaryContainer: Color(4291487487),
      tertiary: Color(4286633179),
      onTertiary: Color(4278203962),
      tertiaryContainer: Color(4278210388),
      onTertiaryContainer: Color(4288540920),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279243799),
      onSurface: Color(4292862951),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4280378503),
      primaryFixed: Color(4291225599),
      onPrimaryFixed: Color(4278197806),
      primaryFixedDim: Color(4287811317),
      onPrimaryFixedVariant: Color(4278209644),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278209392),
      tertiaryFixed: Color(4288540920),
      onTertiaryFixed: Color(4278198306),
      tertiaryFixedDim: Color(4286633179),
      onTertiaryFixedVariant: Color(4278210388),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288074490),
      surfaceTint: Color(4287811317),
      onPrimary: Color(4278196262),
      primaryContainer: Color(4284192701),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288336381),
      onSecondary: Color(4278196264),
      secondaryContainer: Color(4284520127),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4286961888),
      onTertiary: Color(4278196764),
      tertiaryContainer: Color(4282883492),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243799),
      onSurface: Color(4294507519),
      onSurfaceVariant: Color(4291152850),
      outline: Color(4288521386),
      outlineVariant: Color(4286416010),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4278209901),
      primaryFixed: Color(4291225599),
      onPrimaryFixed: Color(4278194975),
      primaryFixedDim: Color(4287811317),
      onPrimaryFixedVariant: Color(4278205012),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278194976),
      secondaryFixedDim: Color(4288072952),
      onSecondaryFixedVariant: Color(4278205015),
      tertiaryFixed: Color(4288540920),
      onTertiaryFixed: Color(4278195222),
      tertiaryFixedDim: Color(4286633179),
      onTertiaryFixedVariant: Color(4278205761),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294507519),
      surfaceTint: Color(4287811317),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288074490),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294573055),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288336381),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293852927),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4286961888),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243799),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291152850),
      outlineVariant: Color(4291152850),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inversePrimary: Color(4278201666),
      primaryFixed: Color(4291881727),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288074490),
      onPrimaryFixedVariant: Color(4278196262),
      secondaryFixed: Color(4292078335),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288336381),
      onSecondaryFixedVariant: Color(4278196264),
      tertiaryFixed: Color(4288804348),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4286961888),
      onTertiaryFixedVariant: Color(4278196764),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

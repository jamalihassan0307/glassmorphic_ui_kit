/// Constants used throughout the glassmorphic UI kit.
///
/// This class provides default values and boundaries for various properties
/// used in glassmorphic widgets, ensuring consistency across the application.
class GlassConstants {
  /// The default blur intensity for glass effects.
  ///
  /// This value provides a balanced frosted glass appearance that works well
  /// in most scenarios. Value: 10.0
  static const double defaultBlur = 10.0;

  /// The default opacity for glass containers.
  ///
  /// This value creates a subtle transparency that maintains readability while
  /// showing the background. Value: 0.2 (20%)
  static const double defaultOpacity = 0.2;

  /// The minimum allowed blur value.
  ///
  /// Used to prevent performance issues with extremely low blur values.
  /// Value: 0.0
  static const double minBlur = 0.0;

  /// The maximum allowed blur value.
  ///
  /// Used to prevent performance issues with extremely high blur values.
  /// Value: 30.0
  static const double maxBlur = 30.0;

  /// The minimum allowed opacity value.
  ///
  /// Represents fully transparent. Value: 0.0 (0%)
  static const double minOpacity = 0.0;

  /// The maximum allowed opacity value.
  ///
  /// Represents fully opaque. Value: 1.0 (100%)
  static const double maxOpacity = 1.0;
}

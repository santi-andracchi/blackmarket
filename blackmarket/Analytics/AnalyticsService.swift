import Foundation
/**
 Protocol that defines the minimum API that an AnalyticsService should expose.
 The AnalyticsService is in charge of handling event logging
 for a specific analytics platform.
*/
protocol AnalyticsService {
  /// Sets up the underlying service. Eg: FirebaseApp.configure()
  func setup()

  /// Identifies the user with a unique ID
  func identifyUser(with userId: String)

  /// Logs an event with it's associated metadata
  func log(event: AnalyticsEvent)
  
  /// Resets all stored data and user identification
  func reset()
}

import UIKit

struct CosmosAccessibility {
    
  static func update(_ view: UIView, rating: Double, text: String?, settings: CosmosSettings) {
    view.isAccessibilityElement = true
    view.accessibilityTraits = settings.updateOnTouch ?
      UIAccessibilityTraits.adjustable :UIAccessibilityTraits.none
    var accessibilityLabel = CosmosLocalizedRating.ratingTranslation
    if let text = text, text != "" {
      accessibilityLabel += " \(text)"
    }
    view.accessibilityLabel = accessibilityLabel
    view.accessibilityValue = accessibilityValue(view, rating: rating, settings: settings)
  }

  static func accessibilityValue(_ view: UIView, rating: Double, settings: CosmosSettings) -> String {
    let accessibilityRating = CosmosRating.displayedRatingFromPreciseRating(rating,
      fillMode: settings.fillMode, totalStars: settings.totalStars)
    
    // Omit decimals if the value is an integer
    let isInteger = (accessibilityRating * 10).truncatingRemainder(dividingBy: 10) == 0
    
    if isInteger {
      return "\(Int(accessibilityRating))"
    } else {
      // Only show a single decimal place
      let roundedToFirstDecimalPlace = Double( round(10 * accessibilityRating) / 10 )
      return "\(roundedToFirstDecimalPlace)"
    }
  }
  
  /**

  Returns the amount of increment for the rating. When .half and .precise fill modes are used the
  rating is incremented by 0.5.
  
  */
  static func accessibilityIncrement(_ rating: Double, settings: CosmosSettings) -> Double {
    var increment: Double = 0
      
    switch settings.fillMode {
    case .full:
      increment = ceil(rating) - rating
      if increment == 0 { increment = 1 }

    case .half, .precise:
      increment = (ceil(rating * 2) - rating * 2) / 2
      if increment == 0 { increment = 0.5 }      
    }
    
    if rating >= Double(settings.totalStars) { increment = 0 }
            
    return increment
  }
  
  static func accessibilityDecrement(_ rating: Double, settings: CosmosSettings) -> Double {
    var increment: Double = 0
    
    switch settings.fillMode {
    case .full:
      increment = rating - floor(rating)
      if increment == 0 { increment = 1 }
      
    case .half, .precise:
      increment = (rating * 2 - floor(rating * 2)) / 2
      if increment == 0 { increment = 0.5 }
    }
    
    if rating <= settings.minTouchRating { increment = 0 }
    
    return increment
  }
}


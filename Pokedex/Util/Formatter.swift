import Foundation

func format(_ value: Double) -> String {
    let realValue = value / 10
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0
    
    if let formattedValue = formatter.string(from: NSNumber(value: realValue)) {
        return "\(formattedValue)"
    } else {
        return String(format: "%.2f", realValue)
    }
}

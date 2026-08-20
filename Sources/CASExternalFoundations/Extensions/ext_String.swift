/*-------------------------------------------------------------------------------------------------------------------------
     File: ext_String.swift
   Author: Kevin Messina
  Created: Jan 5, 2020
 Modified: 08/20/2026 04:43 PM EDT
  Version: 1
   Source: CODEX: (GPT-5) 🤖AI Code a portion or all of this code.
 
©2026 Creative App Solutions, LLC. - All Rights Reserved.
--------------------------------------------------------------------------------------------------------------------------
NOTES:
-------------------------------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------------------------------------------
    File: ext_String.swift
  Author: Kevin Messina
 Created: Jan 5, 2020
Modified: Jun 22, 2022
 
©2020-2026 Creative App Solutions, LLC. - All Rights Reserved.
----------------------------------------------------------------------------------------------------------------------------
NOTES:

2024_03_15 - Removed FormatAsAddress() and moved to Jurisdictions to quiet compiler complaints.
2022_06_22 - Added double line formatting to Address.
2021_05_26 - Added formatAsPhoneNumber and removeAllExcept... formatting functions to String.
--------------------------------------------------------------------------------------------------------------------------*/

import Foundation
import SwiftUI
import UIKit
import AudioToolbox

// MARK: - *** STRING ***
public extension String {
    var dashesIfEmpty: String { self.isEmpty ? dashesTxt : self }
    var YesOrNoIfEmpty: String { self.isEmpty ? "No" : "Yes" }

    var isInvalidDbId: Bool { (self == "-1") ?true :false }
    var asDbValue: Int64 { Int64(self) ?? -1 }

    func emptyAs(_ replacementText: String) -> String {
        return self.isEmpty ? replacementText : self
    }
    
    @MainActor
    func toResizableImage(color: Color) -> Image {
        // 1. Configure the bold font at a high resolution
        let font = UIFont.systemFont(ofSize: 500, weight: .bold)
        let uiColor = UIColor(color)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: uiColor
        ]
        
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        
        // 2. Compute the exact typographical bounding box (handles ascenders/descenders tightly)
        let line = CTLineCreateWithAttributedString(attributedString as CFAttributedString)
        let bounds = CTLineGetBoundsWithOptions(line, .useGlyphPathBounds)
        
        // Ensure valid drawing dimensions
        guard bounds.width > 0 && bounds.height > 0 else { return Image("") }
        
        // 3. Setup a transparent, scale-aware UIKit renderer
        let format = UIGraphicsImageRendererFormat.default()
        format.opaque = false
        
        let targetSize = CGSize(width: bounds.width, height: bounds.height)
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        
        // 4. Render with correct coordinate orientation
        let uiImage = renderer.image { context in
            let cgContext = context.cgContext
            
            // Invert the Y-axis to correct the upside-down rendering
            cgContext.translateBy(x: 0, y: targetSize.height)
            cgContext.scaleBy(x: 1.0, y: -1.0)
            
            // Shift to align precisely with the glyph path origin
            cgContext.textMatrix = .identity
            cgContext.translateBy(x: -bounds.origin.x, y: -bounds.origin.y)
            
            // Draw text vector lines
            CTLineDraw(line, cgContext)
        }
        
        // 5. Return the properly oriented, tightly cropped, resizable Image
        return Image(uiImage: uiImage)
            .resizable()
    }
    
    enum txtPadding: Int, CaseIterable, Identifiable {
        case none
        case space

        public var id: Int { self.rawValue }
    }
    
    enum txtSuffixes: Int, CaseIterable, Identifiable {
        // Distances
        case inch
        case inches
        case ft
        case feet
        case ftAbbrev
        case yds
        case yards
        // Speed
        case perSec
        case mph
        // Energy
        case ftLbs
        case ftLbsForce
        // Velocity
        case fps
        //Force
        case lbsPerInch2
        case lbsPerFt2
        case lbsPerFt3
        // Angles
        case degrees
        // Weather
        case tempF
        case tempC
        case barometer
        case mb
        // Ballistics
        case bore
        case caliber
        case gauge
        case gauges
        case cd
        case d2
        //Measurements
        case grain
        case grains
        case cm
        case m
        case m2
        case m3
        case mm
        case mm2
        case mm3
        //Time
        case sec
        case second
        //Misc
        case percent
        case quotes
        case per
        case each
        case PlusMinus

        public var id: Int { self.rawValue }
            
        public var name: String {
            switch self {
                    // Distances
                case .inch: return "\"" //Inch abbrev.
                case .inches: return "in." //Inch
                case .ft: return "ft" //feet abbrev.
                case .feet: return "feet" //feet
                case .ftAbbrev: return "'" //feet
                case .yds: return "yds" //yards abbrev.
                case .yards: return "yards" //yards
                    // Speed
                case .perSec: return "p/s" //Per Second
                case .mph: return "mph" //mph
                    // Energy
                case .ftLbs: return "ft⋅Lbs" //Foot Pounds
                case .ftLbsForce: return "ft⋅lb⨍" // Foot pounds Force
                    // Velocity
                case .fps: return "fps" // Feet Per Second
                    //Force
                case .lbsPerInch2: return "lb/in²"// Pounds per inch squared
                case .lbsPerFt2: return "lbs/ft²" // Pounds per Square Foot
                case .lbsPerFt3: return "lbs/ft³" // Pounds per Cubic Foot
                    // Angles
                case .degrees: return "°" //degrees
                    // Weather
                case .tempF: return "℉" //degrees F
                case .tempC: return "℃" //degrees C
                case .barometer: return "inHg" //inchesOfMercury
                case .mb: return "mb" //Millibars
                    // Ballistics
                case .bore: return "bore" //Bore
                case .caliber: return "cal." //Caliber
                case .gauge: return "ga" //Gauge Abbreviated
                case .gauges: return "gauge" //Gauge
                case .cd: return "cd" //Drag Coefficient
                case .d2: return "d²" //Drag Coefficient
                    //Measurements
                case .grain: return "gr" //Grains abbrev.
                case .grains: return "grains" //Grains
                case .cm: return "㎝" //Centimeters
                case .m: return "m" //meters
                case .m2: return "m²" //Meters Square
                case .m3: return "m³" //Meters Cubed
                case .mm: return "㎜" //Millimeters
                case .mm2: return "㎟" //Millimeters Squared
                case .mm3: return "㎣" //Millimeters Cubed
                    //Time
                case .sec: return "s" //Second abbrev
                case .second: return "sec" //Second
                    //Misc
                case .percent: return "%" //Percent
                case .quotes: return "\"\"" //""
                case .per: return "per" // per
                case .each: return "each" // per
                case .PlusMinus: return "±" //Plus or Minus
            }
        }

       
//        let ea: String = "ea" //Each
//        let fps: String = "fps" //Feet Per Second
//        let g: String = "g" //Grams
//        let gal: String = "㏿" //Gallons (US/Imperial)
//        let kg: String = "㎏" //Kilograms
//        let kgm3: String = "㎏/m³" //
//        let km: String = "㎞"  //Kilometers
//        let kp: String = "㎪"  //KiloPascals
//        let kph: String = "kph"  //Kilometers Per Hour
//        let lbs: String = "lbs" // Pounds
//        let mSec: String = "㎧" //meters per second
//        let oz: String = "oz"  //Ounces
//        let p: String = "㎩"  //Pascals
    }
    
    func with(_ format: txtSuffixes, pad: txtPadding = .space) -> String {
        if self == dashesTxt {
            return self
        }else{
            return "\(self)\(pad == .space ?" " :"")\(format.name)"
        }
    }

    var fromCSV_toString: [String] { self.split(separator: ",").map(String.init) }
    var fromCSV_toInt: [Int] { self.split(separator: ",").compactMap { Int(String($0).trimmingCharacters(in: .whitespacesAndNewlines)) } }
    var fromCSV_toInt64: [Int64] { self.split(separator: ",").compactMap { Int64(String($0).trimmingCharacters(in: .whitespacesAndNewlines)) } }
    
    func splitIDandValue() -> (id: Int, value: String) {
        let parts = self.components(separatedBy: ":")
        let idString = parts.first ?? "0"
        let valuePart = parts.count > 1 ? parts[1] : ""
        let idInt = Int(idString) ?? -1
        
        return (id: idInt, value: valuePart.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    func pluralized(count: Int) -> String {
        var attributed = AttributedString(localized: "^[\(count) \(self)](inflect: true)")
        
        // Remove the count and space
        if let range = attributed.range(of: "\(count) ") {
            attributed.removeSubrange(range)
        }

        let newString: String = String(attributed.characters).removeAllCharsExceptAlpha
        
        return newString
    }

    // MARK: Number of occurences of string
    func numberOfOccurrencesOf(_ string: String) -> Int {
        return self.components(separatedBy:string).count - 1
    }
    
    // MARK: LENGTH
    func maxLength(for text: String, font: UIFont) -> CGFloat {
        let label = UILabel()
        label.font = font
        label.text = text
        return label.intrinsicContentSize.width
    }
    
    func length(_ stringvar: inout String, length: Int, vibrate:Bool = false) {
        if (stringvar.count > length) {
            stringvar = String(stringvar.prefix(length))
            if vibrate {
                AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) { return }
            }
        }
    }

    // MARK: TRIMMING
    enum TrimmingOptions {
        case replaceAll
        case leading
        case trailing
        case ends
    }
    
    func trim(_ spaces: TrimmingOptions, using characterSet: CharacterSet = .whitespacesAndNewlines) ->  String {
        switch spaces {
            case .replaceAll: return trimAllSpaces(using: characterSet)
            case .leading: return trimLeadingSpaces(using: characterSet)
            case .trailing: return trimTrailingSpaces(using: characterSet)
            case .ends:  return trimLeadingAndTrailingSpaces(using: characterSet)
        }
    }
    
    private func trimLeadingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }
        
        return String(self[index...])
    }
    
    private func trimTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = lastIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }
        
        return String(self[...index])
    }
    
    private func trimLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
    
    private func trimAllSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return components(separatedBy: characterSet).joined()
    }

    // MARK: IS NUMBER
    var isNumber : Bool {
        get{
            return !self.isEmpty && (rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil)
        }
    }

    // MARK: SUBSTRING
    /// getIndex(position positionIndex: Int) -> String.Index
    /// - Parameter positionIndex: Integer of position in string.
    /// - Returns: String.Index of positionIndex.
    /// - Usage:
    ///             let str = "Hello, playground"
    ///             print (str.getIndex(position: 7))
    func getIndex(position positionIndex: Int) -> String.Index {
        guard
            positionIndex >= 0
        else {
            return String.Index(utf16Offset: 0, in: self)
        }
        
        let position = String.Index(utf16Offset: positionIndex, in: self)
        return position
    }

    /// substring(from positionIndex: Int) -> String
    /// - Parameter positionIndex: Integer starting position in string.
    /// - Returns: String (subString) from positionIndex to END(count) of original string.
    /// - Usage:
    ///             let str = "Hello, playground"
    ///             print (str.substring(from: 7)) // "playground"
    func substringFromStart(_ positionIndex: Int) -> String {
        guard
            positionIndex >= 0 &&
            positionIndex < count
        else {
            return ""
        }
        
        let index = self.index(self.startIndex, offsetBy: positionIndex)
        let subString = String(self[..<index])
        return subString
    }
    
    /// substring(to positionIndex: Int) -> String
    /// - Parameter positionIndex: Integer starting position in string.
    /// - Returns: String (subString) from START(0) to positionIndex of original string.
    /// - Usage:
    ///             let str = "Hello, playground"
    ///             print (str.substring(to: 5)) // "Hello"
    func substringToEnd(_ positionIndex: Int) -> String {
        guard
            positionIndex <= self.count
        else {
            return ""
        }
        
        let startIndex = self.index(self.startIndex, offsetBy: positionIndex)
        let subString = String(self[startIndex...])
        return subString
    }
    
    /// substring(fromTo positionRange: ClosedRange<Int>) -> String
    /// - Parameter positionRange: Integer closed range representing START and END positions.
    /// - Returns:  String (subString) START(positionRange.lowerBound) to END(positionRange.upperBound)
    ///             of original string.
    /// - Usage:
    ///             let str = "Hello, playground"
    ///             print (str.substring(fromTo: 2...4)) // "llo"
    func substring(fromTo positionRange: ClosedRange<Int>) -> String {
        guard
            self.count > 0 &&
            positionRange.upperBound > 0
        else {
            return ""
        }

        let lowerBound = max(positionRange.lowerBound, 0)
        let upperBound = min(positionRange.upperBound, self.count)
        let startIndex = index(self.startIndex, offsetBy: lowerBound)
        let endIndex = index(self.startIndex, offsetBy: upperBound)
        
        let subString = String(self[startIndex..<endIndex])
        return subString
    }

    func beforeChar(_ delimiter: Character) -> String {
        guard
            let index = firstIndex(of: delimiter)
        else {
            return ""
        }

        let substring = String(prefix(upTo: index))
        return substring
    }
    
    func afterChar(_ delimiter: Character) -> String {
        guard
            let index = firstIndex(of: delimiter)
        else {
            return ""
        }

        let substring = String(suffix(from: index).dropFirst())
        return substring
    }

    // MARK: SUBSCRIPT
    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }
    
/// let s = "hello"
/// s[0..<3] // "hel"
/// s[3...]  // "lo"
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    
    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        return String(self[start...])
    }
    
    // MARK: EMAIL ADDRESS Validation
    var isValidEmailAddress: Bool {
        if self.count > 100 {
            return false
        }
        
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)

        return emailPredicate.evaluate(with: self)
    }

    // MARK: Convert String to Date
    func toConvertedString(from: Date.Formats, to: Date.Formats) -> String {
        guard
            let newDate: Date = self.toDate(format: from.rawValue)
        else {
            return dashesTxt
        }
        
        let newDateTxt: String = newDate.formattedAs(to.rawValue)
        
        return newDateTxt
    }

    func formatAsDateFromdb() -> String {
        return self.toConvertedDate(from: .yyyy_MM_dd, to: .MMM_d_yyyy)
    }

    func formatAsFullDateFromdb() -> String {
        return self.toConvertedDate(from: .yyyy_MM_dd, to: .MMMM_d_yyyy_EEEE)
    }

    func formatAsDateTodb() -> String {
        return self.toConvertedDate(from: .MMM_d_yyyy, to: .yyyy_MM_dd)
    }

    func toConvertedDate(from: Date.Formats, to: Date.Formats) -> String {
        guard
            let newDate: Date = self.toDate(format: from.rawValue)
        else {
            return dashesTxt
        }

        let newDateTxt: String = newDate.formattedAs(to.rawValue)

        return newDateTxt
    }

    func toDate(format:String) -> Date? {
        let formatter = DateFormatter()
            formatter.dateFormat = "\( format )"

        return formatter.date(from: self)
    }

    func toDateFormat(_ format:Date.formats) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "\( format )"
        
        return formatter.date(from: self)
    }

    func toDatedb() -> Date {
        return self.toDateFormatType(.yyyy_MM_dd) ?? Date()
    }

    func toDateFormatType(_ format: Date.Formats) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue

        return formatter.date(from: self)
    }
    
    func toDateISO() -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate]

        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        return nil
    }

    // MARK: -
    var toDouble: Double? { NumberFormatter().number(from: self)?.doubleValue }
    var toDecimal: Decimal? { NumberFormatter().number(from: self)?.decimalValue }
    var toInt: Int? { NumberFormatter().number(from: self)?.intValue }
    var toInt64: Int64? { NumberFormatter().number(from: self)?.int64Value }

    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.text = self
            label.font = font
            label.sizeToFit()
        
        return label.frame.height
    }
    
    // MARK: Remove all chars except Numbers
    var removeAllCharsExceptCurrency:String {
        return String(self.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: acceptableCharSets.currency_US)) != nil })
    }
    
    var removeAllCharsExceptNumeric:String {
        return String(self.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: acceptableCharSets.numeric)) != nil })
    }
    
    var removeAllCharsExceptNumbersOnly:String {
        return String(self.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: acceptableCharSets.numbersOnly)) != nil })
    }

    var removeAllCharsExceptDecimal:String {
        return String(self.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: acceptableCharSets.decimalPad)) != nil })
    }
    
    // MARK: Remove all chars except alphas
    var removeAllCharsExceptAlpha:String {
        return String(self.filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: acceptableCharSets.alphaOnly)) != nil })
    }
    
    // MARK: SQL Remove double \\ in Text string from database
    enum ReplacementOptions:Int {
        case doubleBackSlashes
        case doubleApostrophes
        case doubleQuotes
        case quotes
        case allDoubleControlChars
    }
    
    var replaceQuotes:String {
        return self.replacingOccurrences(of: acceptableCharSets.SQL.quotes, with: "")
    }
    
    var replaceDoubleBackSlashes:String {
        return self.replacingOccurrences(of: acceptableCharSets.SQL.doubleBackSlashes, with: #"\"#)
    }
    
    var replacedoubleQuotes:String {
        return self.replacingOccurrences(of: acceptableCharSets.SQL.doubleQuotes, with: "\"" )
    }
    
    var replaceCR:String {
        return self.replacingOccurrences(of: "\\n", with: "\n")
    }
                                         
    var replaceDoubleApostrophes:String {
        return self.replacingOccurrences(of: acceptableCharSets.SQL.doubleApostrophes, with: "'" )
    }

    var replaceAllDoubleControlChars:String {
        var temp = self.replaceDoubleBackSlashes
        temp = self.replaceDoubleApostrophes
        temp = self.replacedoubleQuotes
        
        return temp
    }
    
    func replaceSQLChars(_ replacementOptions: ReplacementOptions) ->  String {
        switch replacementOptions {
            case .doubleBackSlashes: return self.replaceDoubleBackSlashes
            case .doubleApostrophes: return self.replaceDoubleApostrophes
            case .doubleQuotes: return self.replacedoubleQuotes
            case .allDoubleControlChars: return self.replaceAllDoubleControlChars
            case .quotes: return self.replaceAllDoubleControlChars
        }
    }

// MARK: Markdown -> AttributedString
    func markdownToAttributed() -> AttributedString {
        do {
            return try AttributedString(
                markdown: self.trim(.trailing),
                options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
            )
        } catch {
            return AttributedString("Error parsing markdown: \(error)")
        }
    }

    // MARK: Convert String to US Zip Code
    var formatAsZipCode:String {
        var formattedString:String = ""
        let strippedValue:String = self.removeAllCharsExceptNumbersOnly
        let length = strippedValue.count
        
        switch length { // #####, #####-####
            case ..<1 : formattedString = ""
            case 1...5 : formattedString = "\(strippedValue)"
            case 6...9 : formattedString = "\(strippedValue[0..<5])-\(strippedValue[5..<length])"
            default: formattedString = strippedValue
        }
        
        return formattedString
    }

    var isValidZipCode: Bool {
        let strippedValue:String = self.removeAllCharsExceptNumbersOnly
        let length = strippedValue.count
        
        switch length { // #####, #####-####
            case 5, 9 : return true
            default: return false
        }
    }

    // MARK: Convert String to Phone Number
    var formatAsPhoneNumber:String {
        var formattedString:String = ""
        let strippedValue:String = self.removeAllCharsExceptNumbersOnly
        let length = strippedValue.count

        switch length { // ###-####, (###) ###-####, +# (###) ###-####
            case ..<1 : formattedString = ""
            case 1...6 : formattedString = "\(strippedValue)"
            case 7...7 : formattedString = "\(strippedValue[0..<3])-\(strippedValue[3..<length])"
            case 8...10 : formattedString = "(\(strippedValue[0..<3])) \(strippedValue[3..<6])-\(strippedValue[6..<length])"
            case 11...12 : formattedString = "(\(strippedValue[0..<3])) \(strippedValue[3..<6])-\(strippedValue[6..<length])"
            default: formattedString = strippedValue
        }
        
        return formattedString
    }

    var isValidPhoneNumber: Bool {
        let strippedValue:String = self.removeAllCharsExceptNumbersOnly
        let length = strippedValue.count
        
        switch length { // ###-####, (###) ###-####, +# (###) ###-####
            case 7, 10 : return true
            default: return false
        }
    }

    // MARK: URL: Validate
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    // MARK: Convert String to U.S. or Canadian Social Security Number
    var isValidSocSecNum: Bool {
        self.removeAllCharsExceptNumbersOnly.count == 9
    }

    func formatAsSocSecNum(isUSA:Bool) -> String {
        // US Format is ###-##-###, Canadian Format is ###-###-###
        
        var formattedString:String = ""
        let strippedValue:String = self.removeAllCharsExceptNumbersOnly
        let length = strippedValue.count

        if isUSA {
            switch length { // ###, ###-##, ###-##-####
                case ..<1 : formattedString = ""
                case 1...3 : formattedString = "\(strippedValue)"
                case 4...5 : formattedString = "\(strippedValue[0..<3])-\(strippedValue[3..<length])"
                case 6...9 : formattedString = "\(strippedValue[0..<3])-\(strippedValue[3..<5])-\(strippedValue[5..<length])"
                default: formattedString = strippedValue
            }
        }else{ //Canada
            switch length { // ###, ###-###, ###-###-###
                case ..<1 : formattedString = ""
                case 1...3 : formattedString = "\(strippedValue)"
                case 4...6 : formattedString = "\(strippedValue[0..<3])-\(strippedValue[3..<length])"
                case 7...9 : formattedString = "\(strippedValue[0..<3])-\(strippedValue[3..<6])-\(strippedValue[6..<length])"
                default: formattedString = strippedValue
            }

        }

        return formattedString
    }
}


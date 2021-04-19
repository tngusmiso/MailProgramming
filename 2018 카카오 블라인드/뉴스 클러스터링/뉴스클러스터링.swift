import Foundation

extension String {
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex,offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}

func isAlphabet(_ str: String) -> Bool {
    let pattern = "^[a-z]*$"
    return str.range(of: pattern, options: .regularExpression) != nil
}

func solution(_ str1:String, _ str2:String) -> Int {
    var dict1: [String:Int] = [:]
    var dict2: [String:Int] = [:]
    
    for i in 0..<str1.count-1 {
        let substring1 = str1[i..<i+2].lowercased()
        if isAlphabet(substring1) {
            if dict1[substring1] != nil {
                dict1[substring1]! += 1
            } else {
                dict1[substring1] = 1
            }
        }
    }
    
    for i in 0..<str2.count-1 {
        let substring2 = str2[i..<i+2].lowercased()
        if isAlphabet(substring2) {
            if dict2[substring2] != nil {
                dict2[substring2]! += 1
            } else {
                dict2[substring2] = 1
            }
        }
    }
    
    if dict1.isEmpty && dict2.isEmpty {
        return 65536
    }
    
    let keySet = Set(dict1.keys).union(Set(dict2.keys))
    var intersectionCount = 0
    var unionCount = 0
    for key in keySet {
        if let value1 = dict1[key], let value2 = dict2[key] {
            let min = value1 < value2 ? value1 : value2
            let max = value1 > value2 ? value1 : value2
            intersectionCount += min
            unionCount += max
        } else if let value1 = dict1[key] {
            unionCount += value1
        } else if let value2 = dict2[key] {
            unionCount += value2
        }
    }
    
    let result = Float(intersectionCount) / Float(unionCount) * 65536
    return Int(result)
}
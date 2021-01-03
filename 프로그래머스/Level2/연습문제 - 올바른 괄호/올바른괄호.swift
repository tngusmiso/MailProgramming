import Foundation

func solution(_ s:String) -> Bool {
    var openCount: Int = 0
    
    for c in s {
        switch c {
        case "(":
            openCount += 1
        case ")":
            if openCount == 0 { return false }
            openCount -= 1
        default: continue
        }
    }
    
    if openCount == 0 {return true}
    return false
}
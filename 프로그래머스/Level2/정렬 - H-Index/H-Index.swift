func solution(_ citations:[Int]) -> Int {
    var sorted = citations.sorted(by: >)
    for h in (1...sorted.count).reversed() {
        if sorted[h-1] >= h { 
            return h 
        }
    }
    
    return 0
}
func solution(_ s:String) -> String {
    let halfIdx = s.index(s.startIndex, offsetBy: s.count/2)
    
    if s.count % 2 == 0 {
        let frontIdx = s.index(halfIdx, offsetBy: -1)
        return String(s[frontIdx...halfIdx])
    }
    return String(s[halfIdx])
}
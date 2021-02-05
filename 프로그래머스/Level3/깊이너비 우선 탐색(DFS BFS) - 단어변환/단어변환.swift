import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var curStep: [String] = []
    var nextStep: [String] = []
    var visited: Set<String> = []
    
    curStep.reserveCapacity(words.count)
    
    var curWord = begin
    var depth: Int = 0  
    while visited.count <= words.count {
        // 현재 단어가 target이면 리턴
        if curWord == target {
            return depth
        }
        // 현재 단어와 한글자 차이인 단어들을 nextStep에 넣기
        for word in words {
            if visited.contains(word) {continue}
            if compareDiff(curWord, word) == 1 {
                nextStep.append(word)
            }
        }        
        // 현재 step을 다 순회 했으면 다음 step으로 이동
        if curStep.isEmpty {
            curStep = nextStep
            nextStep = []
            depth += 1
        }
        curWord = curStep.removeFirst()
        visited.insert(curWord)
    }
    
    return 0
}

func compareDiff(_ str1: String, _ str2: String) -> Int {
    var count = 0
    for i in 0..<str1.count {
        if str1[str1.index(str1.startIndex, offsetBy: i)] != str2[str2.index(str2.startIndex, offsetBy: i)] {
            count += 1
        }
    }
    return count
}
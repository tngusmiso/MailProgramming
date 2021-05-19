import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playsByGenre: [String:Int] = [:]
    var IDsByGenre: [String:[Int]] = [:]
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        if let pCount = playsByGenre[genre] {
            playsByGenre[genre] = pCount + play
        } else {
            playsByGenre[genre] = play
        }
        if IDsByGenre[genre] != nil {
            IDsByGenre[genre]!.append(i)
        } else {
            IDsByGenre[genre] = [i]
        }
    }
    
    let bestGenre: [String] = Array(playsByGenre.keys).sorted{
        return playsByGenre[$0]! > playsByGenre[$1]!
    }
    
    var answer: [Int] = []
    for genre in bestGenre {
        let IDs = IDsByGenre[genre]!.sorted{
            return plays[$0] > plays[$1]
        }
        answer.append(IDs[0])
        if IDs.count > 1 {
            answer.append(IDs[1])
        }
    }
    return answer
}
import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // 노란색이 n*m이라면, 갈색은 2n+2m+4 = n*m + 2(n+m) + 4
    // 총 가로 세로는 (n+2)*(m+2)
    let yellowDivisors = divisors(yellow)
    let totalDivisors = divisors(yellow+brown)
    
    for td in totalDivisors {
        for yd in yellowDivisors {
            if td == yd+2 && (yellow+brown)/td == yellow/yd+2 {
                return [(yellow+brown)/td, td]
            }
        }
    }
    
    return []
}

func divisors(_ num: Int) -> [Int] {
    var answer = [Int]()
    for i in 1...num {
        if num%i == 0 {
            answer.append(i)
        }
    }
    return answer
}
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    func binarySearch(start: Int64, end: Int64) -> Int64 {
        let mid = (start+end)/2
        let midSum = available(in: mid)
        
        // print("start:\(start), mid:\(mid), end: \(end)")
        if midSum == n {
            let leftSum = available(in: mid-1)
            if leftSum < n {
                return mid
            }
            return binarySearch(start: start, end: mid-1)
        }
        if midSum < n {
            let rightSum = available(in: mid+1)
            if rightSum >= n {
                return mid+1
            }
            return binarySearch(start: mid+1, end: end)
        }
        
        return binarySearch(start: start, end: mid-1)
    }
    
    func available(in minute: Int64) -> Int64 {
        var sum: Int64 = 0
        for i in 0..<times.count {
            sum += minute/Int64(times[i])
        }
        return sum
    }
    
    return binarySearch(start: 0, end: Int64(n) * Int64(times.max()!))
}
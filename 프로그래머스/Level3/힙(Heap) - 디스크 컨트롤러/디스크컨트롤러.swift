import Foundation

struct Job {
    let request: Int
    let excute: Int
}

func solution(_ jobs:[[Int]]) -> Int {
    // 요청시간 작은 순으로 정렬 후, 수행시간 작은 순으로 정렬
    let jobs = jobs.map {
        Job(request: $0[0], excute: $0[1])
    }.sorted { 
        if $0.request == $1.request { return $0.excute < $1.excute } 
        return $0.request < $1.request
    }
    
    // 수행시간으로 정렬 후, 요청시간으로 정렬
    let waitingQueue = PriorityQueue<Job> { 
        if $0.excute == $1.excute { return $0.request < $1.request }
        return $0.excute < $1.excute
    }
    
    // 시작 기준은 첫번째 들어온 작업!
    var requestTime: Int = jobs[0].request // 요청시간
    var endTime: Int = jobs[0].request + jobs[0].excute // 시작시간 + 수행시간
    var currentTime: Int = endTime
    
    var requestJob: Int = 1
    var doneJob: Int = 0
    var sumTime: Int = 0
    
    while true {
        // 모든 작업을 완료했다면 평균 시간 반환
        if doneJob >= jobs.count {
            return sumTime / jobs.count
        }
        
        // 현재 시간 이전에 들어온 요청을 모조리 추가한다.
        if requestJob < jobs.count && jobs[requestJob].request <= currentTime {
            waitingQueue.enqueue(jobs[requestJob])
            requestJob += 1
            continue // 현재시간은 증가시키지 않는다.
        }
        
        // 현재 시간에 종료된 작업이 있다면
        if currentTime == endTime {
            sumTime += endTime - requestTime
            doneJob += 1
            
            // 새로운 작업 꺼내오기
            if let nextJob = waitingQueue.dequeue() {
                requestTime = nextJob.request
                endTime = currentTime + nextJob.excute
                currentTime = endTime // 새로운 작업이 종료되는 시점으로 이동
                continue
            }
        }
        
        // 대기열에 새로운 작업을 꺼낼 것이 없다면, 다음 요청을 찾아 종료 시점으로 이동
        if requestJob < jobs.count {
            let nextJob = jobs[requestJob]
            requestJob += 1

            requestTime = nextJob.request
            endTime = requestTime + nextJob.excute
            currentTime = endTime
            
            continue
        }
        return sumTime / jobs.count
    }
    return sumTime / jobs.count
}

class PriorityQueue<T> {    // 우선순위 큐
    var heap: [T] = [] 
    let ordered: (T, T) -> Bool // 앞의 값이 위로
    
    init( by ordered: @escaping (T, T) -> Bool) {
        self.ordered = ordered
    }
    
    func enqueue(_ value: T) {
        heap.append(value)
        upHeapify()
    }
    
    func upHeapify(){
        var index = heap.count-1
        var parentIndex = (index - 1) / 2 // 8->3, 7->3
        while index > 0 && !ordered(heap[parentIndex], heap[index]) {
            swap(a: parentIndex, b: index)
            index = parentIndex
            parentIndex = (index - 1) / 2
        }
    }
    
    func dequeue() -> T? { // 제거된 값 반환
        if heap.count == 0 {
            return nil
        }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        let removedValue = heap[0]
        swap(a: 0, b: heap.count-1)
        heap.removeLast()
        
        downHeapify()
        return removedValue
    }
    
    func downHeapify() {
        var index = 0
        guard var childIndex = getPostChildIndex(index) else {
            return
        }
        
        while childIndex < heap.count && !ordered(heap[index], heap[childIndex]) {
            swap(a: index, b: childIndex)
            index = childIndex
            
            let optionalChildIndex = getPostChildIndex(index)
            if optionalChildIndex == nil { break }
            childIndex =  optionalChildIndex!
        }
    }
    
    func peek() -> T {
        heap[1]
    }
    
    func swap(a: Int, b: Int) {
        let temp = heap[a]
        heap[a] = heap[b]
        heap[b] = temp
    }
    
    func getPostChildIndex(_ index: Int) -> Int? {
        let leftIndex = (index+1)*2-1
        let rightIndex = (index+1)*2
        
        if rightIndex < heap.count {
            return ordered(heap[leftIndex], heap[rightIndex]) ? leftIndex : rightIndex
        }
        
        if leftIndex < heap.count {
            return leftIndex
        }
    
        return nil
    }
}
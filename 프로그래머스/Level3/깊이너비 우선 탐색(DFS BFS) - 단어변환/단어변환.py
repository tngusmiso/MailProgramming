def checkDiff(word1, word2):
    if len(word1) != len(word1):
        return -1
    
    count = 0
    for i in range(len(word1)):
        if word1[i] != word2[i]:
            count += 1
            
    return count

def bfs(graph, begin, target):
    queue = [[begin,0]] # 방문할 노드의 문자(값)와 깊이를 저장
    visited = []        # 방문한 노드의 문자(값)만 저장
    
    while queue:
        # 큐에서 값을 하나 꺼낸다
        node = queue[0]
        del queue[0]
        
        word = node[0]
        depth = node[1]
        
        # 꺼낸 값이 target과 같다.
        if word == target:
            return depth
        
        # 방문한 적이 없는 node다.        
        if word not in visited:
            visited.append(word) # 방문 기록에 추가
            
            # 모든 자식노드를 깊이+1과 zip()하여 큐에 추가(extend)한다.
            queue.extend(zip(graph[word], [depth+1]*len(graph[word]))) 
    
    # 모든 queue를 다 돌 동안 target을 만나지 못했다
    return 0
 
def solution(begin, target, words):
    # 명백한 반환 조건
    if target not in words:
        return 0
    
    # 그래프 만들기
    graph = {}
    
    ## begin : word
    for word in words:
        if checkDiff(begin, word) == 1:
            if word in graph:
                graph[word].append(begin)
            else:
                graph[word] = [begin]
            if begin in graph:
                graph[begin].append(word)
            else:
                graph[begin] = [word]
                
    ## word : word
    for i in range(len(words)):
        for j in range(i+1, len(words)):
            if checkDiff(words[i], words[j]) == 1:
                if words[i] in graph:
                    graph[words[i]].append(words[j])
                else:
                    graph[words[i]] = [words[j]]
                if words[j] in graph:
                    graph[words[j]].append(words[i])
                else:
                    graph[words[j]] = [words[i]]
        
    return bfs(graph, begin, target)
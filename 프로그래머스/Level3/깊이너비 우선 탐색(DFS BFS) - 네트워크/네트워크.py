visited = set()

def dfs(computers, start):
    global visited
    
    cur_visit = set()
    stack = list()
    stack.append(start)
    
    while stack:
        node = stack.pop()
        for com in range(len(computers[node])):
            if computers[node][com] == 1 and com not in cur_visit:
                # print(com)
                cur_visit.add(com)
                stack.append(com)
                
    visited.update(cur_visit)
    return cur_visit
    
    
def solution(n, computers):
    global visited
    networks = 0
    
    for com in range(len(computers)):
        if com not in visited:
            dfs(computers, com)
            networks += 1
        
    return networks
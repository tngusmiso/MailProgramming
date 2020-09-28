def solution(m, n, puddles):
    storage = [[0 for i in range(m)] for j in range(n)]
    
    def shortPath(i, j):
        
        # 물에 잠긴 곳
        if [j, i] in puddles:
            storage[i-1][j-1] = 0
            return 0
        
        if storage[i-1][j-1] != 0:
            return storage[i-1][j-1]
        
        # 출발지일 경우
        if (i-1, j-1) == (0, 0):
            storage[i-1][j-1] = 1
            return 1
        
        # 위에서 올 수 있음
        if i > 1:
            storage[i-1][j-1] = storage[i-1][j-1] + shortPath(i-1, j)
            
        # 왼쪽에서 올 수 있음
        if j > 1:
            storage[i-1][j-1] = storage[i-1][j-1] + shortPath(i, j-1)
        
        return storage[i-1][j-1]
    
    return shortPath(n,m) % 1000000007
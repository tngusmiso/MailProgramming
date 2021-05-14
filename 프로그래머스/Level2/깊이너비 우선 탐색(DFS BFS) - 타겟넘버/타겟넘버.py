answer = 0
def dfs(numbers, target, result, index):
    global answer
    
    if index >= len(numbers):
        if target == result:
            answer += 1
        return
    
    dfs(numbers, target, result+numbers[index], index+1)
    dfs(numbers, target, result-numbers[index], index+1)
    
def solution(numbers, target):
    dfs(numbers, target, 0, 0)
    return answer
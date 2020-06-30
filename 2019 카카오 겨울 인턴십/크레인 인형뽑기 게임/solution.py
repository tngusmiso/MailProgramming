def solution(board, moves):
    answer = 0
    basket = []
    top = {}
    
    for move in moves: # move칸의 인형
        
        if move not in top: # move칸의 꼭대기 정보가 없는 경우
            top[move] = len(board)
            
            for i in range(len(board)): # move 칸에서 0이 아닌 칸이 나올 때 까지 탐색
                if board[i][move-1] != 0:
                    top[move] = i
                    break
                    
        # move칸의 꼭대기가 board의 높이와 같다면, move칸은 빈칸이다.
        if top[move] >= len(board):
            continue    # 다음칸으로 이동
        
        
        doll = board[top[move]][move-1] # move칸에서 뽑은 인형
        if len(basket) > 0 and basket[-1]==doll: # 연속으로 같은 인형일 경우 -> 터짐
            answer += 2
            basket.pop()
        else: # 연속으로 같은 인형이 아닐 경우 -> basket에 인형 추가
            basket.append(doll)

        board[top[move]][move-1] = 0 # 뽑은 인형은 0으로 변경
        top[move] += 1 # 꼭대기 정보 업데이트
            
    return answer
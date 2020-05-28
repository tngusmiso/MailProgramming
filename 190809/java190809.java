import java.util.Arrays;

public class java190809 {
    enum Direction { RIGHT, DOWN, LEFT, UP}
    public static void main(String[] args) {
        int[][] input = {{1, 2, 3},
                        {8, 9, 4},
                        {7, 6, 5}};
        int[][] input2 = {{ 1,  2,  3,  4,  5},
                        {   6,  7,  8,  9,  10},
                        {   11, 12, 13, 14, 15},
                        {   16, 17, 18, 19, 20},
                        {   21, 22, 23, 24, 25}};
                        
        System.out.println(Arrays.toString(solution(input)));
        System.out.println(Arrays.toString(solution(input2)));
    }

    private static int[] solution(int[][] array) {
        int[] answer = new int[array.length * array[0].length];

        Direction dir = Direction.RIGHT;
        int row = 0, col = 0;
        int maxCol = array[0].length - 1;
        int maxRow = array.length - 1;
        int minCol = 0;
        int minRow = 1;

        for(int i = 0; i<answer.length; i++) {
            answer[i] = array[row][col];

            switch (dir) {
                case RIGHT:
                    col++;
                    if(col>=maxCol) {
                        maxCol--;
                        dir = Direction.DOWN;
                    }
                    break;
                case DOWN:
                    row++;
                    if(row>=maxRow) {
                        maxRow--;
                        dir = Direction.LEFT;
                    }
                    break;
                case LEFT:
                    col--;
                    if(col<=minCol){
                        minCol++;
                        dir = Direction.UP;
                    }
                    break;
                case UP:
                    row--;
                    if(row<=minRow){
                        minRow++;
                        dir = Direction.RIGHT;
                    }
                    break;
            }

        }
        return answer;
    }
}
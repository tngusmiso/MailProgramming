import java.util.LinkedList;

class java190729{
    static class Coord {
        int row, col;   // 행, 열
        int dist;       // 거리

        public Coord(int row, int col, int dist){
            this.row = row;
            this.col = col;
            this.dist = dist;
        }
    }

    public static void main(String[] args) {
        int[][] map = new int[][]  {{1, 0, 0, 1, 1, 0},
                                    {1, 0, 0, 1, 0, 0},
                                    {1, 1, 1, 1, 0, 0},
                                    {1, 0, 0, 0, 0, 1},
                                    {1, 1, 1, 1, 1, 1}};

        System.out.println(solution(map, new int[]{0,0}, new int[]{0,4}));  //8
        System.out.println(solution(map, new int[]{0,0}, new int[]{3,5}));  //10
    }

    private static int solution(int[][] map, int[] start, int[] end) {
        // 이동 경로 큐
        LinkedList<Coord> queue = new LinkedList<>();
        queue.add(new Coord(start[0], start[1], 0)); // 시작 좌표를 넣고, 거리는 0으로 설정

        while(!queue.isEmpty()) {
            Coord coord = queue.poll();
            int row = coord.row;
            int col = coord.col;
            int dist = coord.dist;

            // queue에서 poll 한 좌표가 목적지 좌표이면 return
            if (coord.row==end[0] && coord.col==end[1]){
                return dist;
            }

            // 상
            if (row - 1 >= 0 && map[row - 1][col] == 1) {
                queue.add(new Coord(row - 1, col, dist + 1));
            }
            // 하
            if (row + 1 < map.length && map[row + 1][col] == 1) {
                queue.add(new Coord(row + 1, col, dist + 1));
            }
            // 좌
            if (col - 1 >= 0 && map[row][col - 1] == 1) {
                queue.add(new Coord(row, col - 1, dist + 1));
            }
            // 우
            if (col + 1 < map[0].length && map[row][col + 1] == 1) {
                queue.add(new Coord(row, col + 1, dist + 1));
            }
        }

        return -1; // 갈 수 없는 경로
    }
}
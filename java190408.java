class java109408 {
    /*
     정수 배열(int array)가 주어지면 가장 큰 이어지는 원소들의 합을 구하시오.
     단, 시간복잡도는 O(n).

     예제}
        Input: [-1, 3, -1, 5]
        Output: 7 // 3 + (-1) + 5

        Input: [-5, -3, -1]
        Output: -1 // -1

        Input: [2, 4, -2, -3, 8]
        Output: 9 // 2 + 4 + (-2) + (-3) + 8
     */

    public static void main(String[] args) {

        System.out.println(solution(new int[]{-1, 3, -1, 5}));
        System.out.println(solution(new int[]{-5, -3, -1}));
        System.out.println(solution(new int[]{2, 4, -2, -3, 8}));
    }

    public static int solution(int[] arr) {

        int curSum = arr[0];
        int maxSum = arr[0];

        for (int i=1; i<arr.length; ++i) {
            curSum = Math.max(curSum + arr[i], arr[i]);
            maxSum = Math.max(maxSum, curSum);
        }

        return maxSum;
    }
}
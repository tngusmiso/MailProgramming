class java109408 {
    
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
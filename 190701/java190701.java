import java.util.Arrays;

class java190701{
    public static void main(String[] args) {

        System.out.println(solution(new int[]{-1, 3, -1, 5, 4}, 2));
        System.out.println(solution(new int[]{2, 4, -2, -3, 8}, 1));
        System.out.println(solution(new int[]{-5, -3, 1}, 3));
    }

    // 수정필요
    public static int solution(int[] arr, int N) {
        Arrays.sort(arr);
        return arr[arr.length-N];
    }
}
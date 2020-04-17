public class java190429 {
    public static void main(String[] args) {
        System.out.println(solution(12345));    // false
        System.out.println(solution(-101));     // false
        System.out.println(solution(11111));    // true
        System.out.println(solution(12421));    // true
    }

    public static boolean solution(int n) {
        if(n < 0 || (n % 10 == 0 && n != 0)) {
            return false;
        }
        int revertedHalf = 0;
        while(n > revertedHalf) {
            revertedHalf = revertedHalf * 10 + n % 10;
            n /= 10;
        }
        return n == revertedHalf || n == revertedHalf/10;
    }
}
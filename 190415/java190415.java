public class java190415 {

    public static void main(String[] args) {

        System.out.println(solution(12));
    }

    public static int solution(int n) {
        int answer = 0;

        int fib0 = 0;
        int fib1 = 1;

        while(fib0 + fib1 < n) {
            int fib2 = fib0 + fib1;
            if (fib2%2 == 0){
                answer += fib2;
            }

            fib0 = fib1;
            fib1 = fib2;
        }
        
        return answer;
    }
}
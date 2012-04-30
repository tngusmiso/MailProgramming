public class java190527 {
    public static void main(String[] args) {
        int[] input = {10, 5, 4, 3, -1};
        int[] input2 = {3,3,-1};
        solution(input);
        solution(input2);
    }

    public static void solution(int[] input) {
        int max = Integer.MIN_VALUE;
        int second = Integer.MIN_VALUE;

        for(int num : input){
            if (num > max){
                second = max;
                max = num;
            } else if(num!= max && num > second){
                second = num;
            }

            System.out.println("max: "+max);
            System.out.println("second: "+second);
        }

        if (max == second){
            System.out.println("Does not exist.");
        } else {
            System.out.println(second);
        }
    }
}
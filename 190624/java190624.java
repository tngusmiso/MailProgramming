import java.util.Arrays;

public class java190624 {
    
    public static void main(String[] args) {

        System.out.println(Arrays.toString(solution(new int[]{1, 2, 3, 4, 5})));
    }

    public static int[] solution(int[] input) {
        int[] frontElemnets = new int[input.length];
        int[] backElemnets = new int[input.length];
        int[] output = new int[input.length];

        frontElemnets[0] = 1;
        for(int i = 1; i<input.length; ++i){
            frontElemnets[i] = frontElemnets[i-1] * input[i-1];
        }

        backElemnets[input.length-1] = 1;
        for(int j=input.length-2; j>=0; --j){
            backElemnets[j] = backElemnets[j+1] * input[j+1];
        }

        for(int k=0; k<input.length; ++k){
            output[k] = frontElemnets[k] * backElemnets[k];
        }

        return output;
    }
}
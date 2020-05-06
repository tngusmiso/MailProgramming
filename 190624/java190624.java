import java.util.Arrays;

public class java190624 {
    
    public static void main(String[] args) {

        System.out.println(Arrays.toString(solution(new int[]{1, 2, 3, 4, 5})));
    }

    public static int[] solution(int[] input) {
        
        int length = input.length;
        
        int[] frontElemnets = new int[input.length];
        int[] backElemnets = new int[input.length];
        int[] output = new int[input.length];

        int temp = 1;
        for(int i = 0; i<length; ++i){
            frontElemnets[i] = temp;
            temp *= input[i];
        }

        temp = 1;
        for(int j=length-1; j>=0; --j){
            backElemnets[j] = temp;
            temp *= input[j];
        }

        for(int k=0; k<length; ++k){
            output[k] = frontElemnets[k] * backElemnets[k];
        }

        return output;
    }
}
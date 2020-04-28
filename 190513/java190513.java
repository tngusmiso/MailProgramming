import java.util.Collections;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

public class java190513 {
    public static class Interval implements Comparable<Interval>{
        private int start;
        private int end;

        public Interval(int start, int end){
            this.start = start;
            this.end = end;
        }

        public int getStart() {return start;}
        public void setStart(int start) {this.start = start;}
        public int getEnd() {return end;}
        public void setEnd(int end) {this.end = end;}

        @Override
        public int compareTo(Interval o) {
            return this.getStart() - o.getStart();
        }
    }

    public static void main(String[] args) {
        int[][] input = {{2,4}, {1,5}, {7,9}};
        int[][] input2 = { {5,7}, {1,3}, {3,4}, {5,11}};
        System.out.println(Arrays.deepToString(solution(input2)));
    }

    public static int[][] solution(int[][] input) {
        List<Interval> inputList = new ArrayList<>();

        for(int[] intSet : input){
            inputList.add(new Interval(intSet[0], intSet[1]));
        }

        Collections.sort(inputList);

        List<Interval> outputList = new ArrayList<>();
        outputList.add(inputList.get(0));

        for(int i = 1; i < inputList.size(); ++i){
            Interval last = outputList.get(outputList.size()-1);
            Interval interval = inputList.get(i);

            if(last.getEnd() < interval.getStart()){
                outputList.add(interval);
            } else {
                last.setEnd(interval.getEnd());
            }
        }

        int[][] answer = new int[outputList.size()][2];
        for (int i = 0; i < answer.length; ++i){
            answer[i][0] = outputList.get(i).getStart();
            answer[i][1] = outputList.get(i).getEnd();
        }

        return answer;
    }
}
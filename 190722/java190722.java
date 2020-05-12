public class java190722 {
    static class Node {
        private int num;
        private Node next;

        public Node(int num){
            this.num = num;
        }
        public Node(int num, Node next){
            this.num = num;
            this.next = next;
        }

        int getNum() { return this.num;}
        Node getNext() {return this.next;}

        void setNum(int num){ this.num = num;}
        void setNext(Node next){ this.next = next;}

        @Override
        public String toString() {
            String str = "" + this.num;
            if (this.next != null ) {
                str += " -> ";
                str += this.next.toString();
            }

            return str;
        }
    }

    public static void main(String[] args) {
        Node input1 = new Node(1, new Node(2, new Node(3)));
        Node input2 = new Node(1, new Node(2, new Node(3)));
        System.out.println(solution(input1, input2));

        Node input3 = new Node(1, new Node(3, new Node(5, new Node(6))));
        Node input4 = new Node(2, new Node(4));
        System.out.println(solution(input3, input4));
    }

    public static Node solution(Node node1, Node node2) {
        Node head = new Node(Math.min(node1.getNum(), node2.getNum()));
        Node pointer = head;
        
        while(true) {
            if (node1.getNum() < node2.getNum()) {
                node1 = node1.getNext();
            } else {
                node2 = node2.getNext();
            }
            if (node1 == null && node2 == null) {
                return head;
            }
            if (node1 == null) {
                pointer.setNext(node2);
                return head;
            }
            if (node2 == null) {
                pointer.setNext(node1);
                return head;
            }

            pointer.setNext(new Node(Math.min(node1.getNum(), node2.getNum())));
            pointer = pointer.getNext();
        }
    }
}
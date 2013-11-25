import java.util.*;
import java.io.*;

public class Minimal
{
   private static class Pair
   {
       final int fst;
       final int snd;

       Pair(int fst, int snd) {
           this.fst = fst;
           this.snd = snd;
       }

       public String toString() {
           return fst + "|" + snd;
       }
   }

   public static void main(String argv[]) throws IOException
   {
      Map<Integer,Set<Integer>> values = new HashMap<>();
      List<Pair> pairs = new ArrayList<>();
      
      int k = Integer.parseInt(argv[0]);

      try (Scanner stdin = new Scanner(System.in))
      {
          while(stdin.hasNextLine()) {
              String tokens[] = stdin.nextLine().split("\\|");

              int fst = Integer.parseInt(tokens[0]);
              int snd = Integer.parseInt(tokens[1]);

              if (!values.containsKey(snd))
                  values.put(snd, new HashSet<Integer>());

              values.get(snd).add(fst);
              pairs.add(new Pair(fst, snd));
          }
      }

      for (Pair i : pairs)
          if (values.get(i.snd).size() >= k)
              System.out.println(i);
   }
}

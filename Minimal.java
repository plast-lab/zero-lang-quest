import java.util.*;
import java.io.*;

public class Minimal
{
   static int parse(String x, int i)
   { return  Integer.parseInt(x.split("\\|")[i]); }

   public static void main(String argv[]) throws IOException {
      Map<Integer,Set<Integer>> values = new HashMap<>();
      List<String> pairs = new LinkedList<>();
      int k = Integer.parseInt(argv[0]);

      BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
      String line;

      while ((line = cin.readLine()) != null) {
         int i = parse(line, 1);

         if (!values.containsKey(i))
            values.put(i, new HashSet<Integer>());
         values.get(i).add(parse(line, 0));
         pairs.add(line);
      }
      cin.close();

      for (String p : pairs)
         if (values.get(parse(p,1)).size() >= k)
            System.out.println(p);
   }
}

import java.util.*;
import java.io.*;

public class Minimal
{
   static int parse(String x, int i)
   { return  Integer.parseInt(x.split("\\|")[i]); }

   public static void main(String argv[]) throws IOException {
      Map<Integer,Set<Integer>> values = new HashMap<>();
      List<String> pairs = new LinkedList<>();

      BufferedReader cin = new BufferedReader(new InputStreamReader(System.in));
      String line;

      while ((line = cin.readLine()) != null) {
         int k = parse(line, 1);

         if (!values.containsKey(k))
            values.put(k, new HashSet<Integer>());
         values.get(k).add(parse(line, 0));
         pairs.add(line);
      }
      cin.close();

      for (String p : pairs)
         if (values.get(parse(p,1)).size() > 1)
            System.out.println(p);
   }
}

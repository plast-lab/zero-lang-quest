import collection.mutable.{Set, Map, HashMap, MultiMap}
import scala.collection.mutable.ListBuffer
object minimal {

  def main(args: Array[String]): Unit = {
    val inner:ListBuffer [(Int,Long)] = new ListBuffer [(Int,Long)]()
    val hashMap = new HashMap[Long,Set[Int]] with MultiMap[Long, Int]

    Stream.continually(Console.readLine()).takeWhile(_ != null).foreach(line=> {
      val l =line.split("\\|")
      inner+=((l(0).toInt,l(1).toLong))
      hashMap.addBinding(l(1).toLong,l(0).toInt)
    })
    inner.filter(tuple => hashMap(tuple._2).size>1).foreach(tuple=>Console.println(tuple._1+"|"+tuple._2))
  }
}
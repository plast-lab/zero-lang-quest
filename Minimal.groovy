class Minimal
{
    static void main(String[] argv) {
        def values = [:]
        def pairs = []

        def filter = { i ->
            values.get(i[1]).size() >= argv[0].toInteger()
        }

        def process = { v ->
            values.get(v[1], new HashSet<Integer>()).add(v[0])
            pairs.add(v)
        }

        System.in.splitEachLine("\\|") { 
            i -> process i*.toInteger()
        }

        pairs.findAll(filter).each { p -> println p.join("|") }
    }
}

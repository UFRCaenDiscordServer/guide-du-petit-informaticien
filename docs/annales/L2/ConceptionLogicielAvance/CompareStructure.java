import java.util.*;

class CompareStructure
{
	public static void main(String[] args) 
	{
		List<Integer> arrayList = new ArrayList<Integer>();
		List<Integer> linkedList = new LinkedList<Integer>();
		HashSet<Integer> hashSet = new HashSet<Integer>();

		int length = 1000000;
		int content = 50000;

		System.out.println("----------------------------------");
		long begin = System.nanoTime();
		for (int i = 0; i < length; i++) 
		{
			arrayList.add(new Integer(i));
		}
		long end = System.nanoTime() - begin;
		System.out.println("ADD ArrayList: \t\t" + end);
		
		begin = System.nanoTime();
		for (int i = 0; i < length; i++) 
		{
			linkedList.add(new Integer(i));
		}
		end = System.nanoTime() - begin;
		System.out.println("ADD LinkedList: \t" + end);
		
		begin = System.nanoTime();
		for (int i = 0; i < length; i++) 
		{
			hashSet.add(new Integer(i));
		}
		end = System.nanoTime() - begin;
		System.out.println("ADD HashSet: \t\t" + end);

		System.out.println("----------------------------------");
		begin = System.nanoTime();
		arrayList.contains(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("CONTAINS ArrayList: \t" + end);
		
		begin = System.nanoTime();
		linkedList.contains(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("CONTAINS LinkedList: \t" + end);
		
		begin = System.nanoTime();
		hashSet.contains(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("CONTAINS HashSet: \t" + end);

		System.out.println("----------------------------------");
		begin = System.nanoTime();
		arrayList.get(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("GET ArrayList: \t\t" + end);
		
		begin = System.nanoTime();
		linkedList.get(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("GET LinkedList: \t" + end);

		System.out.println("----------------------------------");
		begin = System.nanoTime();
		arrayList.remove(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("DELETE ArrayList: \t" + end);
		
		begin = System.nanoTime();
		linkedList.remove(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("DELETE LinkedList: \t" + end);
		
		begin = System.nanoTime();
		hashSet.remove(new Integer(content));
		end = System.nanoTime() - begin;
		System.out.println("DELETE HashSet: \t" + end);

		System.out.println("----------------------------------");
		begin = System.nanoTime();
		arrayList.add(0, new Integer(-1));
		end = System.nanoTime() - begin;
		System.out.println("ADD FIRST ArrayList: \t" + end);

		begin = System.nanoTime();
		linkedList.add(0, new Integer(-1));
		end = System.nanoTime() - begin;
		System.out.println("ADD FIRST LinkedList: \t" + end);

		System.out.println("----------------------------------");
		begin = System.nanoTime();
		Iterator<Integer> i = arrayList.iterator();
		end = System.nanoTime() - begin;
		System.out.println("ITERATOR ArrayList: \t" + end);
		
		begin = System.nanoTime();
		i = linkedList.iterator();
		end = System.nanoTime() - begin;
		System.out.println("ITERATOR LinkedList: \t" + end);
		
		begin = System.nanoTime();
		i = hashSet.iterator();
		end = System.nanoTime() - begin;
		System.out.println("ITERATOR HashSet: \t" + end);

	}
}

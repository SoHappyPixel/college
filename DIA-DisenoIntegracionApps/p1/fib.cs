using System;

namespace Fibo
{
    class Program
    {
        static void Main(string[] args)
        {
            int a,b,n,i,aux; 
            Console.Write("¿Cuantos números fibonacci quieres?"  );
            n = int.Parse(Console.ReadLine());
            a = 0;
            b = 1; 
			for (i = 0; i < n; i++)
            {
				Console.WriteLine(a); 
                aux = a;
                a = b;
                b = aux + a;
            }
        }
    }
}

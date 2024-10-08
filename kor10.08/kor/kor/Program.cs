using System;
using System.IO;
using ConsoleTableExt;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kor
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Adatsor> adatok = new List<Adatsor>();
            string[] f = File.ReadAllLines("forras.txt",Encoding.UTF8);
            foreach (string line in f) adatok.Add(new Adatsor(line));
            var lista = adatok.Select(x => new {vezetéknév=x.vnev,keresztnév=x.knev,születési_dátum=x.szul.ToString("yyyy.MM.dd"),életkor=Math.Round((DateTime.Now-x.szul).Days/365.25,2)}).ToList();
            ConsoleTableBuilder.From(lista).ExportAndWriteLine();
            Console.WriteLine($"{adatok.Count()} személy adata került beolvasásra");
            Console.WriteLine("akiknek a vezetékneve és keresztneve azonos betűvel kezdődik");
            foreach (var a in adatok) if (a.vnev[0] == a.knev[0]) Console.WriteLine($"{a.vnev} {a.knev}");
            //be: keresztnév, hány ember rendelkezik ezzel a névvel
            Console.Write("Keresett keresztnév:");
            string keresettkeresztnev=Console.ReadLine().ToLower();
            string keresettnev = "";//Nagy Kezdőbetűs
            keresettnev += keresettkeresztnev[0].ToString().ToUpper();
            for (int i = 1; i < keresettkeresztnev.Length; i++)
                keresettnev += keresettkeresztnev[i];
            int db = 0;//megszámlálás
            foreach (var a in adatok)if(a.knev==keresettnev)
                {
                    db++;
                    Console.WriteLine($"{a.vnev} {a.knev}");//keresés,kiválasztás
                }
            Console.WriteLine($"{keresettnev} keresztnévvel {db} személy rendelkezik");
            //	Kérjen be billentyűzetről egy évszámot 1971-től 1999-ig terjedő időszakból
            Console.WriteLine("Kérek egy évszámot 1971-től 1999-ig");
            bool ok = false;
            int evszam = 0;
            do
            {
                try
                {
                    Console.Write("Évszám:");
                    evszam=int.Parse(Console.ReadLine());
                    if (evszam < 1971 || evszam > 1999)
                    {
                        ok = false;
                        Console.WriteLine("Nem 1971-1999 közötti számot adtál meg");
                    }
                    else ok = true;
                }
                catch
                {
                    ok = false;
                    Console.WriteLine("Nem számot adtál meg");
                }
            }while (!ok);
            //	Készítsen egy függvényt. A függvény paraméterként a megadott évszámot és a személyek adatait tartalmazó listát kapja meg. A függvény eredményül megadja az adott évszám előfordulásának számát az adatlistában szereplő születési évszámok között. 
            int szuletesekszama = SzuletesekSzama(evszam, adatok);
            Console.WriteLine($"A {evszam}-ban születettek száma:{szuletesekszama}");
            var szuletesievszamoklista = adatok
                .GroupBy(x => x.szul.Year)
                .OrderBy(x=>x.Key)
                .Select(x => new {év=x.Key,db=x.Count()})
                .ToList();
            ConsoleTableBuilder.From(szuletesievszamoklista).ExportAndWriteLine();
            //	A függvény használatával határozza meg az átlagéletkort! A függvény paraméterként a mai dátumot és a személyek adatait tartalmazó listát kapja meg.
            double atlageletkor = AtlagEletkor(DateTime.Now, adatok);
            Console.WriteLine($"Átlagéletkor:{Math.Round(atlageletkor,2)}");
            //megoldás függvény nélkül
            double atlageletkor2 = 0;
            foreach (var item in adatok) atlageletkor2 += (DateTime.Now - item.szul).Days / 365.25;
            Console.WriteLine($"Átlagéletkor:{Math.Round(atlageletkor2/adatok.Count(),2)}");
            //	Készíts statisztikát az egyes keresztnevek hányszor fordulnak elő! Az adatokat a keresztnevek.txt fájlba írja ki a minta szerint
            List<string> keresztneveklista = new List<string>();
            adatok.GroupBy(x=>x.knev).ToList().ForEach(x=>keresztneveklista.Add($"{x.Key} név {x.Count()} fő"));
            File.WriteAllLines("keresztnevek.txt", keresztneveklista);
            //foreach (var a in keresztneveklista) Console.WriteLine(a);
            //ki ünnepli ma a születésnapját?
            foreach (var a in adatok) if (a.szul.Month == DateTime.Now.Month&& a.szul.Day == DateTime.Now.Day) Console.WriteLine($"{a.vnev} {a.knev} ünnepli ma a születésnapját ({a.szul})");
            Console.ReadKey();
        }

        private static double AtlagEletkor(DateTime mai, List<Adatsor> lista)
        {
            double atl = 0;
            foreach (var i in lista)
            {
                TimeSpan kul = mai - i.szul;
                atl += kul.Days / 365.25;
            }
            atl=atl/lista.Count();
            return atl;
        }

        private static int SzuletesekSzama(int szam, List<Adatsor> lista)
        {
            int db = 0;
            foreach(var a in lista)if(a.szul.Year== szam) db++;
            return db;
        }
    }
}

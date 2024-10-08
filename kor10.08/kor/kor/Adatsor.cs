using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kor
{
    internal class Adatsor
    {
        /*Lakatos;Flóra;1978.08.29
Orsós;Kinga;1985.09.29*/
        public string vnev {  get; set; }
        public string knev {  get; set; }
        public DateTime szul { get; set; }
        public Adatsor(string sor)
        {
            string[] s = sor.Split(';');
            vnev = s[0];
            knev = s[1];
            szul=Convert.ToDateTime(s[2]);
        }
    }
}

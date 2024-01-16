using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASPNet.OTS.v1.Classes
{
    public class clsDTConvert
    {
        string vs_Gun, vs_Ay, vs_Yil;

        public string DTConvert(DateTime prmDT,string prmDirection)
        {
            string vs_DT=string.Empty;

            vs_Gun = prmDT.Day.ToString();  
            vs_Ay = prmDT.Month.ToString();
            vs_Yil = prmDT.Year.ToString();

            if (vs_Gun.Length < 2)
            {
                vs_Gun = "0" + vs_Gun;
            }

            if (vs_Ay.Length < 2)
            {
                vs_Ay = "0" + vs_Ay;
            }

            switch (prmDirection)
            {
                case "1":
                    vs_DT= vs_Yil + vs_Ay + vs_Gun;
                    break;

                case "2":
                    vs_DT= vs_Gun + vs_Ay + vs_Yil;
                    break;

                default:
                    break;
            }

            return vs_DT;
        }
    }
}
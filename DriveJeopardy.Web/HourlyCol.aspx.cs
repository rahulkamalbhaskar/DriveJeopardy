using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HourlyCol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string method()
    {
        using (Code_DBDataContext db = new Code_DBDataContext())
        {
            var query = db.mainTables.GroupBy(x => x.C_HOUR).OrderBy(x => x.Key).Select( g => new { g.Key, Count = g.Count() }).ToList();
            string result ="";
            //string r="";
            result +=query[0].Count + ",";
            result += query[11].Count + ",";//("2:00")).Count().ToString() + ",";
            result += query[16].Count + ",";//("3:00")).Count().ToString() + ",";
            result += query[17].Count + ",";//("4:00")).Count().ToString() + ",";
            result += query[18].Count + ",";//("5:00")).Count().ToString() + ",";
            result += query[19].Count + ",";//("6:00")).Count().ToString() + ",";
            result += query[20].Count + ",";//("7:00")).Count().ToString() + ",";
            result += query[21].Count + ",";//("8:00")).Count().ToString() + ",";
            result += query[22].Count + ",";//("9:00")).Count().ToString() + ",";
            result += query[1].Count + ",";//("10:00")).Count().ToString() + ",";
            result += query[2].Count + ",";//("11:00")).Count().ToString() + ",";
            result += query[3].Count + ",";//("12:00")).Count().ToString() + ",";
            result += query[4].Count + ",";//("13:00")).Count().ToString() + ",";
            result += query[5].Count + ",";//("14:00")).Count().ToString() + ",";
            result += query[6].Count + ",";//("15:00")).Count().ToString() + ",";
            result += query[7].Count + ",";//("16:00")).Count().ToString() + ",";
            result += query[8].Count + ",";//("17:00")).Count().ToString() + ",";
            result += query[9].Count + ",";//("18:00")).Count().ToString() + ",";
            result += query[10].Count + ",";//("19:00")).Count().ToString() + ",";
            result += query[12].Count + ",";//("20:00")).Count().ToString() + ",";
            result += query[13].Count + ",";//("21:00")).Count().ToString() + ",";
            result += query[14].Count + ",";//("22:00")).Count().ToString() + ",";
            result += query[15].Count + ",";//("23:00")).Count().ToString() + ",";
            result += query[23].Count;//("Midnight")).Count().ToString();
           
            result = result.TrimEnd(',');
            return result;

        }



    }
}
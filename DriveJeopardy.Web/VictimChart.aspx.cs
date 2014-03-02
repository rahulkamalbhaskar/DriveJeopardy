using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VictimChart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
       [WebMethod]
    public static string getGraphData()
    {
        Code_DBDataContext db = new Code_DBDataContext();
        var QueryResultNoInjuryPosition = db.getNoInjuryDataForPsition();
        var QueryResultInjuryPosition = db.getInjuryDataForPsition();
        var QueryResultFatalityPosition = db.getFatalityDataForPsition();
        Dictionary<string, List<customDataType>> dicObject = new Dictionary<string, List<customDataType>>();

        dicObject = parseNoInjuryQuery(dicObject, QueryResultNoInjuryPosition);
        dicObject = parseInjuryQuery(dicObject, QueryResultInjuryPosition);
        dicObject = parseFatalitiesQuery(dicObject, QueryResultFatalityPosition);
        string series1Data = "";
        string series2Data = "";
        string series3Data = "";
        string categories = "";
        int count = 0;
        foreach (string dictKey in dicObject.Keys)
        {
            
            if (categories == "")
            {
                categories += dictKey;
            }
            else
            {
                categories += "," +  dictKey ;

            }
            foreach (customDataType instance in dicObject[dictKey])
            {
                if (instance.MyPropertyType.Equals("No Injury"))
                {
                    if (series1Data == "")
                    {
                        series1Data += instance.MyPropertyTypeTotal.ToString();
                    }
                    else
                    {
                        series1Data += "," + instance.MyPropertyTypeTotal.ToString();

                    }
                }
                else if (instance.MyPropertyType.Equals("Injury"))
                {
                    if (series2Data == "")
                    {
                        series2Data +=  instance.MyPropertyTypeTotal.ToString();
                    }
                    else
                    {
                        series2Data += "," + instance.MyPropertyTypeTotal.ToString();
                    }
                    
                }
                else if (instance.MyPropertyType.Equals("Fatalities"))
                {
                    if (series3Data == "")
                    {
                        series3Data += instance.MyPropertyTypeTotal.ToString();
                    }
                    else 
                    {
                        series3Data += "," + instance.MyPropertyTypeTotal.ToString();
                    }
                    
                }
            }
            count++;

        }
        return  (categories + ";" + series1Data+";"+series2Data+";"+series3Data);
    }
    public static Dictionary<string, List<customDataType>> parseFatalitiesQuery(Dictionary<string, List<customDataType>> dicObject, System.Data.Linq.ISingleResult<getFatalityDataForPsitionResult> queryResult)
    {
        //key is the position type is no injury, injury fatalities and count is aggregate function value

        foreach (var instance in queryResult.ToList())
        {
            createDictionary(dicObject, instance.Position, "Fatalities", Convert.ToInt64(instance.PositionCount));
        }
        return dicObject;

    }
    public static Dictionary<string, List<customDataType>> parseNoInjuryQuery(Dictionary<string, List<customDataType>> dicObject, System.Data.Linq.ISingleResult<getNoInjuryDataForPsitionResult> queryResult)
    {
        //key is the position type is no injury, injury fatalities and count is aggregate function value

        foreach (var instance in queryResult.ToList())
        {
            createDictionary(dicObject, instance.Position, "No Injury", Convert.ToInt64(instance.PositionCount));
        }
        return dicObject;

    }
    public static Dictionary<string, List<customDataType>> parseInjuryQuery(Dictionary<string, List<customDataType>> dicObject, System.Data.Linq.ISingleResult<getInjuryDataForPsitionResult> queryResult)
    {
        //key is the position type is no injury, injury fatalities and count is aggregate function value

        foreach (var instance in queryResult.ToList())
        {
            createDictionary(dicObject, instance.Position, "Injury", Convert.ToInt64(instance.PositionCount));
        }
        return dicObject;

    }
    // function to create map of the car passanger postion data
    public static Dictionary<string, List<customDataType>> createDictionary(Dictionary<string, List<customDataType>> positionDictionary, string key, string type, Int64 typeCount)
    {
        customDataType dataType = new customDataType();
        dataType.MyPropertyType = type;
        dataType.MyPropertyTypeTotal = typeCount;
        //select only attributes related to the car seats
        if (!eligibleKey(key).Equals(""))
        {
            if (positionDictionary.ContainsKey(key))
            {

                if (positionDictionary[key] != null)
                {
                    positionDictionary[key].Add(dataType);
                }
                else
                {
                    positionDictionary[key] = new List<customDataType>();
                    positionDictionary[key].Add(dataType);
                }
            }
            else
            {
                List<customDataType> temp = new List<customDataType>();
                temp.Add(dataType);
                positionDictionary.Add(key, temp);
            }
        }

        return positionDictionary;
    }

    private static string eligibleKey(string eligibleString)
    {
        string result = "";
        /*
         * 

         */
        if (eligibleString.Equals("Driver"))
        {
            result = eligibleString;
        }
        else if (eligibleString.Equals("Front row-right outboard-including motorcycle passenger in sidecar"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Second row-right outboard"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Second row-left outboard-including motorcycle passenger"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Front row-center"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Second row-center"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Third row-center"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Third row-right outboard"))
        { result = eligibleString; }
        else if (eligibleString.Equals("Outside passenger compartment"))
        { result = eligibleString; }
        return result;
    }
    public class customDataType
    {
        private string type;

        public string MyPropertyType
        {
            get { return type; }
            set { type = value; }
        }
        private Int64 typeTotal;

        public Int64 MyPropertyTypeTotal
        {
            get { return typeTotal; }
            set { typeTotal = value; }
        }


    }
}
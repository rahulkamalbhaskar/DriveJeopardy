<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VictimChart.aspx.cs" Inherits="VictimChart" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Victims Chart </title>
       <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet"/>
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui.js"></script> 
     <script src="js/highstock.js"></script>
    <script src="js/exporting.js"></script>

    <script>
        $(function () {
            var graphData = getGraphData();
            if (graphData == null) {
                alert('Error:Null data fro DB. Chech Database connection');
                return;
            }
            var temp = graphData.split(';');
            var temp2 = temp[0].split(',');
            var temp3 = JSON.parse("[" + temp[1] + "]"); //temp[1].split(',');
            var temp4 = JSON.parse("[" + temp[2] + "]"); //temp[2].split(',');
            var temp5 = JSON.parse("[" + temp[3] + "]");

            $('#PopularityContainer').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Victim Position'
                },
                subtitle: {
                    text: 'Source: data.gov.ca'
                },
                xAxis: {
                    min: 0,
                    max: 1,
                    categories: temp2
                }, scrollbar: {
                    enabled: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Number of People'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} people</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: 'No Injury',
                    data: temp3

                }, {
                    name: 'Injury',
                    data: temp4

                }, {
                    name: 'Fatalities',
                    data: temp5

                }]
            });
        });
        function getGraphData() {
            var graphData;
            $.ajax({
                type: "POST",
                url: "VictimChart.aspx/getGraphData",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                cache: false,
                success: function (msg) {
                    graphData = msg.d;
                }
            })
            return graphData;
        }
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="PopularityContainer" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    </div>
    </form>
</body>
</html>

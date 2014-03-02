<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HourlyCol.aspx.cs" Inherits="HourlyCol" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Hourly Collitions</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


    <script src="http://code.highcharts.com/stock/highstock.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>

    <script type="text/javascript" language="javascript">
        $(function () {
            $.ajax({

                type: 'POST',

                dataType: 'json',
                url: "HourlyCol.aspx/method",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    data = response.d;
                    
                   // alert(data);

                    graphdata = JSON.parse("[" + data + "]");
                    //var jdata = data['SeriesData'];
                    //var SData = JSON.stringify(eval("(" + data + ")"));
                   
                    $(function () {
                        $('#container').highcharts({
                            title: {
                                text: 'Hourly Collisions',
                                x: -20 //center
                            },
                            subtitle: {
                                text: '',
                                x: -20
                            },
                            xAxis: {
                                categories: [
                    '01',
                    '02',
                    '03',
                    '04',
                    '05',
                    '06',
                    '07',
                    '08',
                    '09',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                    '15',
                    '16',
                    '17',
                    '18',
                    '19',
                    '20',
                    '21',
                    '22',
                    '23',
                    '00'
                                ]

                            },
                            yAxis: {
                                title: {
                                    text: 'Collisions'
                                },
                                plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                            },
                            //tooltip: {
                            //    valueSuffix: '°C'
                            //},
                            legend: {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0
                            },
                            series: [{
                                name: 'Collisions',
                                data: graphdata

                            }]

                        });
                    });

                },
                error: function (err) {
                    alert(err);
                }


                //end of ajax
            });

            //end of function
        });


    </script>
</head>
<body>
   <div id="container" style="min-width: 310px; max-width: 400px; height: 300px; margin: 0 auto"></div>

</body>
</html>

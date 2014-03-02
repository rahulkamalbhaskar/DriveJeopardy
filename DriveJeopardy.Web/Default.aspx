<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="metro/css/metro-bootstrap.css" />
    <script src="js/jquery/jquery.min.js"></script>
    <script src="js/jquery/jquery.widget.min.js"></script>
    <script src="js/metro/metro.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <style>
        .button {
            display: inline-block;
            background-color: #222222;
            color: #fff;
            border: 0;
            cursor: pointer;
            outline: 0;
            -moz-transition: background-color .25s ease-in-out;
            -webkit-transition: background-color .25s ease-in-out;
            -o-transition: background-color .25s ease-in-out;
            -ms-transition: background-color .25s ease-in-out;
            transition: background-color .25s ease-in-out;
        }

            .button:hover {
                background-color: #333333;
            }

            .button:active {
                background-color: #444444;
            }

        .button-alt {
            background-color: #777777;
        }

            .button-alt:hover {
                background-color: #888888;
            }

            .button-alt:active {
                background-color: #999999;
            }

        .button-small {
        }

        .button-big {
        }

        .button-huge {
        }
    </style>
    <script type="text/javascript">
        var currentPage;
        $(document).ready(function () {
            initDoc();
        });
        function initDoc() {
            currentPage = $("#mainPage");

            $("#sectionA").hide();
            $("#sectionB").hide();
            $("#sectionC").hide();
            $("#goHome").click(function () {
                goToPage('H');
            });

            $("#menuGoToA").click(function () {
                //  goToPage('A');
                window.location.href = "/DidYouKnow/index.html";

            });
            $("#menuGoToB").click(function () {
                goToPage('B');
            });
            $("#menuGoToC").click(function () {
                goToPage('C');
            });
            function goToPage(page) {
                $("#mainPage").hide(300);
                switch (page) {
                    case 'A':
                        $("#sectionA").show(1500);
                        break;
                    case 'B':
                        $("#sectionB").show(1500);

                        break;
                    case 'C':
                        $("#sectionC").show(1500);

                        break;
                    case 'H':

                        $("#sectionA").hide(300);
                        $("#sectionB").hide(300);
                        $("#sectionC").hide(300);
                        $("#mainPage").show(1500);
                        break;
                }
            }
        }
       
    </script>
</head>
<body class="metro">


    <form id="form1" runat="server">
        <div id="mainPage">
            <table border="0" style="width: 100%">
                <tr>
                    <td>
                        <div id="menuGoToA" class="tile  bg-cyan" style="width: 100%">

                            <div class="brand bg-black">
                                <span class="label fg-white">Did you know</span>
                                <%-- <div class="badge bg-darkRed paused"></div>--%>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="menuGoToB" class="tile bg-green" style="width: 100%">

                            <div class="brand bg-black">
                                <span class="label fg-white">Safty</span>
                                <%-- <div class="badge bg-darkRed paused"></div>--%>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="menuGoToC" class="tile double bg-crimson" data-click="transform" style="width: 100%">

                            <div class="brand bg-black">
                                <span class="label fg-white">Risk</span>
                                <%-- <div class="badge bg-darkRed paused"></div>--%>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

        </div>

        <div id="sectionA">
            Section A
           <input type="submit" id="goHome" class="button goHome" value="Home" />
        </div>
        <div id="sectionB">
           b
            
            <input type="submit" id="goHome" class="button goHome" value="Home" />
        </div>
        <div id="sectionC">
            Section C
           <input type="submit" id="goHome" class="button goHome" value="Home" />
        </div>
    </form>
</body>
</html>

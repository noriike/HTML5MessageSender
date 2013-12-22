<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HTML5MessageSender.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript">
        //var MYORIGIN = location.protocol + "//" + location.host;
        var MYORIGIN = "http://localhost:54676/Page/";

        function init() {
            var iframe = document.getElementsByTagName("iframe")[0];

            setInterval(function () {
                var date = new Date();
                var dateStr =
                        date.getFullYear() + "/" +
                        (date.getMonth() + 1) + "/" +
                        date.getDate() +
                        " " +
                        date.getHours() + ":" +
                        date.getMinutes() + ":" +
                        date.getSeconds();

                var number = Math.floor(Math.random() * 100);

                iframe.contentWindow.postMessage({
                    date: dateStr,
                    number: number
                }, MYORIGIN);

                document.getElementById("msg").innerHTML =
                        dateStr + "生成された値は" + number + "です。";
            }, 1000);

        }
    </script>
</head>
<body onload="init()">
    <form id="form1" runat="server">
        <div id="msg"></div>
        <iframe src="http://localhost:54676/Page/webpage1.aspx" width="1000" height="800"></iframe>

        <input id="Button1" type="button" onclick="window.open('frame.aspx','_blank')" value="button" />
    </form>
</body>
</html>

<%@ page import="Resources.SessionShotsBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Result</title>
    <link href="styles/styleResult.css" rel="stylesheet">
</head>
<body>

<header>
    <div>
        <p>Rogachev Kirill Olegovich P3230 2635</p>
        <p>Negrash Andrey Vladimirovich P3230 2635</p>
    </div>
</header>

<div id="content-panel">
    ${Content}
</div>

<div id="table-panel">
    <div id="result" class="custom_scrollbar">
        <table id="page-table-T" border="1">
            <thead class="header" id="headerTable">
            <tr>
                <th id="x-id" class="stickyTh">X</th>
                <th class="y-class stickyTh">Y</th>
                <th class="r-class stickyTh">R</th>
                <th class="som-class stickyTh">Y/N</th>
                <th class="stt-class stickyTh">Start time</th>
                <th class="sct-class stickyTh">Script time(Nano)</th>
            </tr>
            </thead>
            <tbody>
            <%
                SessionShotsBean shots = (SessionShotsBean) request.getSession().getAttribute("shots");
                if(shots != null){
                    out.print(shots.writeAll());
                }
            %>
            </tbody>

        </table>
    </div>
</div>

<footer>
    <div>
        <a href="/Lab2" id="footer-form">Form</a>
    </div>
    <div>
        <a href="https://github.com/selbstbeherrschung/web-lab-1" id="footer-git">Github</a>
    </div>
</footer>

</body>
</html>
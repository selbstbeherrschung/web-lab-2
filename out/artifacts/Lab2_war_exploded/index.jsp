<%@ page import="Resources.SessionShotsBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD html 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<HTML lang="en">
<head>
    <meta charset="UTF-8">
    <title>
        Lab 2
    </title>
    <link rel="icon" type="image/png" href="resources/icon.png">
    <script src="clientScript/Script.js"></script>
    <link href="styles/styleStart.css" rel="stylesheet">
</head>
<body>

<header>
    <div>
        <p>Rogachev Kirill Olegovich P3230 2635</p>
        <p>Negrash Andrey Vladimirovich P3230 2635</p>
    </div>
</header>

<div>
    <form method="post" onsubmit="checkText(this);" action="/Lab2/control">
        <table id="page-table-F" border="1">
            <tr>
                <td colspan="13">
                    <div>
                        <svg id="image-coordinates">
                            <rect width="300" height="300" fill="rgb(255,255,255)" stroke-width="1"
                                  stroke="rgb(0,0,0)"/>

                            <circle cx="150" cy="150" r="120" fill="rgb(0,255,255)" stroke-width="1"
                                    stroke="rgb(0,0,0)"/>
                            <polyline points="150,150 150,300 300,300 300,0 0,0 0,150 150,150" fill="rgb(255,255,255)"
                                      stroke-width="1"
                                      stroke="rgb(0,0,0)"/>

                            <rect x="30" y="90" width="120" height="60" fill="rgb(0,255,255)" stroke-width="1"
                                  stroke="rgb(50,50,50)"/>

                            <polyline points="150,90 270,150 150,150 150,90" fill="rgb(0,255,255)" stroke-width="1"
                                      stroke="rgb(0,0,0)"/>

                            <line x1="150" y1="0" x2="150" y2="500" stroke-width="1" stroke="rgb(0,0,0)"/>
                            <line x1="0" y1="150" x2="300" y2="150" stroke-width="1" stroke="rgb(0,0,0)"/>

                            <line x1="145" y1="30" x2="155" y2="30" stroke-width="1" stroke="rgb(0,0,0)"/>
                            <line x1="145" y1="90" x2="155" y2="90" stroke-width="1" stroke="rgb(0,0,0)"/>

                            <line x1="30" y1="145" x2="30" y2="155" stroke-width="1" stroke="rgb(0,0,0)"/>
                            <line x1="90" y1="145" x2="90" y2="155" stroke-width="1" stroke="rgb(0,0,0)"/>

                            <line x1="210" y1="145" x2="210" y2="155" stroke-width="1" stroke="rgb(0,0,0)"/>
                            <line x1="270" y1="145" x2="270" y2="155" stroke-width="1" stroke="rgb(0,0,0)"/>

                            <line x1="145" y1="210" x2="155" y2="210" stroke-width="1" stroke="rgb(0,0,0)"/>
                            <line x1="145" y1="270" x2="155" y2="270" stroke-width="1" stroke="rgb(0,0,0)"/>

                            <polyline points="150,0 140,15 150,5 160,15 150,0" fill="rgb(249,249,249)" stroke-width="1"
                                      stroke="rgb(0,0,0)"/>
                            <polyline points="300,150 285,140 295,150 285,160 300,150" fill="rgb(249,249,249)"
                                      stroke-width="1" stroke="rgb(0,0,0)"/>

                            <%
                                SessionShotsBean shots = (SessionShotsBean) request.getSession().getAttribute("shots");
                                if(shots != null){
                                    out.print(shots.printAll());
                                }
                            %>

                        </svg>
                    </div>

                </td>
            </tr>

            <tr id="buttonRow">
                <td colspan="4">Change R</td>
                <%
                    for (int i = -3; i < 6; i++) {
                        out.print(
                                "<td class=\"chooseable\">" +
                                        "<input class=\"cell-button-class\" type=\"button\" name=\"xChoose\"" +
                                        "onclick=\"setX(" +
                                        i +
                                        ");\" value=\"" +
                                        i +
                                        "\"></td>");
                    }
                %>
            </tr>

            <tr>
                <td colspan="6">Change Y [-5;3]</td>
                <td class="chooseable" colspan="7"><input id="text_input_Y" type="text" name="answerY"
                                                          value="0">
                </td>
            </tr>

            <tr>
                <td colspan="6">Change R [2;5]</td>
                <td class="chooseable" colspan="7"><input id="text_input_R" type="text" name="answerR"
                                                          value="2">
                </td>
            </tr>

            <tr>
                <td colspan="13">
                    <input id="submitButton" class="send" type="submit" value="Send">
                    <input id="vX" type="hidden" name="answerX" value="0">
                </td>
            </tr>
        </table>
    </form>
</div>

<footer>
    <div id="link">
        <a href="https://github.com/selbstbeherrschung/web-lab-1">GitHub</a>
    </div>
</footer>

</body>
</HTML>

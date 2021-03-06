<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>wh的博客</title>
    <link rel="stylesheet" href="layui/css/layui.css">

    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script>
        $(function() {
            $("#sub").click(function () {
                var commentTable = $("#comments");
                var bid = $(":input[name='forBlog']").val();
                var content = $(":input[name='content']").val();
                $.post(
                    "addCom",
                    {
                        forBlog: bid,
                        content: content
                    },
                    function () {
                        commentTable.append(
                            "<tr>\n" +
                            " <td>评论：" + content + "</td>\n" +
                            "</tr>")
                    }
                )
                return false;
            })
        })

    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 30px">wh的博客</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">

            </li>
            <li class="layui-nav-item"><a href="toLogin">登录</a></li>
        </ul>
    </div>



    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table class="layui-table" lay-even="" lay-skin="row">
                        <colgroup>
                            <col width="80%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th style="font-size: 20px">文章题目</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${blogs}" var="title">
                            <tr>
                                <td><a href="showBlog?title=${title}" style="font-size: 15px">${title}</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div></div>
    </div>



    <div class="layui-footer">
        <!-- 底部固定区域 -->

    </div>
</div>
<script src="layui/layui.js"></script>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="bean.Message" %>
<%@ page import="bean.Reply" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    /*
        获取留言
     */
    Message message = new Message();
    pageContext.setAttribute("messages", message.getMessages());
    /*
     *  获取留言的回复信息
     */
    Reply reply = new Reply();
    pageContext.setAttribute("replies", reply.getReplies());

%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>留言板</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/faq.css">
    <link rel="stylesheet" href="css/apps/email.css">
</head>

<body>

<!--=================================================
                         MAIN NAV BAR
====================================================-->
<header class="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid ">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down">Hi ${sessionScope.un}</div>
                        <div class="brand-text brand-small">
                            <img src="img/logo-icon.png" alt="Logo" class="img-fluid">
                        </div>
                    </a>
                    <%--                    这个是头部导航栏左边的更多 = 的点击入口  --%>
                    <a id="toggle-btn" href="#" class="menu-btn active">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </div>
            </div>
            <%--            菜单的注册或者登陆按钮 --%>
            <jsp:include page="login-regiset-menu-item.jsp"/>
        </div>
    </nav>
</header>

<!--====================================================
                        PAGE CONTENT 主要内容
======================================================-->
<div class="page-content d-flex align-items-stretch">

    <!--***** SIDE NAVBAR 左边的导航栏 *****-->
    <nav class="side-navbar">
        <!-- 左边导航栏的头像部分 -->
        <div class="sidebar-header d-flex align-items-center">
            <div class="avatar">
                <div class="photo">
                    <c:choose>
                        <c:when test="${sessionScope.un != null}">
                            <img src="img/head.png" alt="..." class="img-fluid rounded-circle"
                                 style="height: 50px; width: 50px;">
                        </c:when>
                        <c:otherwise>
                            <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle"
                                 style="height: 50px; width: 50px;">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <hr>
        </div>

        <!-- 左边的导航栏的导航部分 -->
        <jsp:include page="nav-ul.jsp"/>
    </nav>

    <%--    主要内容从这里开始 --%>
    <div class="content-inner chart-cont">
        <!--***** CONTENT *****-->
        <div class="container">
            <%--            一行 --%>
            <div class="row">
                <!-- 显示留言标题的面板  （左边的导航栏）-->
                <div class="col-md-4">
                    <nav class="nav vert-tab flex-column">
                        <%-- 点击可以留言 --%>
                        <a class="nav-link tab-faq" href="#lMessage" data-toggle="modal" style="border-style: outset">
                            <h3> 添加留言 </h3>
                            <small>我们想听到你的声音。欢迎发表留言。</small>
                        </a>
                        <%--留言的 弹出窗口 --%>
                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="lMessage"
                             class="modal fade" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!--***** USER INFO *****-->
                                    <div class="col-md-12">
                                        <div class="card form">
                                            <div class="card-header">
                                                <h3 style="display: inline"><i class="fa fa-commenting-o"></i>留言板</h3>
                                                <button aria-hidden="true" data-dismiss="modal" class="close"
                                                        type="button">X
                                                </button>
                                            </div>
                                            <form action="<%=basePath%>addMessage" method="post">
                                                <input type="hidden" name="jumpPath" value="messageManager.jsp">
                                                <div class="form-group">
                                                    <label for="lTitle1">标题</label>
                                                    <input type="text" class="form-control" id="lTitle1"
                                                           placeholder="标题" name="lTitle">
                                                </div>

                                                <div class="form-group" style="margin-top: 0;">
                                                    <label for="lTextarea1">内容</label>
                                                    <textarea class="form-control" id="lTextarea1" rows="5"
                                                              placeholder="在这里发表你的看法！"
                                                              name="lContent"></textarea>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="col-md-12">
                                                        <div class="card-header">
                                                            <h3><i class="fa fa-user-circle"></i>你的信息</h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lName">名称</label>
                                                            <input type="text" class="form-control" id="lName"
                                                                   name="lName" placeholder="输入名称让我们知道你">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="lEmail">邮箱</label>
                                                            <input type="email" class="form-control" id="lEmail"
                                                                   name="lEmail" placeholder="输入邮箱让我们联系你">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lNumber">电话</label>
                                                            <input type="tel" class="form-control" id="lNumber"
                                                                   name="lNum" placeholder="输入电话让我们联系你">
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-general btn-blue mr-2">提交
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </div>

                    <%--显示留言标题--%>
                        <c:forEach var="s_message" items="${messages}" varStatus="s">
                            <a class="nav-link tab-faq js-scroll-trigger" href="#MSG${s.index}">
                                <h3><i class="fa fa-dot-circle-o"></i>
                                    <c:choose>
                                        <%--                                        当字符串过于长时的处理--%>
                                        <c:when test="${s_message != null && s_message.getTitle().length() > 14 }">
                                            ${s_message.getTitle().substring(0,15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${s_message.getTitle()}
                                        </c:otherwise>
                                    </c:choose>
                                </h3>
                                <small>
                                    <c:choose>
                                        <%--                                        当字符串过于长时的处理--%>
                                        <c:when test="${s_message.getContent() != null && s_message.getContent().length() > 20}">
                                            ${s_message.getContent().substring(0,20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${s_message.getContent()}
                                        </c:otherwise>
                                    </c:choose>
                                </small>
                            </a>
                        </c:forEach>
                    </nav>
                </div>

                <%--显示所有的留言的面板--%>
                <div class="col-md-8">
                    <!-- 遍历所有的留言 -->
                    <c:forEach var="s_message" items="${messages}" varStatus="status">
                        <div class="faq-cont" id="MSG${status.index}">
                            <div class="faq-heading-cont">
                                <!--<h3><i class="fa fa-power-off"></i> Basic Question</h3>-->
                            </div>
                                <%--                            一条留言--%>
                            <div class="panel-group" id="accordion-${status.index}">
                                    <%--message--%>
                                    <%--                                留言内容--%>
                                <div class="panel panel-default panel-faq">
                                    <div class="panel-heading">
                                        <a data-toggle="collapse" data-parent="#accordion-${status.index}"
                                           href="#faq-sub-cat${s_message.getId()}">
                                            <h4 class="panel-title"><i class="fa fa-dot-circle-o"></i>
                                                    ${status.index+1}) ${s_message.getTitle()}
                                                <span class="pull-right"><i class="fa fa-plus"></i></span>

                                            </h4>

                                        </a>

                                    </div>
                                    <div id="faq-sub-cat${s_message.getId()}" class="panel-collapse active">
                                        <div class="panel-body">
                                            <ul>
                                                <li class="list-group-item">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <img src="img/avatar-2.jpg" class="img-circle img-fluid"
                                                                 alt=""/></div>
                                                        <div class=" col-md-10">
                                                            <div>
                                                                <div class="mic-info">
                                                                    By: <a href="#">${s_message.getUsername()}</a>
                                                                    at ${s_message.getTime()}
                                                                </div>
                                                            </div>
                                                            <div class="comment-text">
                                                                    ${s_message.getContent()}
                                                            </div>
<%--                                                            对留言的操作， 如果登录了，并且是管理员才可以删除--%>
                                                            <%if (session.getAttribute("un") != null && "admin".equals(session.getAttribute("un").toString())) {%>
                                                            <div style="float: right">
                                                                <a class="btn btn-sm btn-hover btn-primary"
                                                                   href="#lMessage-r-${status.index}"
                                                                   data-toggle="modal"
                                                                   style="border-style: outset;margin-top: 0px;">
                                                                    <span
                                                                            class="fa fa-edit"
                                                                            style="padding-right:3px;"></span> 编辑
                                                                </a>
                                                                    <%--编辑留言弹出窗口 --%>
                                                                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                                                                     tabindex="-1"
                                                                     id="lMessage-r-${status.index}"
                                                                     class="modal fade" style="display: none;">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <!--***** USER INFO *****-->
                                                                            <div class="col-md-12">
                                                                                <div class="card form" >
                                                                                    <div class="card-header">
                                                                                        <h3 style="display: inline"><i
                                                                                                class="fa fa-commenting-o"></i>编辑留言: ${s_message.getTitle()}
                                                                                        </h3>
                                                                                        <button aria-hidden="true"
                                                                                                data-dismiss="modal"
                                                                                                class="close"
                                                                                                type="button">X
                                                                                        </button>
                                                                                    </div>
                                                                                    <form action="<%=basePath%>updateMessage"
                                                                                          method="get">
                                                                                        <input type="hidden" name="id" value="${s_message.getId()}">
                                                                                        <input type="hidden" name="jumpPath" value="messageManager.jsp">
                                                                                        <div class="form-group">
                                                                                            <label for="lTitle">标题</label>
                                                                                            <input type="text" class="form-control"
                                                                                                   id="lTitle"
                                                                                                   placeholder="标题" name="title"
                                                                                                   value="${s_message.getTitle()}">
                                                                                        </div>

                                                                                        <div class="form-group"
                                                                                             style="margin-top: 0;">
                                                                                            <label for="lTextarea">内容</label>
                                                                                            <textarea class="form-control"
                                                                                                      id="lTextarea"
                                                                                                      rows="5"
                                                                                                      placeholder="在这里发表你的看法！"
                                                                                                      name="content">${s_message.getContent()}</textarea>
                                                                                        </div>
                                                                                        <button type="submit"
                                                                                                class="btn btn-general btn-blue mr-2">
                                                                                            提交
                                                                                        </button>
                                                                                    </form>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        <!-- /.modal-content -->
                                                                    </div>
                                                                </div>
<%--                                                                删除留言--%>
                                                                <a href="deleteMessage?id=${s_message.getId()}&jumpPath=messageManager.jsp"
                                                                   class="btn btn-sm btn-hover btn-danger"><span
                                                                        class="fa fa-remove"
                                                                        style="padding-right:3px;"></span>删除</a>
                                                            </div>
                                                            <% } %>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                        <%--一条留言的回复（每条留言都可以有多条回复）--%>
                                    <c:forEach var="s_reply" items="${replies}" varStatus="s">
                                        <c:if test="${s_reply.getMessageid().equals(s_message.getId())}">
                                            <%--SHOW REPLY--%>
                                            <div class="panel panel-default panel-faq">
                                                <div class="panel-heading">
                                                    <a data-toggle="collapse" data-parent="#accordion-${s.index}"
                                                       href="#faq-sub-cat${s.index}-${s_reply.getReplyid()}">
                                                        <h4 class="panel-title">
                                                                ${s_reply.getTitle()}
                                                            <span class="pull-right"><i class="fa fa-plus"></i></span>
                                                        </h4>
                                                    </a>
                                                </div>
                                                <div id="faq-sub-cat${s.index}-${s_reply.getReplyid()}"
                                                     class="panel-collapse collapse">
                                                    <div class="panel-body" style="padding-bottom: 0;">
                                                        By: <a href="#">${s_reply.getUsername()}</a>
                                                        at ${s_reply.getTime()}
                                                    </div>
                                                    <div class="panel-body" style="padding-top: 0;">
                                                            ${s_reply.getContent()}
                                                    </div>
                                                    <div class="panel-body" style="padding-top: 0;">
                                                            <%--添加删除按钮--%>
                                                        <form action="${path}deleteReply">
                                                            <input type="hidden" name="id"
                                                                   value="${s_reply.getReplyid()}">
                                                            <input type="hidden" name="jumpPath"
                                                                   value="messageManager.jsp">
                                                            <button class="btn btn-general btn-danger"
                                                                    style="color: red"
                                                                    type="submit">删除回复
                                                            </button>
                                                        </form>
                                                            <%--编辑回复信息弹窗--%>
                                                        <div class="panel panel-default panel-faq">
                                                            <a href="#myModal-r--r-${s.index}" data-toggle="modal"
                                                               title="Compose"
                                                               class="btn btn-general btn-white">
                                                                修改这条回复</a>
                                                            <!-- Modal -->
                                                            <div aria-hidden="true" aria-labelledby="myModalLabel"
                                                                 role="dialog"
                                                                 tabindex="-1"
                                                                 id="myModal-r--r-${s.index}" class="modal fade"
                                                                 style="display: none;">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="col-md-12">
                                                                            <div class="card form" id="form111">
                                                                                <div class="card-header">
                                                                                    <h3 style="display: inline">
                                                                                        <i class="fa fa-commenting-o"></i>
                                                                                        回复信息标题: ${s_reply.getTitle()}
                                                                                    </h3>
                                                                                    <button aria-hidden="true"
                                                                                            data-dismiss="modal"
                                                                                            class="close" type="button">
                                                                                        ×
                                                                                    </button>
                                                                                </div>
                                                                                <form action="${path}updateReply">
                                                                                        <%--                                                                                修改回复信息需要 回复信息的id--%>
                                                                                    <input type="hidden" name="rId"
                                                                                           value="${s_reply.getReplyid()}">
                                                                                    <input type="hidden" name="jumpPath"
                                                                                           value="messageManager.jsp">
                                                                                    <input type="hidden"
                                                                                           value="${s_message.getId()}"
                                                                                           name="rmsgId">
                                                                                    <div class="form-group">
                                                                                        <label for="title-2">标题</label>
                                                                                        <input type="text"
                                                                                               class="form-control"
                                                                                               id="title-2"
                                                                                               aria-describedby="title"
                                                                                               name="rTitle"
                                                                                               placeholder="输入标题"
                                                                                               value="${s_reply.getTitle()}">
                                                                                    </div>

                                                                                    <div class="form-group"
                                                                                         style="margin-top: 0;">
                                                                                        <label for="exampleTextarea-2">内容</label>
                                                                                        <textarea class="form-control"
                                                                                                  id="exampleTextarea-2"
                                                                                                  rows="4"
                                                                                                  name="rContent"
                                                                                                  placeholder="回复内容">${s_reply.getContent()}</textarea>
                                                                                    </div>
                                                                                    <button type="submit"
                                                                                            class="btn btn-general btn-blue mr-2">
                                                                                        修改回复信息
                                                                                    </button>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- /.modal-content -->
                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                        <%--回复信息弹窗--%>
                                    <div class="panel panel-default panel-faq">
                                        <a href="#myModal-${status.index}" data-toggle="modal" title="Compose"
                                           class="btn btn-compose">
                                            回复ta</a>

                                        <!-- Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                                             tabindex="-1"
                                             id="myModal-${status.index}" class="modal fade" style="display: none;">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <!--***** REPLY INFO *****-->
                                                    <div class="col-md-12">
                                                        <div class="card form" id="form1">
                                                            <div class="card-header">
                                                                <h3 style="display: inline">
                                                                    <i class="fa fa-commenting-o"></i>
                                                                    回复ta: ${s_message.getTitle()}</h3>
                                                                <button aria-hidden="true" data-dismiss="modal"
                                                                        class="close" type="button">×
                                                                </button>
                                                            </div>
                                                            <form action="${path}addReply" method="post">
                                                                <input type="hidden" name="jumpPath"
                                                                       value="messageManager.jsp">
                                                                <input type="hidden" value="${s_message.getId()}"
                                                                       name="rmsgId">
                                                                <div class="form-group">
                                                                    <label for="title">标题</label>
                                                                    <input type="text" class="form-control"
                                                                           id="title"
                                                                           aria-describedby="title" name="rTitle"
                                                                           placeholder="输入标题">
                                                                </div>

                                                                <div class="form-group" style="margin-top: 0;">
                                                                    <label for="exampleTextarea">内容</label>
                                                                    <textarea class="form-control"
                                                                              id="exampleTextarea"
                                                                              rows="4" name="rContent"
                                                                              placeholder="回复内容"></textarea>
                                                                </div>

                                                                <div class="row mt-3">
                                                                    <div class="col-md-12">
                                                                        <div class="card-header">
                                                                            <h3><i class="fa fa-user-circle"></i>
                                                                                你的信息
                                                                            </h3>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row" style="margin-top: 20px;">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="name">名称</label>
                                                                            <input type="text" class="form-control"
                                                                                   id="Name" name="rName"
                                                                                   aria-describedby="emailHelp"
                                                                                   placeholder="名称">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="email">邮箱</label>
                                                                            <input type="email" class="form-control"
                                                                                   id="Email" name="rEmail"
                                                                                   aria-describedby="emailHelp"
                                                                                   placeholder="邮箱">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="name">电话号码</label>
                                                                            <input type="tel"
                                                                                   class="form-control"
                                                                                   name="rNumber"
                                                                                   id="number"
                                                                                   aria-describedby="emailHelp"
                                                                                   placeholder="电话号码">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <button type="submit"
                                                                        class="btn btn-general btn-blue mr-2">
                                                                    回复
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>

                                        </div>

                                    </div>


                                </div>
                            </div>


                        </div>

                        <br><!-- 给每条留言都添加间隔 -->
                    </c:forEach>
                </div><!-- 一条留言信息 -->

            </div><!-- row end -->

        </div><!-- 留言面板结束 -->

    </div>
</div>

<!--Global Javascript -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper/popper.min.js"></script>
<script type="text/javascript" src="js/tether.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/chart.min.js"></script>
<script type="text/javascript" src="js/front.js"></script>

<script>
    <%--    这段代码其实就是当下滑了滚动条的时候，将信息标题固定到头部显示--%>
    (function ($) {
        var mn = $(".vert-tab");
        var mns = "vert-tab-scrolled";
        $(window).scroll(function () {
            if ($(this).scrollTop() > $('header').height()) {
                mn.addClass(mns);
            } else {
                mn.removeClass(mns);
            }
        });
        $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: (target.offset().top - 22)
                    }, 700, "easeInOutExpo");
                    return false;
                }
            }
        });
    })(jQuery);
</script>
</body>

</html>

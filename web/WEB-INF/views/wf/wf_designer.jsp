<%--
  Created by IntelliJ IDEA.
  User: liuhm
  Date: 2015/11/03
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String resourcePath = request.getServletContext().getInitParameter("resource_path") + "/";
%>
<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="zh-CN">
  <!--<![endif]-->
  <!-- BEGIN HEAD -->
  <head>
	<base href="<%=basePath%>">
	<meta charset="utf-8"/>
	<title>跑的快 | 后台管理系统-流程配置</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta content="" name="description"/>
	<meta content="" name="author"/>

    <link href="<%=resourcePath%>static/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=resourcePath%>static/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="<%=resourcePath%>static/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=resourcePath%>static/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="<%=resourcePath%>static/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=resourcePath%>static/global/plugins/jstree/dist/themes/default/style.min.css"/>

    <link rel="stylesheet" type="text/css" href="<%=resourcePath%>static/global/plugins/bootstrap-select/bootstrap-select.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=resourcePath%>static/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css" href="<%=resourcePath%>static/global/plugins/jquery-multi-select/css/multi-select.css"/>

    <link href="<%=resourcePath%>static/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="<%=resourcePath%>static/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="<%=resourcePath%>static/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>

    <link href="<%=resourcePath%>static/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>

    <link href="static/global/plugins/mxgraph/css/designer.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link href="<%=resourcePath%>static/img/logo.ico" rel="shortcut icon"/>


    <link rel="stylesheet" type="text/css" href="<%=resourcePath%>static/admin/css/sm/permission.css"/>
  </head>
	<body>
	  <div id="graph" class="base">
	  </div>
	  <div id="status" class="base" align="right">
	  </div>

    <jsp:include page="./wf_designer_dialog.jsp"/>

    <script>
        var mxBasePath = "<%=basePath%>";
        var mxResourcePath = "static/admin/wf/resources";
    </script>

    <!-- BEGIN CORE PLUGINS -->
    <!--[if lt IE 9]>
    <script src="<%=resourcePath%>static/global/plugins/respond.min.js"></script>
    <script src="<%=resourcePath%>static/global/plugins/excanvas.min.js"></script>
    <![endif]-->
    <script src="<%=resourcePath%>static/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
    <script src="<%=resourcePath%>static/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

    <script src="<%=resourcePath%>static/global/plugins/jstree/dist/jstree.min.js"></script>
    <script type="text/javascript" src="<%=resourcePath%>static/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="<%=resourcePath%>static/global/plugins/select2/select2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=resourcePath%>static/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
    <!-- END CORE PLUGINS -->
    <script src="<%=resourcePath%>static/global/scripts/metronic.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/admin/layout4/scripts/layout.js" type="text/javascript"></script>
    <script src="<%=resourcePath%>static/admin/js/menu/menu.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=resourcePath%>static/admin/js/inbox/inbox_msg.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=resourcePath%>static/admin/js/head/header.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript" src="static/global/plugins/mxgraph/mxClient.js"></script>

    <script type="text/javascript" src="static/admin/wf/js/mxApplication.js"></script>
    <script type="text/javascript" src="static/admin/wf/js/Designer.js"></script>
    <script type="text/javascript" src="static/admin/wf/js/DesignerDialog.js"></script>
    <script>
      var act = "edit";
      var flowId = '';
      var ctId = '';
      jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        initDesigner();

        initDialog();

      });
    </script>
	</body>
</html>

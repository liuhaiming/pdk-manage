<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="flowProDialog" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="flowProLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="flowProLabel"><i class="fa fa-user"></i> 流程属性</h4>
            </div>

            <div id="flowProPane" class="modal-body">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#flowProperty" data-toggle="tab">流程属性</a>
                    </li>
                    <li>
                        <a href="#canReadEmployee" data-toggle="tab">可阅人员</a>
                    </li>
                    <li>
                        <a href="#startEmployee" data-toggle="tab">发起人员</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="flowProperty">
                        <div class="form-group">
                            <label class="control-label">流程编码：</label>
                            <input type="text" id="code" name="code" class="form-control" maxlength="20"
                                   placeholder="系统自动分配流程编码" readonly/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">流程名称：</label>
                            <input type="text" id="name" name="name" class="form-control" maxlength="20" placeholder="请输入流程名称"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">默认主题：</label>
                            <input type="text" id="title" name="title" class="form-control" maxlength="20"
                                   placeholder="请输入流程名称"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">业务对象：</label>
                            <input type="text" id="funcId" name="funcId" class="form-control" maxlength="20"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label ">状态：</label>
                            <select id="status" name="status" class="form-control select2me-2">
                                <option value="0">启用</option>
                                <option value="1">禁用</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label ">创建人：</label>
                            <input type="text" id="createId" name="createId" class="form-control" readonly="true"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label ">创建时间：</label>
                            <input type="text" id="createTime" name="createTime" class="form-control" readonly="true"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label ">修改人：</label>
                            <input type="text" id="modifyId" name="modifyId" class="form-control" readonly="true"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label ">修改时间：</label>
                            <input type="text" id="modifyTime" name="modifyTime" class="form-control" readonly="true"/>
                        </div>
                    </div>
                    <div class="tab-pane" id="canReadEmployee">
                        <form action="" class="form-horizontal">
                            <div class="form-body">
                                <div class="table-toolbar">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="btn-group">
                                                <a type="button" class="btn btn-default" onclick="onSelAll()">
                                                    全选 <i class="fa fa-check-circle-o"></i>
                                                </a>
                                                <a type="button" class="btn btn-default" onclick="onDisSelAll()">
                                                    全消 <i class="fa fa-ban"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <select multiple="multiple" class="multi-select" id="func-select" name="my_multi_select2[]">
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="startEmployee">
                        qwe
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="taskDialog" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="orgLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="orgLabel"><i class="fa fa-cogs"></i>组织结构1</h4>
            </div>
            <div id="orgDetailPane" class="modal-body">
            </div>
        </div>
    </div>
</div>

<script>
    function initDialog() {
        initFuncList();
    }

    function initFuncList() {
        $.ajax({
            url: "sm/sm_permission/data_func_tree",
            type:"GET",
            dataType:'json',
            success: function(datas) {
                initList(eval(datas).menus);
                initMultiSelect();
            },
            error:  function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
    }

    function initMultiSelect() {
        $('#func-select').multiSelect({
            selectableHeader: "待选择功能节点",
            selectionHeader: "已选择功能节点",
            selectableOptgroup: true
        });
    }

    function initList(menus) {

        if(isNull(menus)) {
            return;
        }

        var menuHtml = "";
        $.each(menus, function() {

            var name = this.name;
            var childrens = this.children;
            menuHtml += "<optgroup label='"+name+"'>";

            if(!isNull(childrens) && childrens.length > 0) {
                $.each(childrens, function() {
                    menuHtml += "<option value="+this.id+">" + this.name + "</option>";
                });
            }else {
                menuHtml += "<option value="+this.id+">" + name + "</option>";
            }

            menuHtml += "</optgroup>";

        });
        $("#func-select").empty().html(menuHtml);

    }

    function onSelAll() {
        $("#func-select").multiSelect("select_all");
    }

    function onDisSelAll() {
        $("#func-select").multiSelect("deselect_all");
    }

    function initSelFuncList(roleId) {
        $.ajax({
            url: "sm/sm_permission/permission_func_list/" + roleId,
            data: {},
            dataType: "json",
            async: true,
            type: "POST",
            success: function (data) {
                onDisSelAll();

                for (var idx = 0; idx < data.funcIds.length; idx++) {
                    $("#func-select").multiSelect("select", data.funcIds[idx]);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {

            }
        });
    }

</script>
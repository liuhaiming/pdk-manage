var editor;
function initDesigner() {
	if (act == 'view') {
		editor = new mxApplication('static/admin/wf/resources/layouteditor_view.xml');
		editor.graph.setCellsLocked(true);
		editor.graph.getAllConnectionConstraints = null;
		
	}
	else {
		editor = new mxApplication('static/admin/wf/resources/layouteditor.xml');
	}

	$(".line").removeClass("margin");
}
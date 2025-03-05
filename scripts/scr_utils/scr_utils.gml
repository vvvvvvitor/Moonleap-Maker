/// @desc Safe struct value loading
function struct_read(_struct, _property, _default) {
	var _val = variable_struct_get(_struct, _property);
	return is_undefined(_val) ? _default : _val;
}

function in_hub_view() {
	var _x1 = min(oCamera.hubx,oCamera.hubx_prev);
	var _y1 = min(oCamera.huby,oCamera.huby_prev);
	var _x2 = max(oCamera.hubx,oCamera.hubx_prev)+oCamera.view_width;
	var _y2 = max(oCamera.huby,oCamera.huby_prev)+oCamera.view_height;
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, _x1, _y1, _x2, _y2);
}

function on_desktop() {
	return ((os_type == os_windows) or (os_type == os_linux) or (os_type == os_macosx));
}


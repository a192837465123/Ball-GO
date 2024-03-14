shader_type spatial;
render_mode unshaded, cull_front;

void vertex() {
	VERTEX += normalize(VERTEX) * 0.1;
}

void fragment() {
	ALBEDO = vec4(0.0).rgb;
}
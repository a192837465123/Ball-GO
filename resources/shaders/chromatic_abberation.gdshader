shader_type canvas_item;

uniform vec2 red_displacement = vec2(3.0, 0.0);
uniform vec2 green_displacement = vec2(0.0, 0.0);
uniform vec2 blue_displacement = vec2(-3.0, 0.0);

uniform sampler2D screen_texture : hint_screen_texture, filter_nearest_mipmap;

void fragment() {
	float red = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE * red_displacement), 0.0).r;
	float green = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE * green_displacement), 0.0).g;
	float blue = texture(screen_texture, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE * blue_displacement), 0.0).b;

	COLOR = vec4(red, green, blue, 1.0);
}
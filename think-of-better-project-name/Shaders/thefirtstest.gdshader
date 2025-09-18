 //used Procedural Circular Progress Bar by imjp94 https://godotshaders.com/shader/procedural-circular-progress-bar/
 //also used Random displacement animation (Easy UI animation) by enekoassets https://godotshaders.com/shader/random-displacement-animation-easy-ui-animation/



shader_type canvas_item;

uniform float value : hint_range(0.0001, 1.0) = 1.0;
uniform int segments = 3;
uniform float radius = 0.475;
uniform float hollow_radius = 0.0;
uniform float margin : hint_range(0.0, 1.0) = 0.0;
uniform float rotation : hint_range(-1.0, 1.0);
uniform float progress_rotation : hint_range(-1.0, 1.0);
uniform sampler2D gradient : source_color;
uniform bool use_value_gradient = false;
uniform sampler2D radius_curve;

// other shader shit
uniform float interval = 0.5; // the displacement will happen every [interval] seconds
uniform float timeDelay = 0.0; // use it if you don't want all the sprites to move at the same time
uniform float intensityX = 20.0; // X axis force of movement
uniform float intensityY = 20.0; // Y axis force of movement
uniform float seed = 42.0; // seed to randomize movement



vec4 get_gradient_color(sampler2D src, float position) {
	position = clamp(position, 0.01, 0.99); // Color at 0.0 and 1.0 get interpolated by both end
    return texture(src, vec2(position, 0.5));
}

float map_range(float min1, float max1, float min2, float max2, float v) {
	float p = (v - min1) / (max1 - min1);
	return p * (max2 - min2) + min2;
}

vec2 rotate_uv(vec2 uv, float p_rotation){
    float mid = 0.5;
    return vec2(
        cos(p_rotation) * (uv.x - mid) + sin(p_rotation) * (uv.y - mid) + mid,
        cos(p_rotation) * (uv.y - mid) - sin(p_rotation) * (uv.x - mid) + mid
    );
}

float circle_shape(vec2 uv, float p_radius) {
	vec2 center = vec2(0.5, 0.5);
	return 1.0 - step(p_radius, distance(center, uv));
}

float radial_shape(vec2 uv, int p_segments) {
	float radial = 0.0;
	uv -= 0.5;
	radial = atan(uv.y, uv.x);
	radial = map_range(-PI, PI, 0.0, float(p_segments), radial);
	radial = mod(radial, 1.0);

	return radial;
}

void fragment() {
	vec2 uv = UV;
	uv = rotate_uv(uv, PI/2.0); // Rotate 90 degrees, so origin pointing at north be default
	uv = rotate_uv(uv, rotation * PI);

	float t = radial_shape(uv, 1);
	if (use_value_gradient) {
		t = value;
	}
	float radius_t = get_gradient_color(radius_curve, radial_shape(uv, 1)).r;

	float shape = radial_shape(uv, segments);
	float border_size = (1.0-margin)/2.0;
	shape *= step(border_size, shape);
	shape *= step(shape, 1.0 - border_size);
	shape = step(shape, 0.0);

	uv = rotate_uv(uv, progress_rotation * PI);
	float arc = radial_shape(uv, 1);
	arc = step(arc, value);

	float bounds = circle_shape(uv, radius * radius_t);
	float hollow = 1.0-circle_shape(uv, hollow_radius * radius_t);

	shape = shape * arc * bounds * hollow;

	vec4 gradient_color = get_gradient_color(gradient, t);
	COLOR = vec4(gradient_color.rgb, shape);
}


//more shader shit thats diffrent which is displaced
void vertex() {
	float chunk = floor((TIME + timeDelay) / interval);
	float seedNum = VERTEX.x + VERTEX.y + chunk + seed;
	float offsetX = sin(seedNum * 12.9898) * 43758.5453;
	float offsetY = sin(seedNum * 32.9472) * 94726.0482;
	offsetX = fract(offsetX);
	offsetX = offsetX * 2.0 - 1.0;
	offsetY = fract(offsetY);
	offsetY = offsetY * 2.0 - 1.0;
	VERTEX += vec2(offsetX * intensityX, offsetY * intensityY);

}
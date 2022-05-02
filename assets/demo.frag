// copied from https://codesandbox.io/s/o432o

precision mediump float;

varying vec2 vUvs;

uniform sampler2D uSampler2;
uniform float time;
// uniform vec2 base;
uniform float baseX;
uniform float baseY;
uniform float offsetX;
uniform float offsetY;
uniform float zoom;

vec2 cmpxmul(in vec2 a, in vec2 b) {
	return vec2(a.x * b.x - a.y * b.y, a.y * b.x + a.x * b.y);
}

void main() {
    vec2 base = vec2(baseX * 0.01, baseY * 0.01);
    // vec2 base = vec2(0.0, 0.0);
    // vec2 z = (vUvs - (vec2(0.0,0.0) * 1.0)) / (zoom * 1.0);
    // vec2 z = (vUvs - (base * 0.4)) / (zoom * 1.0);
    vec2 z = (vUvs - (base * 0.4)) / (zoom * 1.0);
    // vec2 z = vec2(0.0, 0.0);
    bool escaped = false;
    for (int i = 0; i < 100; i++) {
        z = cmpxmul(z, z) + vec2(offsetX * 0.01, offsetY * 0.01);
        // z = cmpxmul(z, z) + vec2(0.454, 0.0);
        if (length(z) > 10000.0) {
            escaped = true;
            break;
        }
    }
    if (escaped) {
        // gl_FragColor = vec4(vUvs, sin(vUvs.x * 10.0), sin(vUvs.y * 0.0));
        gl_FragColor = vec4(0.0,0.0,0.3,0.0);
    } else {
        gl_FragColor = vec4(1.0,0.8,0.6,0.0);
    }
    // if (base.x >= base.y) {
    //     gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    // } else {
    //     gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
    // }
    // gl_FragColor = vec4(base, 0.0, 1.0);
}

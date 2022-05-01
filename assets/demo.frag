// copied from https://codesandbox.io/s/o432o

precision mediump float;

varying vec2 vUvs;

uniform sampler2D uSampler2;
uniform float time;

void main() {
    gl_FragColor = texture2D(uSampler2, vUvs + sin( (time + (vUvs.x) * 14.) ) * 0.1 );
}

struct GlobalUniforms {
  projectionMatrix: mat3x3<f32>,
  worldTransformMatrix: mat3x3<f32>,
  worldColorAlpha: vec4<f32>,
  uResolution: vec2<f32>,
}

struct LocalUniforms {
  uTransformMatrix: mat3x3<f32>,
 uColor: vec4<f32>,
 uRound: f32,
}

@group(0) @binding(0) var<uniform> globalUniforms : GlobalUniforms;
@group(1) @binding(0) var<uniform> localUniforms : LocalUniforms;

struct VertexOutput {
  @builtin(position) position: vec4<f32>,
  @location(1) aUvs: vec2<f32>,
}

@vertex
fn vert_main(
  @location(0) aPosition: vec2<f32>,
  @location(1) aUvs: vec2<f32>,
) -> VertexOutput {
  var mvp = globalUniforms.projectionMatrix * globalUniforms.worldTransformMatrix * localUniforms.uTransformMatrix;

  let screen_position = vec4<f32>(mvp * vec3<f32>(aPosition, 1.0), 1.0);
  return VertexOutput(screen_position, aUvs);
}

fn cmpxmul(a: vec2<f32>, b: vec2<f32>) -> vec2<f32> {
  return vec2<f32>(a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x);
}

@fragment
fn frag_main(input: VertexOutput) -> @location(0) vec4<f32> {

  let uv = input.aUvs;
  let base = vec2<f32>(0.0, 0.0);
  let zoom = 1.0;
  let offset_x = 0.14;
  let offset_y = 0.6;

  var z = uv - base * 0.4 / zoom;
  var escaped = false;
  for (var i = 0; i < 100; i = i + 1) {
    z = cmpxmul(z, z) + vec2f(offset_x, offset_y);
    if length(z) > 10000.0 {
      escaped = true;
      break;
    }
  }

  if escaped {
    return vec4<f32>(0.0, 0.0, 0.5, 1.0);
  }

  return vec4<f32>(1.0, 0.8, 0.6, 1.0);
}
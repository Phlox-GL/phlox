
Phlox in calcit-js
----

> Pixi.js DSL in Calcit with hot code swapping, inspired by Virtual DOMs. Currently only a small subset of Pixi.js features is supported.

Previews http://r.tiye.me/Phlox-GL/phlox/ .

### 0.32.0 迁移候选：使用者影响

候选 `0.8.0` 将 CLI 与 `@calcit/procs` 配对正式 `0.32.0`，消费者需要整图
升级、重新生成 JS 并重启开发服务。依赖声明对齐 Touch Control `0.0.35`、
Pointed Prompt `0.0.24` 和 JS-FFI `0.2.8`；前两项当前以本地候选验证，正式
发布图尚待验收，不应提前引用未发布的 tag 或 main/hash。

官方工具转换 25 处旧类型表达式，289 个项目定义的 schema 合同保持不变。
不改变 Pixi 7、控件默认值、混合状态游标、HUD 或原九项测试。全定义检查
355/355、完整 strict（无诊断）、原九项测试和构建通过；dynamic-method 与
deprecated-call 均为零。本轮真实 Circling Tree 消费者已通过完整 strict、公共定义和构建，并实际验证
场景切换、Bezier 控制点拖动和刷新启动，控制台无 warning/error。消费者 CI 固定
到已迁移的精确提交，保留 Snapshot 不被验收流程改写的检查。本库 Demo 已实际验证滑块数值更新、按钮回调、开关、单行输入提交和刷新启动，
无 console error；Pixi drop-shadow 仍报告 FILTER_RESOLUTION 废弃提示。IAB 中
静态标签消失现象仍按 #71 保留，不能宣称全部显示正常。正式发布依赖图和远端
CI 尚待验收；下面的 0.31 结果仅为历史记录。

### 历史：0.31.0 工具链与使用者影响

候选 **0.8.0-alpha.3** 配对正式 **Calcit / @calcit/procs 0.31.0**，依赖图同步到真实声明 0.31 的 Touch Control **0.0.34**、JS-FFI **0.2.7**、Pointed Prompt **0.0.23**。消费者须整图同步、重新生成 JS 并重启开发服务；正式 tag 发布前不要引用候选 main/hash。保留已有 0.8 alpha 发布线，不向旧 0.7 稳定线回退。

本候选 Snapshot 与已发布 0.8.0-alpha.2 完全相同，不改控件、公开类型、公式、默认值或原九项测试。PhloxElement 的名义返回类型、受检宿主入口，以及混合数字/字符串/Tag 游标所需的 `Map<Dynamic, Dynamic>` 保持；不扩大业务 store/props、不伪造类型或放宽 strict。

历史上 #75 已改变部分可选参数的行为：只对缺失键取默认值，显式 nil 不再先回落；该差异不是本候选新改动，也不回滚。Pointed Prompt 两条提交路径继续检查真实 DOM value；正常提交不变，缺失或非 String 的宿主值报错。真实异构样式 merge、首个字符串替换语义均保留。

npm 触控包仅提供 CSS，与 Calcit 模块独立；继续使用 @quamolit/touch-control 0.0.13。Pixi 7、@pixi/core 7.4.0、drop-shadow peer 与保留的 user-select 规则不变。原完整 strict、九项测试及真实 Circling Tree 消费者验证保持；消费者夹具固定到已有 canonical Snapshot 的精确 main 提交，明确使用本地未发布候选，不冒充 Caps 发布图。IAB 可见性风险继续按 [#71](https://github.com/Phlox-GL/phlox/issues/71) 跟踪，不添加 renderer 缓存绕过。

只维护 calcit.cirru / deps.cirru，不提交 js-out 或临时迁移脚本，不增加编译器改写规则、证明系统或验证框架。开发分别运行 `yarn dev` 和 `calcit calcit.cirru js -w`。

### 前端 COS/CDN 部署

COS Action 1.2.0 使用原 public-base-url 和内置 verify。PR 前端资源按仓库/PR/run/attempt 隔离，不部署生产；fork 不上传，同仓缺少 secrets 时保持原提示/跳过策略。原生产 COS/rsync 路径、SSH host key 和队列门禁不变，合并会触发 Demo 部署，不表示允许合并或部署下游业务项目。项目源码未变不代表所有消费者、浏览器或平台已验收；结果以精确提交 CI 和实际交互为准。

### Usage

`render!` to add canvas to `<body/>`:

```cirru
ns app.main
  :require
    phlox.core :refer $ hslx render! rect text

defn comp-demo ()
  rect
    {}
      :position $ [] 800 40
      :size $ [] 60 34
      :fill $ hslx 40 80 80
      :on $ {}
        :pointertap $ fn (e d!) (d! (:: :demo))
    text $ {}
      :text "|Demo"
      :position $ [] 808 44
      :style $ {}
        :fill (hslx 120 80 20)
        :font-size 18
        :font-family "|Josefin Sans"

defn dispatch! (op)
  println op
  &unit

defn main ()
  render! (comp-demo) dispatch! ({})

defn reload! ()
  render! (comp-demo) dispatch! $ {} (:swap? true)
```

Notice that Phlox uses `:pointertap` instead of `:click` for touch screen support.

### Global keyboard events

Phlox supports a naive global event system for listening to keyboard events from elements:

```cirru
:on-keyboard $ {}
  :down $ fn (e dispatch!)
  :press $ fn (e dispatch!)
  :up $ fn (e dispatch!)
```

Phlox currently uses Pixi.js 7.x. Pointer handlers receive `(event dispatch!)`; `dispatch!` receives one operation, for example `(:: :demo)` or `(:: :states cursor data)`.

### Spec

Add a container:

```cirru
{}
  :position $ [] 1 1
  :pivot $ [] 0 0
  :rotation 0
  :alpha 1
  :on $ {}
    :pointertap (fn ())
  :on-keyboard $ {}
    :down (fn ())
```

Draw a circle:

```cirru
{}
  :position $ [] 1 1
  :radius 1
  :line-style $ {}
    :width 2
    :color 0x000001
    :alpha 1
  :fill 0x000001
  :on $ {}
    :pointertap (fn ())
  :alpha 1
  :on-keyboard $ {}
    :down (fn ())
```

Draw a rectangle:

```cirru
{}
  :position $ [] 1 2
  :size $ [] 1 1
  :line-style $ {}
    :width 2
    :color 0x000001
    :alpha 1
  :fill 0x000001
  :on $ {}
    :pointertap (fn ())
  :radius 1
  :rotation 1
  :pivot $ [] 1 2
  :alpha 1
  :on-keyboard $ {}
    :down (fn ())
```

Draw text:

```cirru
{}
  :text "demo"
  :position $ [] 1 1
  :pivot $ [] 0 0
  :rotation 0
  :alpha 1
  :style $ {}
    :fill "|red"
    :font-size 14
    :font-family "|Hind"
  :on-keyboard $ {}
    :down (fn ())
```

> `:align :center` is handled via special logic, need deeper investigation.

Draw graphics(use `phlox.core/g` for validations):

```cirru
{}
  :ops $ []
    g :move-to $ [] 1 1
    g :line-to $ [] 2 2
    g :line-style $ {}
    g :begin-fill $ {} (:color "red")
    g :end-fill nil
    g :close-path nil
    g :arc-to $ {} (:p1 $ [] 200 200) (:p2 $ [] 240 180) (:radius 90)
    g :arc $ {} (:center $ [] 260 120) (:radius 40) (:angle $ [] 70 60) (:anticlockwise? false)
    g :bezier-to $ {} (:p1 $ [] 400 500) (:p2 $ [] 300 200) (:to-p $ 600 300)
    g :quadratic-to $ {} (:p1 $ [] 400 100) (:to-p $ [] 500 400)
  :position $ [] 1 1
  :pivot $ [] 1 2
  :rotation 0
  :alpha 1
  :on $ {}
    :pointertap (fn ())
  :on-keyboard $ {}
    :down (fn ())
```

Notice that Pixi.js takes colors in hex numbers. `phlox.core/hslx` is added for convenience.

### Components

`phlox.comp.button/comp-button` provides a clickable button:

```cirru
comp-button $ {}
  :text "|DEMO BUTTON"
  :position $ [] 100 0
  :align-right? false
  :on $
    :pointertap (fn (e d!) (js/console.log "|pointertap event" e d!))

comp-button $ {}
  :text "|Blue"
  :position $ [] 100 60
  :color (hslx 0 80 70)
  :fill (hslx 200 80 40)

comp-button $ {}
  :text "|Quick pointertap"
  :position $ [] 100 0
  :on-pointertap $ fn (e d!) (js/console.log "|pointertap event" e d!)
```

`phlox.comp.slider/comp-slider` provides a little slider bar of a number, changes on dragging:

```cirru
comp-slider (>> states :c) $ {}
  :value (:c state)
  :unit 10
  :min 1
  :max 10
  :round? true
  :position $ [] 20 120
  :fill (hslx 50 90 70)
  :color (hslx 200 90 30)
  :on-change $ fn (value d!) (d! cursor (assoc state :c value))
```

Also `comp-slider-point` is a minimal version for `comp-slider`, it does not accept `:title`s.

`comp-spin-slider` support change value via touch and spin:

```cirru
comp-spin-slider (>> states :c) $ {}
  :value (:c state)
  :unit 10
  :min 1
  :max 10
  :position $ [] 20 120
  :fill (hslx 50 90 70)
  :color (hslx 200 90 30)
  :fraction 1
  :on-change $ fn (value d!) (d! cursor (assoc state :c value))
  :on-move $ fn (pos d!) (d! cursor (assoc state :pos pos))
```

`phlox.comp.drag-point/comp-drag-point` provides a point for dragging:

```cirru
comp-drag-point (>> states :p3) $ {}
  :position (:p3 state)
  :unit 0.4
  :title "|DEMO"
  :radius 6
  :fill (hslx 0 90 60)
  :alpha 1
  :color (hslx 0 0 50)
  :hide-text? false
  :on-change $ fn (position d!) (d! cursor (assoc state :p3 position))
```

`phlox.comp.switch/comp-switch` provides a switch button:

```cirru
comp-switch $ {}
  :value (:value state)
  :position $ [] 100 20
  :title "|Custom title"
  :on-change $ fn (value d!) (d! cursor (assoc state :value value))
```

`phlox.comp.messages/comp-messages` for rendering messages:

```cirru
comp-messages $ {}
  :messages (:messages state)
  :position $ [] 16 (- js/window.innerWidth 16)
  :color (hslx 0 0 50)
  :fill (hslx 0 0 30)
  :bottom? false
  :on-pointertap (fn (message d!))
```

`phlox.comp.arrwo/comp-arrow` for arrows:

```cirru
comp-arrow (>> states :demo1)
  {}
    :from $ :from state
    :to $ :to state
    :width 2
    :arm-length 8
    :on-change $ fn (from to d!)
      d! cursor $ assoc state :from from :to to
```

### Cursor and states

`>>` for branching states:

```cirru
phlox.core/>> state :a
```

`update-states` for handling states change, used in updater:

```cirru
phlox.cursor/update-states store $ [] cursor op-data
```

### Text input

To interact with text input:

```cirru
phlox.input/request-text! e $ {}
  :placeholder "|text.."
  :initial "|demo"
  :textarea? false
  :style $ {}
  fn (result) (println "|got:" result)
```

### Complex number

`phlox.complex` contains several util functions to work with complex numbers like `[x y]`.

- `add`, adds two complex numbers
- `minus`, adds one to another
- `times`, mutiply two complex numbers
- `rebase`, actualy "divide", renamed since naming collision.
- `divide-by`, divide by scalar number `x`.
- `rand-point`, returns a random `[x y]`, takes 1 or 2 arguments

### Workflow

Workflow https://github.com/Quamolit/phlox-workflow

### License

MIT

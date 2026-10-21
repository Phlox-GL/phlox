
Phlox in calcit-js
----

> Pixi.js DSL in Calcit with hot code swapping, inspired by Virtual DOMs. Currently only a small subset of Pixi.js features is supported.

Previews http://r.tiye.me/Phlox-GL/phlox/ .

### 前端 COS/CDN 部署

COS Action 1.2.0 使用已有 `public-base-url` 执行内置引用与公开访问 verify，不复制额外校验脚本。PR 资源按仓库/PR 编号/run/attempt 隔离，Vite base 与 COS prefix 来自同一结果。生产 COS 与原 rsync 路径、SSH host key 校验保持不变；fork PR 不上传，缺少 COS secrets 的同仓 PR 仍按原策略提示并跳过上传。

使用者注意：候选 0.7.16 配对正式 Calcit/procs **0.30.1**、touch-control 0.0.32、pointed-prompt 0.0.20、js-ffi 0.2.5。严格消费者需同步整张依赖图、重新生成 JS 并刷新，不混装旧 alpha。0.7.16 正式 tag 发布前，不应引用本分支或 main/hash。元素、操作和状态 Map 的外部数据形状、Pixi 7、生产部署路径不变；npm 显式提供与既有 pixi.js 7.4.0 一致的 @pixi/core，补齐 drop-shadow 原先缺失的 peer，不升级 Pixi 大版本。

当前 main 已合并 #75；官方 program-diff 显示相对已发布 0.7.15 有 19 个定义的表达式变化。部分可选参数现在只对缺失键使用默认值，显式 nil 不再先回落为默认值。后续发版需说明并验收这一语义差别，不能宣称所有默认值行为不变；本分支的返回类型补准不改动这些表达式。

宿主标量返回值及开放数据现在通过既有检查器进入 Number/Bool/String/List/Map 合同；不合法的数据将尽早报错，不再靠伪断言或标量强转蒙混通过。仍保留真实异构 props、宿主对象和回调边界，不宣称零 Dynamic/unsafe。Demo 时钟修正为调用 `Date.now()`，而不是把函数对象当作时间；样式的 camel-case 修正为使用字符串索引，仍仅替换第一个匹配项。

元素构造函数现在准确返回已有 `phlox.schema/PhloxElement`（包括 create-element/create-list 和各 DSL 构造器），不再把名义类型擦成 Dynamic。消费者可直接在返回 schema 中使用此类型，无需创建 `def ... &unit` 占位类型或对返回值添加断言；元素运行时结构不变。

`phlox.comp.switch/comp-switch` 的返回 schema 同样明确为已有 `phlox.schema/PhloxElement`；输入合同、默认值和控件行为不变，不为此添加强转。npm 触控依赖只提供 CSS，改用正式 `@quamolit/touch-control` 0.0.13；它与 Calcit 模块版本独立。已逐行比较旧 alpha 样式，唯一缺少的两条 `user-select` 禁止选择规则保留在本项目 CSS 中，不改变原触控选择行为。

列表控件的状态游标可以包含数字、字符串和 Tag，key 不会被改名或序列化成其他类型。`>>` 的状态树输入/返回明确为 `Map<Dynamic, Dynamic>`：同一节点包含 Tag 元数据和数字/字符串子分支，不能伪称所有 key 都是 Tag。它仍检查分支是 Map、父游标是 List；非 Map 分支仍报错。Arrow、Spin Slider 与 Demo 的对应 states 参数遵循同一合同，业务 `:data`、store、props 合同不扩大。消费者不应对 `>>` 伪造 Fn 签名；相应状态树参数也须反映真实异构 key，不宣称因此消除了 Dynamic。

同一 PR/生产分支排队，不取消进行中的上传；job/upload 分别限时 15/10 分钟。CI 保留全定义检查，覆盖原 28 个公开 namespace，不再重复维护手写列表；完整 strict 明确要求 passed 且 diagnostics 为空。原有 9 项测试全部保留，包括数字游标状态写入/读取及字符串 key 与数字兄弟分支共存，脚本错误必须立即失败。没有新增固定改写规则、验证 runner、baseline 或 COS 探测脚本。开发另运行 `calcit calcit.cirru js -w`；只提交 `calcit.cirru` / `deps.cirru`，不提交 js-out 或临时通知文件。正式 CLI 验收由 Linux CI 完成，旧 alpha.4 本地基线不替代正式依赖图验证，也不代表所有平台已有正式 CLI 资产。

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

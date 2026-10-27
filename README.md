
Phlox in calcit-js
----

> Pixi.js DSL in Calcit with hot code swapping, inspired by Virtual DOMs. Currently only a small subset of Pixi.js features is supported.

Previews http://r.tiye.me/Phlox-GL/phlox/ .

### 当前 0.31.0 工具链

CLI / `@calcit/procs` 成对使用已发布的 `0.31.0`，Pointed Prompt 使用同样配对正式工具链的 `0.0.22`；固定的真实消费者夹具同步使用这一依赖图。消费者需同步全部模块并重新生成 JS，不混用旧 alpha 工具链。

新模块版本将包含 main 已合入的列表控件类型检查修复与正式工具链配对；已发布的 `0.8.0-alpha.1` 不变。模块版本以 `deps.cirru` 和对应 tag 为准。本轮不修改 Snapshot、控件合同或原九项测试，保留完整 strict、真实消费者验证和原 npm 隔离设置。

下方 0.30.1 迁移说明属于历史记录；稳定消费者继续使用原发布维护线。

### 前端 COS/CDN 部署

COS Action 1.2.0 使用已有 `public-base-url` 执行内置引用与公开访问 verify，不复制额外校验脚本。PR 资源按仓库/PR 编号/run/attempt 隔离，Vite base 与 COS prefix 来自同一结果。生产 COS 与原 rsync 路径、SSH host key 校验保持不变；fork PR 不上传，缺少 COS secrets 的同仓 PR 仍按原策略提示并跳过上传。

### 0.7.18 正式依赖图迁移候选

使用者影响：仍配对正式 Calcit/procs 0.30.1。严格消费者需同时使用
touch-control 0.0.33、js-ffi 0.2.6 和 pointed-prompt 0.0.21，重新生成 JS；
不要只升级一个模块后混用旧依赖图。Phlox Snapshot、公开类型、Pixi 和控件逻辑不变。
Pointed Prompt 改用已检查的 DOM value 入口：正常 input/textarea 提交行为不变，
缺失或非字符串的异常宿主 value 会报错，不再静默回落为空串。

本轮不修改源码或放宽质量基线。原九项测试、完整 strict 与固定版本的真实
Circling Tree 消费者继续使用同一候选依赖图验收；COS 仅使用 Action 自带 verify。
候选版本正式发布前不要引用其 tag，不以 main/hash 替代正式依赖。
合并可能触发原 Demo 前端部署，不代表允许合并或部署下游业务项目。

### 0.7.17 公开 Option 方法迁移记录

使用者影响：配对正式 Calcit/procs0.30.1，依赖图与已发布0.7.16相同。
将77个定义中的517处 `option:unwrap-or` 和51处 `option:unwrap` 改为公开
`.unwrap-or` / `.unwrap`；原参数、默认值表达式、数据/回调合同、宿主身份和绘图公式不变。
上述源码命中含1处注释子树，其余567处为普通代码；不把注释写法计为运行调用。
四项原附着测试中的9处解包也同步迁移，测试名、标签、断言与操作数保持不变，不新增测试框架。
对全部29个命名空间/291个定义读取附着元数据，共9项测试、0项examples；迁移后旧调用为零。
不回滚#75相对0.7.15已引入的默认值语义差异，不增加消费者强转或renderer缓存绕过。
候选版本以 `deps.cirru :version` 为准；正式tag发布前不要引用未发布版本或main/hash。
不把一次性源码事务成功或普通源码检索归零当作附着区域、运行语义或整个生态迁移已完成。

本轮精确CI、原测试、真实消费者和Demo操作结果见迁移PR。
临时事务输入/源码导出workflow已经移除，不作为永久fix子系统或额外项目检查脚本保留。
两个preset的空建议本身不覆盖Option调用迁移，不能替代上述附着元数据核查；暂态审计步骤也不保留在CI。
Actions使用精确正式tag，接受tag可移动风险；原COS内置verify、前端路径和SSH host key校验不变。

以下保留0.7.16的历史迁移说明，不代表本轮新增行为或验收：

已发布0.7.16配对正式 Calcit/procs **0.30.1**、touch-control0.0.32、pointed-prompt0.0.20、js-ffi0.2.5。严格消费者需同步整张依赖图、重新生成JS并刷新，不混装旧alpha。元素、操作和状态Map的外部数据形状、Pixi7、生产部署路径不变；npm显式提供与既有pixi.js7.4.0一致的@pixi/core，补齐drop-shadow原先缺失的peer，不升级Pixi大版本。

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

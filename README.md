
Phlox in calcit-js
----

> Pixi.js DSL in ClojureScript with hot code swapping, inspired by Virtual DOMs. Currently only a small subset of Pixi.js features is supported.

Previews http://r.tiye.me/Phlox-GL/phlox/ .

### Usage

`render!` to add canvas to `<body/>`:

```cirru
ns app.main $
  :require $ [] phlox.core :refer
    [] hslx render! create-list rect circle text container graphics >>

defn comp-demo (data)
  rect
    {}
      :position $ [] 800 40
      :size $ [] 60 34
      :fill $ hslx 40 80 80
      :on $ :pointertap $ fn (e d!) (d! :demo nil)
    text $ {}
      :text "|Demo"
      :position $ [] 808 44
      :style $ {}
        :fill (hslx 120 80 20)
        :font-size 18
        :font-family "|Josefin Sans"

defatom *store nil

defn dispatch! (op op-data)
  reset! *store (updater @*store op op-data))

defn main ()
  render! (comp-demo data) dispatch! ({})

defn reload! ()
  render! (comp-container @*store) dispatch! $ {} (:swap? true)
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

> Notice that Phlox depends on PIXI `6.5.x`. In `7.x` the event system is refactored and breaks Phlox.

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

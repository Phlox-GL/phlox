
{} (:package |phlox)
  :configs $ {} (:init-fn |phlox.app.main/main!) (:reload-fn |phlox.app.main/reload!) (:version |0.7.1)
    :modules $ [] |memof/ |lilac/ |pointed-prompt/ |touch-control/
  :entries $ {}
  :files $ {}
    |phlox.app.comp.drafts $ %{} :FileEntry
      :defs $ {}
        |comp-drafts $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-drafts (x)
              container
                {}
                  :position $ [] 100 100
                  :rotation 0
                circle $ {}
                  :position $ [] 200 100
                  :radius 40
                  :line-style $ {} (:width 4)
                    :color $ hslx 0 80 50
                    :alpha 1
                  :fill $ hslx 160 80 70
                  :on $ {}
                    :pointertap $ fn (event dispatch!) (dispatch! :add-x nil)
                rect
                  {}
                    :position $ [] 40 40
                    :size $ [] 50 50
                    :line-style $ {} (:width 4)
                      :color $ hslx 0 80 50
                      :alpha 1
                    :fill $ hslx 200 80 80
                    :on $ {}
                      :pointertap $ fn (e dispatch!) (dispatch! :add-x nil)
                    :rotation $ + 1 (* 0.1 x)
                    :pivot $ [] 0 0
                  text $ {}
                    :text $ str "\"Text demo:"
                      + 1 $ * 0.1 x
                      , &newline "\"pivot"
                        to-lispy-string $ {} (:x 100) (:y 100)
                    :style $ {} (:font-family "\"Menlo") (:font-size 12)
                      :fill $ hslx 200 80 90
                      :align :center
                text $ {}
                  :text $ str "\"Text demo:" x
                  :style $ {} (:font-family "\"Menlo") (:font-size 12)
                    :fill $ hslx 200 80
                      + 80 $ * 20 (js/Math.random)
                    :align :center
                  :alpha 1
                create-list :container ({})
                  -> (range 20)
                    map $ fn (idx)
                      [] idx $ text
                        {}
                          :text $ str idx
                          :style $ {} (:font-family "\"Helvetica Neue") (:font-weight 300) (:font-size 14)
                            :fill $ hslx 200 10
                              + 40 $ * 4 idx
                          :position $ []
                            + 200 $ * idx 20
                            + 140 $ * idx 10
                          :rotation $ * 0.1 (+ idx x)
                graphics $ {}
                  :ops $ []
                    g :line-style $ {} (:width 4)
                      :color $ hslx 200 80 80
                      :alpha 1
                    g :begin-fill $ {}
                      :color $ hslx 0 80 20
                    g :move-to $ []
                      + (* 20 x) 100
                      , 200
                    g :line-to $ []
                      + (* 20 x) 400
                      , 400
                    g :line-to $ []
                      - 500 $ * 20 x
                      , 300
                    g :close-path
                  :rotation 0.1
                  :pivot $ [] 0 100
                  :alpha 0.5
                  :on $ {}
                    :pointertap $ fn (e dispatch!) (println "\"clicked")
                rect $ {}
                  :position $ [] 400 40
                  :size $ [] 20 20
                  :fill $ hclx 240 100 60
                image $ {} (:url "\"https://cdn.tiye.me/logo/quamolit.png")
                  :size $ [] 100 100
                  :position $ [] 400 -100
                  :on $ {}
                    :pointertap $ fn (e d!) (println "\"click on image")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.comp.drafts $ :require
            [] phlox.core :refer $ [] g hslx hclx rect circle text container graphics create-list image
    |phlox.app.comp.keyboard $ %{} :FileEntry
      :defs $ {}
        |comp-keyboard $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-keyboard (on? counted)
              container
                {} $ :position ([] 120 200)
                container
                  {} $ :position ([] 0 0)
                  rect $ {}
                    :position $ [] 0 0
                    :size $ [] 160 40
                    :fill $ hslx 0 0 50
                    :on $ {}
                      :pointertap $ fn (e d!) (d! :toggle-keyboard nil)
                  text $ {}
                    :text $ str "\"Toggle: " on?
                    :position $ [] 4 8
                    :style $ {} (:font-size 16)
                      :fill $ hslx 0 0 100
                text $ {}
                  :text $ str "\"Counted: " counted
                  :position $ [] 20 60
                  :style $ {} (:font-size 16)
                    :fill $ hslx 0 0 100
                  :on-keyboard $ if on?
                    {}
                      :down $ fn (e d!) (d! :counted nil)
                      :up $ fn (e d!) (println :up)
                    {}
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.comp.keyboard $ :require
            [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list
    |phlox.app.comp.slider-demo $ %{} :FileEntry
      :defs $ {}
        |comp-slider-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-slider-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
                container
                  {} $ :position ([] 100 100)
                  comp-slider (>> states :a)
                    {}
                      :value $ :a state
                      :unit 1
                      :position $ [] 20 0
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :a value
                  comp-slider (>> states :b)
                    {}
                      :value $ :b state
                      :title "\"Refine"
                      :unit 0.1
                      :position $ [] 20 60
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :b value
                  comp-slider (>> states :c)
                    {}
                      :value $ :c state
                      :unit 10
                      :position $ [] 20 120
                      :fill $ hslx 50 90 70
                      :color $ hslx 200 90 30
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :c value
                  comp-slider (>> states :d)
                    {}
                      :value $ :d state
                      :position $ [] 20 180
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :d value
                      :title "\"Round"
                      :round? true
                  comp-slider (>> states :e)
                    {}
                      :value $ :e state
                      :position $ [] 20 240
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :e value
                      :title "\"min 10"
                      :min 10
                  comp-slider (>> states :f)
                    {}
                      :value $ :f state
                      :position $ [] 20 300
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :f value
                      :title "\"max 10"
                      :max 10
        |comp-slider-point-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-slider-point-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
                container
                  {} $ :position ([] 120 100)
                  comp-slider-point (>> states :a)
                    {}
                      :value $ :a state
                      :unit 1
                      :position $ [] 20 0
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :a value
                  comp-slider-point (>> states :b)
                    {}
                      :value $ :b state
                      :unit 0.1
                      :position $ [] 20 60
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :b value
                  comp-slider-point (>> states :c)
                    {}
                      :value $ :c state
                      :unit 10
                      :position $ [] 20 120
                      :fill $ hslx 50 90 70
                      :color $ hslx 200 90 30
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :c value
                  comp-slider-point (>> states :d)
                    {}
                      :value $ :d state
                      :position $ [] 20 180
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :d value
                      :round? true
                  comp-slider-point (>> states :e)
                    {}
                      :value $ :e state
                      :position $ [] 20 240
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :e value
                      :min 10
                  comp-slider-point (>> states :f)
                    {}
                      :value $ :f state
                      :position $ [] 20 300
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :f value
                      :max 10
        |comp-spin-slider-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-spin-slider-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:v1 10)
                      :pos $ [] 240 240
                container ({})
                  comp-spin-slider (>> states :demo)
                    {}
                      :position $ :pos state
                      :value $ :v1 state
                      :unit 1
                      :min 1
                      ; :fill $ hslx 50 90 44
                      :fraction 1
                      :on-change $ fn (v d!)
                        d! cursor $ assoc state :v1 v
                      :on-move $ fn (pos d!)
                        d! cursor $ assoc state :pos pos
                      :label "\"dgemo"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.comp.slider-demo $ :require
            [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list >>
            [] phlox.comp.slider :refer $ [] comp-slider comp-slider-point comp-spin-slider
    |phlox.app.container $ %{} :FileEntry
      :defs $ {}
        |comp-arrows-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-arrows-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {}
                      :from $ [] 100 100
                      :to $ [] 200 200
                comp-arrow (>> states :demo1)
                  {}
                    :from $ :from state
                    :to $ :to state
                    :width 2
                    :arm-length 8
                    :on-change $ fn (from to d!)
                      d! cursor $ assoc state :from from :to to
        |comp-buttons $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-buttons () $ container
              {} $ :position ([] 100 100)
              comp-button $ {} (:text "\"DEMO BUTTON")
                :position $ [] 100 0
                :on $ {}
                  :pointertap $ fn (e d!) (js/console.log "\"clicked" e d!)
              comp-button $ {} (:text "\"Blue")
                :position $ [] 100 60
                :color $ hslx 0 80 70
                :fill $ hslx 200 80 40
              comp-button $ {} (:text "\"Short hand pointertap")
                :position $ [] 100 120
                :on-pointertap $ fn (e d!) (println "\"clicked")
        |comp-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-container (store)
              ; println "\"Store" store $ :tab store
              let
                  cursor $ []
                  states $ :states store
                group
                  {} $ :position ([] 0 0)
                  comp-tabs tabs (:tab store)
                    {} $ :position ([] 10 10)
                    fn (t d!) (d! :tab t)
                  case-default (:tab store)
                    text $ {} (:text "\"Unknown")
                      :style $ {}
                        :fill $ hslx 0 100 80
                        :font-size 12
                        :font-family "\"Helvetica"
                    :drafts $ comp-drafts (:x store)
                    :grids $ memof1-call comp-grids
                    :curves $ comp-curves
                    :gradients $ comp-gradients
                    :keyboard $ comp-keyboard (:keyboard-on? store) (:counted store)
                    :buttons $ comp-buttons
                    :slider $ comp-slider-demo (>> states :slider)
                    :points $ comp-points-demo (>> states :points)
                    :switch $ comp-switch-demo (>> states :switch)
                    :input $ comp-text-input (>> states :input)
                    :messages $ comp-messages-demo (>> states :messages)
                    :slider-point $ comp-slider-point-demo (>> states :slider-point)
                    :spin-slider $ comp-spin-slider-demo (>> states :spin-slider)
                    :arrows $ comp-arrows-demo (>> states :arrows)
                    :shadow $ comp-shadow-demo
                    :mesh $ comp-mesh-demo (>> states :mesh)
                  circle $ {}
                    :position $ [] 0 0
                    :radius 10
                    :fill 0xffffff
        |comp-curves $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-curves () $ container ({})
              graphics $ {}
                :ops $ []
                  g :line-style $ {} (:width 2)
                    :color $ hslx 200 80 80
                    :alpha 1
                  g :move-to $ [] 0 0
                  g :line-to $ [] 100 200
                  g :arc-to $ {}
                    :p1 $ [] 200 200
                    :p2 $ [] 240 180
                    :radius 90
                  g :line-style $ {} (:width 2)
                    :color $ hslx 0 80 80
                    :join :round
                    :cap :round
                  g :arc $ {}
                    :center $ [] 260 120
                    :radius 40
                    :angle $ [] 90 270
                    :anticlockwise? false
                  g :line-style $ {} (:width 2)
                    :color $ hslx 20 80 40
                    :alpha 1
                  g :arc $ {}
                    :center $ [] 260 120
                    :radius 40
                    :angle $ [] 270 30
                    :anticlockwise? false
                  g :line-style $ {} (:width 2)
                    :color $ hslx 200 80 80
                    :alpha 1
                  g :quadratic-to $ {}
                    :p1 $ [] 400 100
                    :to-p $ [] 500 400
                  g :bezier-to $ {}
                    :p1 $ [] 400 500
                    :p2 $ [] 300 200
                    :to-p $ [] 600 300
                  g :begin-fill $ {}
                    :color $ hslx 200 80 80
                    :alpha 1
                  g :arc $ {}
                    :center $ [] 600 300
                    :radius 20
                    :angle $ [] 0 300
                    :anticlockwise? false
                  g :end-fill nil
                  ; g :line-to $ [] 400 400
              polyline $ {}
                :style $ {} (:width 4)
                  :color $ hslx 40 100 60
                  :alpha 1
                :position $ [] 300 300
                :points $ -> (range 200)
                  map $ fn (idx)
                    let
                        r $ * 0.4 idx
                        angle $ * 0.1 idx
                      polar-point angle r
              line-segments $ {}
                :style $ {} (:width 2)
                  :color $ hslx 40 100 60
                  :alpha 1
                :position $ [] 500 100
                :segments $ -> (range 10)
                  map $ fn (idx)
                    []
                      [] (+ 10 idx) 20
                      []
                        + (* 8 idx) 10
                        , 80
        |comp-gradients $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-gradients () $ container ({})
              text $ {} (:text "\"long long text")
                :position $ [] 120 160
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :v
              text $ {} (:text "\"long long text")
                :position $ [] 120 200
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :h
              text $ {} (:text "\"long long text")
                :position $ [] 120 120
                :style $ {}
                  :fill $ hslx 20 90 60
        |comp-grids $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-grids () (echo "\"calculating grids")
              container ({})
                create-list :container
                  {} $ :position ([] 200 20)
                  -> (range 60)
                    mapcat $ fn (x)
                      -> (range 40)
                        map $ fn (y) ([] x y)
                    map $ fn (pair)
                      let[] (x y) pair $ [] (str x "\"+" y)
                        rect $ {}
                          :position $ [] (* x 14) (* y 14)
                          :size $ [] 10 10
                          :fill $ hslx 200 80 80
                          :on $ {}
                            :pointerover $ fn (e d!) (println "\"hover:" x y)
        |comp-mesh-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-mesh-demo (states)
              let
                  cursor $ :cursor states
                  state $ or (:data states)
                    {} (:x 0)
                      :base $ [] 109 129
                      :offset $ [] -123 -3
                      :zoom 0.26
                container ({})
                  comp-button $ {} (:text "\"Tick")
                    :position $ [] 200 -40
                    :on-pointertap $ fn (e d!)
                      d! cursor $ update state :x inc
                  container
                    {} $ :position ([] 600 400)
                    mesh $ {} (:scale 1)
                      :position $ [] 0 0
                      :geometry $ {}
                        :attributes $ []
                          {} (:id "\"aVertexPosition") (:size 2)
                            :buffer $ [] -400 -400 400 -400 400 400 -400 400
                          {} (:id "\"aUvs") (:size 2)
                            :buffer $ [] 0 0 1 0 1 1 0 1
                        :index $ [] 0 1 2 0 3 2
                      :shader $ {}
                        :vertex-source $ inline-file "\"demo.vert"
                        :fragment-source $ inline-file "\"demo.frag"
                      :draw-mode :triangles
                      :uniforms $ js-object (:uSampler2 sample-texture)
                        :time $ :x state
                        ; :base $ :base state
                        :baseX $ first (:base state)
                        :baseY $ last (:base state)
                        :zoom $ :zoom state
                        :offsetX $ * 1
                          first $ :offset state
                        :offsetY $ * 1
                          last $ :offset state
                      ; :on $ {}
                        :pointertap $ fn (e d!) (println "\"clicked")
                    comp-drag-point (>> states :base)
                      {} (:radius 6) (:hide-text? true)
                        :position $ wo-log (:base state)
                        :fill $ hslx 200 100 50
                        :on-change $ fn (position d!)
                          d! cursor $ assoc state :base position
                    comp-drag-point (>> states :offset)
                      {} (:radius 6)
                        :fill $ hslx 0 100 50
                        :hide-text? true
                        :position $ wo-log (:offset state)
                        :on-change $ fn (position d!)
                          d! cursor $ assoc state :offset position
                  comp-slider-point (>> states :zoom)
                    {}
                      :value $ :zoom state
                      :min 0.01
                      :position $ [] 300 -40
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :zoom value
        |comp-messages-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-messages-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {}
                      :messages $ []
                      :bottom? false
                container ({})
                  comp-button $ {} (:text "\"Add message")
                    :position $ [] 120 200
                    :on-pointertap $ fn (e d!)
                      d! cursor $ update state :messages
                        fn (xs)
                          conj xs $ let
                              id $ nanoid
                            {} (:id id)
                              :text $ str "\"Messages of " id
                  comp-switch $ {}
                    :value $ :bottom? state
                    :title "\"At bottom"
                    :position $ [] 200 280
                    :on-change $ fn (e d!)
                      d! cursor $ update state :bottom? not
                  comp-messages $ {}
                    :messages $ :messages state
                    :bottom? $ :bottom? state
                    :on-pointertap $ fn (message d!)
                      d! cursor $ update state :messages
                        fn (xs)
                          -> xs $ filter-not
                            fn (x)
                              = (:id x) (:id message)
        |comp-points-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-points-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {}
                      :p1 $ [] 0 0
                      :p2 $ [] 0 40
                      :p3 $ [] 0 80
                      :p4 $ [] 0 120
                      :p5 $ [] 0 160
                container
                  {} $ :position ([] 160 100)
                  comp-drag-point (>> states :p1)
                    {}
                      :position $ :p1 state
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :p1 position
                  comp-drag-point (>> states :p2)
                    {}
                      :position $ :p2 state
                      :unit 2
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :p2 position
                  comp-drag-point (>> states :p3)
                    {}
                      :position $ :p3 state
                      :unit 0.4
                      :radius 10
                      :fill $ hslx 0 90 60
                      :color $ hslx 0 0 50
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :p3 position
                  comp-drag-point (>> states :p4)
                    {}
                      :position $ :p4 state
                      :title "\"base"
                      :alpha 0.6
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :p4 position
                  comp-drag-point (>> states :p5)
                    {}
                      :position $ :p5 state
                      :hide-text? true
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :p5 position
        |comp-shadow-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-shadow-demo () $ container
              {} $ :position (canvas-center!)
              text $ {} (:text "\"Shadows")
                :style $ {}
                  :fill $ hslx 200 100 50
                  :font-size 40
                  :font-family "\"Josefin Sans"
                :filters $ []
                  [] DropShadowFilter $ {}
                    :color $ hslx 10 90 100
                    :distance 2
                    :rotation 30
                    :alpha 1
                    :quality 4
                    :blur 6
        |comp-switch-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-switch-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} $ :value false
                container
                  {} $ :position ([] 120 300)
                  comp-switch $ {}
                    :value $ :value state
                    :position $ [] 0 0
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :value value
                  comp-switch $ {}
                    :value $ :value state
                    :position $ [] 100 20
                    :title "\"Custom title"
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :value value
        |comp-text-input $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-text-input (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:text "\"initial text") (:long-text "\"long..")
                container ({})
                  rect
                    {}
                      :position $ [] 140 110
                      :size $ [] 80 24
                      :fill $ hslx 0 0 20
                      :on $ {}
                        :pointertap $ fn (e d!)
                          request-text! e
                            {}
                              :initial $ :text state
                              :style $ {} (:color "\"blue")
                            fn (result)
                              d! cursor $ assoc state :text result
                    text $ {}
                      :text $ :text state
                      :position $ [] 6 4
                      :style $ {} (:font-size 14)
                        :fill $ hslx 0 0 80
                  rect
                    {}
                      :position $ [] 140 180
                      :size $ [] 200 100
                      :fill $ hslx 0 0 20
                      :on $ {}
                        :pointertap $ fn (e d!)
                          request-text! e
                            {}
                              :initial $ :long-text state
                              :style $ {} (:font-family font-code)
                              :textarea? true
                            fn (result)
                              d! cursor $ assoc state :long-text result
                    text $ {}
                      :text $ :long-text state
                      :position $ [] 6 4
                      :style $ {} (:font-size 14)
                        :fill $ hslx 0 0 80
        |inline-file $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro inline-file (name)
              read-file $ str "\"assets/" name
        |sample-texture $ %{} :CodeEntry (:doc |)
          :code $ quote
            def sample-texture $ .!from PIXI/Texture "\"https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1a2af589827261.5e022908ed0b1.jpg"
        |tabs $ %{} :CodeEntry (:doc |)
          :code $ quote
            def tabs $ [] ([] :drafts "\"Drafts") ([] :grids "\"Grids") ([] :curves "\"Curves") ([] :gradients "\"Gradients") ([] :keyboard "\"Keyboard") ([] :slider "\"Slider") ([] :buttons "\"Buttons") ([] :points "\"Points") ([] :switch "\"Switch") ([] :input "\"Input") ([] :messages "\"Messages") ([] :slider-point "\"Slider Point") ([] :spin-slider "\"Spin Slider") ([] :arrows "\"Arrows") ([] :shadow "\"Shadow") ([] :mesh "\"Mesh")
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.container $ :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list polyline >> line-segments mesh group
            phlox.app.comp.drafts :refer $ comp-drafts
            phlox.app.comp.keyboard :refer $ comp-keyboard
            phlox.comp.button :refer $ comp-button
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.comp.switch :refer $ comp-switch
            phlox.comp.slider :refer $ comp-slider-point
            phlox.app.comp.slider-demo :refer $ comp-slider-demo comp-slider-point-demo comp-spin-slider-demo
            phlox.input :refer $ request-text!
            phlox.comp.messages :refer $ comp-messages
            "\"nanoid" :refer $ nanoid
            memof.once :refer $ memof1-call
            phlox.util.styles :refer $ font-code
            phlox.comp.arrow :refer $ comp-arrow
            phlox.complex :refer $ polar-point
            phlox.util :refer $ canvas-center!
            "\"@pixi/filter-drop-shadow" :refer $ DropShadowFilter
            "\"pixi.js" :as PIXI
            phlox.comp.tabs :refer $ comp-tabs
    |phlox.app.main $ %{} :FileEntry
      :defs $ {}
        |*store $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *store schema/store)
        |dispatch! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op)
              when
                and dev? $ not= (nth op 0) :states
                js/console.log "\"dispatch!" op
              let
                  op-id $ nanoid
                  op-time $ js/Date.now
                reset! *store $ updater @*store op op-id op-time
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (; js/console.log PIXI)
              if dev? $ load-console-formatter!
              -> (new FontFaceObserver "\"Josefin Sans") (.!load)
                .!then $ fn (event) (render-app!)
              add-watch *store :change $ fn (store prev) (render-app!)
              render-app!
              when true (render-control!) (start-control-loop! 8 on-control-event)
              println "\"App Started"
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ if (nil? build-errors)
              do (clear-phlox-caches!) (remove-watch *store :change)
                add-watch *store :change $ fn (store prev) (render-app!)
                render-app!
                when true $ replace-control-loop! 8 on-control-event
                hud! "\"ok~" "\"OK"
              hud! "\"error" build-errors
        |render-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-app! (? arg)
              render! (comp-container @*store) dispatch! $ either arg ({})
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.main $ :require ("\"pixi.js" :as PIXI)
            phlox.core :refer $ render! clear-phlox-caches! on-control-event
            phlox.app.container :refer $ comp-container
            phlox.app.schema :as schema
            phlox.config :refer $ dev? mobile?
            "\"nanoid" :refer $ nanoid
            phlox.app.updater :refer $ updater
            "\"fontfaceobserver-es" :default FontFaceObserver
            "\"./calcit.build-errors" :default build-errors
            "\"bottom-tip" :default hud!
            touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
    |phlox.app.schema $ %{} :FileEntry
      :defs $ {}
        |store $ %{} :CodeEntry (:doc |)
          :code $ quote
            def store $ {} (:tab :mesh) (:x 0) (:keyboard-on? false) (:counted 0)
              :states $ {}
              :cursor $ []
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.app.schema)
    |phlox.app.updater $ %{} :FileEntry
      :defs $ {}
        |updater $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn updater (store op op-id op-time)
              tag-match op
                  :add-x
                  update store :x $ fn (x)
                    if (> x 10) 0 $ + x 1
                (:tab t) (assoc store :tab t)
                (:toggle-keyboard) (update store :keyboard-on? not)
                (:counted) (update store :counted inc)
                (:states cursor s) (update-states store cursor s)
                (:hydrate-storage d) d
                _ $ do (eprintln "\"unknown op" op) store
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.app.updater $ :require
            [] phlox.cursor :refer $ [] update-states
    |phlox.check $ %{} :FileEntry
      :defs $ {}
        |dev-check $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro dev-check (data rule)
              if dev?
                &let
                  result $ gensym "\"result"
                  quasiquote $ &let
                    ~result $ validate-lilac ~data ~rule
                    when-not (:ok? ~result)
                      js/console.error (:formatted-message ~result) &newline
                        str "\"(dev-check " (quote ~data) "\" " (quote ~rule) "\") where props is:"
                        to-js-data ~data
                quasiquote nil
        |dev-check-message $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro dev-check-message (message data rule)
              if dev?
                &let
                  result $ gensym "\"result"
                  quasiquote $ &let
                    ~result $ validate-lilac ~data ~rule
                    when-not (:ok? ~result)
                      js/console.error (:formatted-message ~result) &newline (str ~message "\", when props is:") (to-js-data ~data)
                quasiquote nil
        |lilac-circle $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-circle $ record+
              {}
                :line-style $ optional+ lilac-line-style
                :on $ optional+ lilac-event-map
                :position lilac-point
                :radius $ number+
                :fill $ optional+ (number+)
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :pivot $ optional+ lilac-point
                :fill $ optional+ (number+)
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-color $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-color $ or+
              [] (number+) (string+)
        |lilac-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-container $ record+
              {} (:position lilac-point)
                :rotation $ number+
                :pivot lilac-point
                :alpha $ number+
                :angle $ number+
                :on-keyboard $ optional+ lilac-event-map
              {} (:check-keys? true) (:all-optional? true)
        |lilac-event-map $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-event-map $ dict+ (keyword+) (fn+)
        |lilac-graphics $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-graphics $ record+
              {}
                :on $ optional+ lilac-event-map
                :position $ optional+ lilac-point
                :pivot $ optional+ lilac-point
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :ops $ list+
                  optional+ $ tuple+
                    [] (keyword+) (any+)
                  {} $ :allow-seq? true
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-line-segments $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-line-segments $ record+
              {}
                :on $ optional+ lilac-event-map
                :position $ optional+ lilac-point
                :pivot $ optional+ lilac-point
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :style lilac-line-style
                :segments $ list+
                  tuple+ ([] lilac-point lilac-point)
                    {} $ :check-size? true
                :on-keyboard $ optional+ lilac-event-map
              {} $ :check-keys? true
        |lilac-line-style $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-line-style $ record+
              {}
                :width $ number+
                :color $ number+
                :alpha $ optional+ (number+)
        |lilac-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-point $ tuple+
              [] (number+) (number+)
              {} $ :check-size? true
        |lilac-polyline $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-polyline $ record+
              {}
                :on $ optional+ lilac-event-map
                :position $ optional+ lilac-point
                :pivot $ optional+ lilac-point
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :style lilac-line-style
                :points $ list+
                  tuple+ $ [] (number+) (number+)
                :on-keyboard $ optional+ lilac-event-map
              {} $ :check-keys? true
        |lilac-rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-rect $ record+
              {}
                :line-style $ optional+ lilac-line-style
                :on $ optional+ lilac-event-map
                :position $ optional+ lilac-point
                :size lilac-point
                :pivot $ optional+ lilac-point
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :fill $ optional+ lilac-color
                :radius $ optional+ (number+)
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-text $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-text $ record+
              {}
                :text $ string+
                :style lilac-text-style
                :position $ optional+ lilac-point
                :pivot $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :alpha $ optional+ (number+)
                :align $ optional+
                  enum+ $ #{} :left :center :right
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-text-style $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-text-style $ record+
              {}
                :align $ enum+ (#{} :left :center :right)
                :break-words $ bool+
                :drop-shadow $ bool+
                :drop-shadow-alpha $ number+
                  {} (:min 0) (:max 1)
                :drop-shadow-angle $ number+
                :drop-shadow-blur $ number+
                :drop-shadow-color lilac-color
                :drop-shadow-distance $ number+
                :fill $ or+
                  [] lilac-color $ list+ lilac-color
                :fill-gradient-type $ enum+ (#{} :vertical :horizontal :v :h)
                :fill-gradient-stops $ any+
                :font-family $ string+
                :font-size $ number+
                :font-style $ enum+ (#{} :normal :italic :oblique)
                :font-variant $ enum+ (#{} :normal :small-caps)
                :font-weight $ number+
                :leading $ number+
                :letter-spacing $ number+
                :line-height $ number+
                :line-join $ enum+ (#{} :miter :round :round :bevel)
                :miter-limit $ number+
                :padding $ number+
                :stroke lilac-color
                :stroke-thickness $ number+
                :trim $ bool+
                :text-baseline $ enum+ (#{} :alphabetic)
                :white-space $ enum+ (#{} :normal :pre :pre-line)
                :word-wrap $ bool+
                :word-wrap-width $ number+
              {} (:check-keys? true) (:all-optional? true)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.check $ :require
            lilac.core :refer $ validate-lilac record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            phlox.config :refer $ dev?
    |phlox.comp.arrow $ %{} :FileEntry
      :defs $ {}
        |comp-arrow $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-arrow (states props) (; dev-check props lilac-arrow)
              let
                  color $ either (:color props) (hslx 0 0 100)
                  from $ :from props
                  to $ :to props
                  width $ either (:width props) 1
                  arg-length $ either (:arm-length props) 10
                  on-change $ :on-change props
                  reversed-vec $ complex/minus from to
                  reversed-unit $ complex/divide-by reversed-vec (vec-length reversed-vec)
                  arm-left $ complex/times reversed-unit
                    [] arg-length $ negate arg-length
                  arm-right $ complex/times reversed-unit ([] arg-length arg-length)
                container
                  {} $ :position ([] 0 0)
                  comp-drag-point (>> states :from)
                    {} (:position from)
                      :fill $ hslx 200 80 20
                      :hide-text? true
                      :on-change $ fn (position d!)
                        if (fn? on-change) (on-change position to d!) (js/console.warn "\"missing onchange for arrow")
                  comp-drag-point (>> states :to)
                    {} (:position to) (:hide-text? true)
                      :fill $ hslx 200 80 20
                      :on-change $ fn (position d!)
                        if (fn? on-change) (on-change from position d!) (js/console.warn "\"missing onchange for arrow")
                  graphics $ {}
                    :ops $ []
                      g :line-style $ {} (:width width)
                        :color $ hslx 200 80 80
                        :alpha 1
                      g :move-to from
                      g :line-to to
                      g :line-to $ complex/add to arm-left
                      g :move-to to
                      g :line-to $ complex/add to arm-right
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.arrow $ :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list >>
            lilac.core :refer $ record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            [] phlox.check :refer $ [] lilac-event-map dev-check
            phlox.complex :as complex
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.math :refer $ vec-length
    |phlox.comp.button $ %{} :FileEntry
      :defs $ {}
        |comp-button $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-button (props) (dev-check props lilac-button)
              let
                  button-text $ either (:text props) "\"BUTTON"
                  size $ either (:font-size props) 14
                  font-family $ either (:font-family props) "\"Josefin Sans, sans-serif"
                  fill $ either (:fill props) (hslx 0 0 20)
                  color $ either (:color props) (hslx 0 0 100)
                  position $ :position props
                  width $ + 16 (measure-text-width! button-text size font-family)
                  align-right? $ :align-right? props
                container
                  {} $ :position
                    if align-right?
                      []
                        - (first position) width
                        last position
                      , position
                  rect $ {} (:fill fill)
                    :size $ [] width 32
                    :on $ cond
                        some? $ :on props
                        :on props
                      (some? (:on-pointertap props))
                        {} $ :pointertap (:on-pointertap props)
                      true nil
                  text $ {} (:text button-text)
                    :position $ [] 8 8
                    :style $ {} (:fill color) (:font-size size) (:font-family font-family)
        |lilac-button $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-button $ record+
              {}
                :color $ number+
                :fill $ number+
                :text $ string+
                :size $ number+
                :font-family $ string+
                :position $ tuple+
                  [] (number+) (number+)
                :on lilac-event-map
                :on-pointertap $ fn+
                :align-right? $ bool+
              {} (:all-optional? true) (:check-keys? true)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.button $ :require
            [] phlox.core :refer $ []  g hslx rect circle text container graphics create-list
            [] phlox.util :refer $ [] measure-text-width!
            [] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            [] phlox.check :refer $ [] lilac-event-map dev-check
    |phlox.comp.drag-point $ %{} :FileEntry
      :defs $ {}
        |comp-drag-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-drag-point (states props)
              dev-check (:cursor states) lilac-cursor
              dev-check props lilac-drag-point
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:dragging? false)
                      :x0 $ [] 0 0
                  unit $ either (:unit props) 1
                  radius $ either (:radius props) 8
                  color $ either (:color props) (hslx 0 0 100)
                  fill $ either (:fill props) (hslx 0 0 60)
                  alpha $ either (:alpha props) 1
                  on-change $ :on-change props
                  hide-text? $ either (:hide-text? props) false
                let
                    position $ :position props
                  container
                    {} $ :position position
                    circle $ {} (:radius radius)
                      :position $ [] 0 0
                      :fill fill
                      :alpha alpha
                      :on $ {}
                        :pointerdown $ fn (e d!)
                          let
                              x $ -> e .-data .-global .-x
                              y $ -> e .-data .-global .-y
                            d! cursor $ merge state
                              {} (:dragging? true)
                                :x0 $ [] x y
                                :p0 position
                        :globalpointermove $ fn (e d!)
                          when (:dragging? state)
                            let
                                x $ -> e .-data .-global .-x
                                y $ -> e .-data .-global .-y
                              let
                                  x0 $ :x0 state
                                on-change
                                  complex/add (:p0 state)
                                    []
                                      * unit $ - x (first x0)
                                      * unit $ - y (last x0)
                                  , d!
                        :pointerup $ fn (e d!)
                          d! cursor $ assoc state :dragging? false
                        :pointerupoutside $ fn (e d!)
                          d! cursor $ assoc state :dragging? false
                    if-not hide-text? $ text
                      {}
                        :text $ str "\"("
                          .!toFixed
                            either (first position) 0
                            , 1
                          , "\", "
                            .!toFixed
                              either (last position) 0
                              , 1
                            , "\")➤" (str unit)
                        :alpha $ * alpha 0.3
                        :position $ [] -20 -16
                        :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "\"Menlo, monospace")
                    if
                      and (not hide-text?)
                        some? $ :title props
                      text $ {}
                        :text $ :title props
                        :alpha $ * alpha 0.3
                        :position $ [] -12 6
                        :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "\"Menlo, monospace") (:align :center)
        |lilac-cursor $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-cursor $ list+
              any+ $ {} (:some? true)
        |lilac-drag-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-drag-point $ record+
              {}
                :unit $ optional+ (number+)
                :title $ optional+ (string+)
                :radius $ optional+ (number+)
                :fill $ optional+ (number+)
                :color $ optional+ (number+)
                :alpha $ optional+ (number+)
                :position $ tuple+
                  [] (number+) (number+)
                :hide-text? $ optional+ (bool+)
                :on-change $ fn+
              {} $ :check-keys? true
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.drag-point $ :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check
            lilac.core :refer $ record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            phlox.complex :as complex
    |phlox.comp.messages $ %{} :FileEntry
      :defs $ {}
        |comp-messages $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-messages (options) (dev-check options lilac-messages)
              let
                  messages $ :messages options
                  bottom? $ :bottom? options
                  base-position $ either (:position options)
                    if bottom?
                      []
                        - (* 0.5 js/window.innerWidth) 16
                        - (* 0.5 js/window.innerHeight) 16
                      []
                        - (* 0.5 js/window.innerWidth) 16
                        - 16 $ * 0.5 js/window.innerWidth
                  on-pointertap $ either (:on-pointertap options)
                    fn (x d!) (println "\"missing message handler:" x)
                create-list :container
                  {} $ :position base-position
                  -> messages $ map-indexed
                    fn (idx message)
                      [] (:id message)
                        comp-button $ {}
                          :text $ :text message
                          :position $ if bottom?
                            [] 0 $ - 8
                              * 40 $ - (count messages) idx
                            [] 0 $ * 40 idx
                          :color $ :color options
                          :fill $ :fill options
                          :align-right? true
                          :on-pointertap $ fn (e d!) (on-pointertap message d!)
        |lilac-message-list $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-message-list $ list+
              record+
                {}
                  :id $ string+
                  :text $ string+
                {} $ :exact-keys? true
              {} $ :allow-seq? true
        |lilac-messages $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-messages $ record+
              {} (:messages lilac-message-list)
                :color $ number+
                :fill $ number+
                :position lilac-point
                :bottom? $ bool+
                :on-pointertap $ fn+
              {} (:check-keys? true) (:all-optional? true)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.messages $ :require
            [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list
            [] phlox.check :refer $ [] lilac-event-map dev-check lilac-point
            [] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            [] phlox.comp.button :refer $ [] comp-button
    |phlox.comp.slider $ %{} :FileEntry
      :defs $ {}
        |*prev-spin-point $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *prev-spin-point nil)
        |*spin-pivot $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *spin-pivot $ [] 0 0
        |comp-slider $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-slider (states props)
              dev-check (:cursor states) lilac-cursor
              dev-check props lilac-slider
              let
                  value $ either (:value props) 1
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:v0 value) (:x0 0) (:dragging? false)
                  title $ :title props
                  unit $ either (:unit props) 0.1
                  fill $ either (:fill props) (hslx 0 0 30)
                  color $ either (:color props) (hslx 0 0 100)
                  on-change $ :on-change props
                  rounded? $ :round? props
                container
                  {} $ :position (:position props)
                  rect
                    {}
                      :size $ [] 120 24
                      :fill fill
                      :on $ {}
                        :pointerdown $ fn (e d!)
                          let
                              x1 $ -> e .-data .-global .-x
                            d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                        :globalpointermove $ fn (e d!)
                          when (:dragging? state)
                            let
                                x2 $ -> e .-data .-global .-x
                              if (fn? on-change)
                                on-change
                                  ->
                                    + (:v0 state)
                                      * unit $ - x2 (:x0 state)
                                    (fn (v) (if rounded? (js/Math.round v) v))
                                    (fn (v) (if (some? (:max props)) (&min (:max props) v) v))
                                    (fn (v) (if (some? (:min props)) (&max (:min props) v) v))
                                  , d!
                                js/console.log "\"[slider] missing :on-change listener"
                        :pointerup $ fn (e d!)
                          d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                        :pointerupoutside $ fn (e d!)
                          d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                    text $ {}
                      :text $ str "\"◀ "
                        if (number? value)
                          .!toFixed value $ if rounded? 0 4
                          , "\"nil"
                        , "\" ▶"
                      :position $ [] 4 4
                      :style $ {} (:fill color) (:font-size 12) (:font-family "\"Menlo, monospace")
                    text $ {}
                      :text $ str
                        if (string? title) (str title "\" ") "\""
                        , "\"◈ " unit
                      :position $ [] 0 -18
                      :style $ {}
                        :fill $ hslx 0 0 80
                        :font-size 13
                        :font-family "\"Arial, sans-serif"
        |comp-slider-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-slider-point (states props)
              dev-check (:cursor states) lilac-cursor
              dev-check props lilac-slider-point
              let
                  value $ either (:value props) 1
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} (:v0 value) (:x0 0) (:dragging? false)
                  unit $ either (:unit props) 0.1
                  fill $ either (:fill props) (hslx 0 0 30)
                  color $ either (:color props) (hslx 0 0 100)
                  on-change $ :on-change props
                  rounded? $ :round? props
                container
                  {} $ :position (:position props)
                  rect
                    {}
                      :size $ [] 16 16
                      :fill fill
                      :radius 4
                      :on $ {}
                        :pointerdown $ fn (e d!)
                          let
                              x1 $ -> e .-data .-global .-x
                            d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                        :globalpointermove $ fn (e d!)
                          when (:dragging? state)
                            let
                                x2 $ -> e .-data .-global .-x
                              if (fn? on-change)
                                on-change
                                  ->
                                    + (:v0 state)
                                      * unit $ - x2 (:x0 state)
                                    (fn (v) (if rounded? (js/Math.round v) v))
                                    (fn (v) (if (some? (:max props)) (&min (:max props) v) v))
                                    (fn (v) (if (some? (:min props)) (&max (:min props) v) v))
                                  , d!
                                js/console.log "\"[slider] missing :on-change listener"
                        :pointerup $ fn (e d!)
                          d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                        :pointerupoutside $ fn (e d!)
                          d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                    text $ {}
                      :text $ str
                        if (number? value)
                          .!toFixed value $ if rounded? 0 4
                          , "\"nil"
                      :position $ [] 20 3
                      :style $ {} (:fill color) (:font-size 10) (:font-family "\"Menlo, monospace")
        |comp-spin-slider $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-spin-slider (states props)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} $ :dragging? false
                  unit $ either (:unit props) 1
                  radius $ either (:radius props) 44
                  color $ either (:color props) (hslx 0 0 100)
                  fill $ either (:fill props) (hslx 0 0 0)
                  font-size $ either (:font-size props) (&* radius 0.44)
                  alpha $ either (:alpha props) 1
                  on-change $ :on-change props
                  position $ either (:position props) ([] 0 0)
                  on-move $ :on-move props
                  border-color $ or (:border-color props) (hslx 240 80 80)
                  border-width $ or (:border-width props) 4
                container
                  {} $ :position ([] 0 0)
                  circle $ {} (:radius radius) (:position position) (:fill fill) (:alpha alpha)
                    :line-style $ {} (:color border-color) (:width border-width) (:alpha 1)
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x $ -> e .-data .-global .-x
                            y $ -> e .-data .-global .-y
                          reset! *spin-pivot $ [] x y
                          reset! *prev-spin-point $ [] 0 0
                          d! cursor $ assoc state :dragging? true
                      :globalpointermove $ fn (e d!)
                        let
                            x $ -> e .-data .-global .-x
                            y $ -> e .-data .-global .-y
                          if (:dragging? state)
                            let
                                current-point $ []
                                  - x $ first @*spin-pivot
                                  - y $ last @*spin-pivot
                                prev-point @*prev-spin-point
                              if
                                < (vec-length current-point) (&* 0.5 radius)
                                reset! *prev-spin-point nil
                                do
                                  if (some? prev-point)
                                    let
                                        delta-vec $ rebase current-point prev-point
                                        delta $ js/Math.atan2 (last delta-vec) (first delta-vec)
                                      if (fn? on-change)
                                        on-change
                                          bound-x
                                            + (:value props) (&* unit delta)
                                            :min props
                                            :max props
                                          , d!
                                        js/console.warn "\"missing :on-change for spin-slider"
                                  reset! *prev-spin-point current-point
                      :pointerup $ fn (e d!) (reset! *prev-spin-point nil)
                        d! cursor $ assoc state :dragging? false
                      :pointerupoutside $ fn (e d!) (reset! *prev-spin-point nil)
                        d! cursor $ assoc state :dragging? false
                  text $ {}
                    :text $ str
                      let
                          v $ :value props
                        if (number? v)
                          .!toFixed v $ either (:fraction props) 1
                          , "\"-"
                    :position $ complex/add position ([] 0 -10)
                    :style $ {} (:fill color) (:font-size font-size) (:font-family "\"Source code pro, Menlo, Roboto Mono, monospace")
                    :align :center
                  container
                    {} $ :position ([] -0 30)
                    comp-drag-point (>> states :move)
                      {} (:position position) (:unit 1) (:radius 8)
                        :fill $ hslx 0 90 50
                        :hide-text? true
                        :alpha 0.5
                        :on-change $ fn (pos d!) (on-move pos d!)
                    if-let
                      label $ :label props
                      text $ {} (:text label) (:alpha 0.8) (:align :center)
                        :position $ complex/add position ([] 0 -20)
                        :style $ {} (:fill color) (:font-size 13) (:font-family "\"Josefin Sans, sans-serif")
        |lilac-cursor $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-cursor $ list+
              any+ $ {} (:some? true)
        |lilac-slider $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-slider $ record+
              {}
                :value $ number+
                :on-change $ fn+
                :unit $ optional+ (number+)
                :fill $ optional+ (number+)
                :color $ optional+ (number+)
                :title $ optional+ (string+)
                :round? $ optional+ (bool+)
                :max $ optional+ (number+)
                :min $ optional+ (number+)
                :position $ optional+
                  tuple+ $ [] (number+) (number+)
              {} $ :check-keys? true
        |lilac-slider-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-slider-point $ record+
              {}
                :value $ number+
                :on-change $ fn+
                :unit $ optional+ (number+)
                :fill $ optional+ (number+)
                :color $ optional+ (number+)
                :round? $ optional+ (bool+)
                :max $ optional+ (number+)
                :min $ optional+ (number+)
                :position $ optional+
                  tuple+ $ [] (number+) (number+)
              {} $ :check-keys? true
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.slider $ :require
            [] phlox.core :refer $ [] g >> hslx rect circle text container graphics create-list
            [] phlox.check :refer $ [] lilac-event-map dev-check
            [] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+ bool+
            phlox.math :refer $ vec-length bound-x
            phlox.complex :refer $ rebase
            phlox.complex :as complex
            phlox.comp.drag-point :refer $ comp-drag-point
    |phlox.comp.switch $ %{} :FileEntry
      :defs $ {}
        |comp-switch $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-switch (props) (dev-check props lilac-switch)
              let
                  value $ :value props
                  on-change $ :on-change props
                container
                  {} $ :position
                    either (:position props) ([] 0 0)
                  rect $ {}
                    :size $ [] 56 20
                    :fill $ if value (hslx 0 0 92) (hslx 0 0 50)
                    :position $ [] 0 0
                    :radius 3
                    :on $ {}
                      :pointertap $ fn (e d!)
                        when (fn? on-change)
                          on-change (not value) d!
                  text $ {}
                    :text $ if value "\"On" "\"Off"
                    :position $ if value ([] 8 2) ([] 24 2)
                    :style $ {} (:font-size 14)
                      :fill $ if value (hslx 0 0 50) (hslx 0 0 100)
                      :font-family "\"Arial"
                      :align :right
                      :font-weight 500
                    :alpha $ if value 1 0.4
                  text $ {}
                    :text $ either (:title props) "\"Switch"
                    :position $ [] 0 -20
                    :style $ {}
                      :fill $ hslx 0 0 80
                      :font-size 13
                      :font-family "\"Arial, sans-serif"
                    :alpha 1
        |lilac-switch $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-switch $ record+
              {}
                :value $ bool+
                :position $ optional+ lilac-point
                :on-change $ fn+
                :title $ optional+ (string+)
              {} $ :check-keys? true
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.switch $ :require
            [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list
            [] phlox.check :refer $ [] lilac-event-map dev-check lilac-point
            [] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
    |phlox.comp.tabs $ %{} :FileEntry
      :defs $ {}
        |comp-tabs $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-tabs (tabs selected options on-select)
              let
                  step $ or (:step options) 36
                  position $ or (:position options) ([] 0 0)
                  font-family $ or (:font-family options) "\"Josefin Sans, sans-serif"
                create-list :container ({})
                  -> tabs $ map-indexed
                    fn (idx info)
                      let-sugar
                            [] tab title
                            , info
                        [] idx $ container
                          {} $ :position
                            complex/add position $ [] 0 (* idx step)
                          rect $ {}
                            :position $ [] 0 0
                            :size $ [] 100 30
                            :fill $ if (= selected tab) (hsluvx 180 50 50) (hsluvx 180 50 30)
                            :on $ {}
                              :pointertap $ fn (event d!) (on-select tab d!)
                          text $ {} (:text title)
                            :style $ {}
                              :fill $ hslx 200 90 100
                              :font-size 20
                              :font-family font-family
                            :position $ [] 10 2
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.comp.tabs $ :require
            phlox.core :refer $ g hslx hsluvx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check lilac-point
            lilac.core :refer $ record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            phlox.complex :as complex
    |phlox.complex $ %{} :FileEntry
      :defs $ {}
        |add $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn add (p1 p2)
              let-sugar
                    [] a b
                    , p1
                  ([] x y) p2
                [] (+ a x) (+ b y)
        |conjugate $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn conjugate (pair) (update pair 1 negate)
        |divide-by $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn divide-by (point x)
              []
                / (first point) x
                / (last point) x
        |minus $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn minus (v1 v2)
              let-sugar
                    [] a b
                    , v1
                  ([] x y) v2
                [] (- a x) (- b y)
        |polar-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn polar-point (angle r)
              []
                * r $ js/Math.cos angle
                * r $ js/Math.sin angle
        |rand-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn$ rand-point
                n
                rand-point n n
              (n m)
                []
                  - n $ rand-int (* 2 n)
                  - m $ rand-int (* 2 m)
        |rebase $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rebase (value base) "\"complex number division, renamed since naming collision" $ let-sugar
                  [] x y
                  , value
                ([] a b) base
                inverted $ / 1
                  + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
        |scale $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn scale (pair v)
              map pair $ fn (x) (* v x)
        |times $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn times (v1 v2)
              let-sugar
                    [] a b
                    , v1
                  ([] x y) v2
                []
                  - (* a x) (* b y)
                  + (* a y) (* b x)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.complex)
    |phlox.config $ %{} :FileEntry
      :defs $ {}
        |dev? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def dev? $ = "\"dev" (get-env "\"mode" "\"release")
        |mobile? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def mobile? $ .!mobile (new mobile-detect js/window.navigator.userAgent)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.config $ :require ("\"mobile-detect" :default mobile-detect)
    |phlox.core $ %{} :FileEntry
      :defs $ {}
        |*app $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *app nil)
        |*dispatch-fn $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *dispatch-fn nil)
        |*drag-moving-cache $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *drag-moving-cache nil)
        |*events-element $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *events-element nil)
        |*renderer $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *renderer nil)
        |*stage-config $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *stage-config $ {}
              :move $ [] 0 0
              :scale 1
        |*tree-element $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *tree-element nil)
        |>> $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn >> (states k)
              let
                  parent-cursor $ either (:cursor states) ([])
                  branch $ either (get states k) ({})
                assoc branch :cursor $ conj parent-cursor k
        |circle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn circle (props & children) (dev-check props lilac-circle) (create-element :circle props children)
        |clear-phlox-caches! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn clear-phlox-caches! () $ reset-memof1-caches!
        |container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn container (props & children) (dev-check props lilac-container) (create-element :container props children)
        |create-element $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn create-element (tag props children)
              %{} schema/PhloxElement (:name tag) (:props props)
                :children $ remove-nil-values (index-items children)
        |create-list $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn create-list (tag props children)
              %{} schema/PhloxElement (:name tag) (:props props)
                :children $ remove-nil-values children
        |defcomp $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro defcomp (name params & body)
              quasiquote $ defn ~name ~params ~@body
        |g $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn g (op ? arg)
              let
                  data arg
                case-default op (js/console.warn "\"not supported:" op)
                  :move-to $ dev-check-message "\"check :move-to" data lilac-point
                  :line-to $ dev-check-message "\"check :line-to" data lilac-point
                  :line-style $ dev-check-message "\"check :line-style" data lilac-line-style
                  :begin-fill $ dev-check-message "\"check :fill" data lilac-begin-fill
                  :end-fill nil
                  :close-path nil
                  :arc $ dev-check-message "\"check :arc" data lilac-arc
                  :arc-to $ dev-check-message "\"check :arc-to" data lilac-arc-to
                  :bezier-to $ dev-check-message "\"check :bezier-to" data lilac-bezier-to
                  :quadratic-to $ dev-check-message "\"check :quadratic-to" data lilac-quodratic-to
                  :begin-hole nil
                  :end-hole nil
                [] op data
        |graphics $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn graphics (props & children) (dev-check props lilac-graphics) (create-element :graphics props children)
        |group $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn group (props & children) (dev-check props lilac-container)
              noted "\"which is an alias of container" $ create-element :container props children
        |handle-drag-moving $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-drag-moving (el)
              .!addEventListener el "\"mousedown" $ fn (event)
                reset! *drag-moving-cache $ [] (.-clientX event) (.-clientY event)
              .!addEventListener el "\"mouseup" $ fn (event) (reset! *drag-moving-cache nil)
              .!addEventListener el "\"mousemove" $ fn (event)
                if
                  and
                    or (.-metaKey event) (.-ctrlKey event) (.-shiftKey event)
                    some? @*drag-moving-cache
                  let
                      prev @*drag-moving-cache
                      current $ [] (.-clientX event) (.-clientY event)
                      delta $ complex/minus current prev
                    reset! *drag-moving-cache current
                    swap! *stage-config update :move $ fn (prev) (complex/add prev delta)
                    render-stage-for-viewer!
              .!addEventListener el "\"wheel"
                fn (event)
                  if
                    or (.-metaKey event) (.-ctrlKey event) (.-shiftKey event)
                    let
                        dy $ * 0.001 (.-deltaY event)
                        scale $ :scale @*stage-config
                        pointer $ complex/minus
                          [] (.-clientX event) (.-clientY event)
                          [] (* 0.5 js/window.innerWidth) (* 0.5 js/window.innerHeight)
                      when
                        not
                          and (<= scale 0.1)
                            < (.-deltaY event) 0
                          and (>= scale 4)
                            > (.-deltaY event) 0
                        swap! *stage-config update :move $ fn (pos)
                          let
                              shift $ complex/minus pointer pos
                            complex/minus pos $ complex/times shift
                              [] (/ dy scale) 0
                        swap! *stage-config update :scale $ fn (x) (+ x dy)
                        render-stage-for-viewer!
                js-object $ :passive true
        |hclx $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn hclx (h c l)
              .!toNumber $ new Color (hcl-to-hex h c l)
        |hsluvx $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn hsluvx (h c l)
              let
                  conv $ new Hsluv
                set! (.-hsluv_h conv) h
                set! (.-hsluv_s conv) c
                set! (.-hsluv_l conv) l
                .!hsluvToRgb conv
                .!toNumber $ new Color
                  js-array (.-rgb_r conv) (.-rgb_g conv) (.-rgb_b conv)
        |hslx $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn hslx (h s l)
              .!toNumber $ new Color
                js-object (:h h) (:s s) (:l l) (:a 1)
        |image $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn image (props & children) (dev-check props lilac-image) (create-element :image props children)
        |init-pixi-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-pixi-app! (options)
              let
                  pixi-app $ new PIXI/Application
                    js-object (:antialias true) (:autoDensity true) (:autoStart false) (:resolution 2) (:width js/window.innerWidth) (:height js/window.innerHeight)
                      :backgroundColor $ either (:background-color options) (hslx 0 0 0)
                      :interactive $ either (:interactive options) true
                      :backgroundAlpha $ either (:background-alpha options) 1
                .!stop $ .-ticker pixi-app
                -> PIXI/Ticker .-shared $ .!stop
                -> PIXI/Ticker .-system $ .!stop
                reset! *app pixi-app
                let
                    el $ .-view pixi-app
                  -> js/document .-body $ .!appendChild el
                  handle-drag-moving el
                -> pixi-app .-renderer .-plugins .-accessibility (.!destroy) 
                js/window.addEventListener "\"resize" $ fn (event)
                  -> pixi-app .-renderer $ .!resize js/window.innerWidth js/window.innerHeight
                  render-stage-for-viewer!
                , pixi-app
        |lilac-arc $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-arc $ record+
              {} (:center lilac-point)
                :angle $ optional+
                  tuple+ $ [] (number+) (number+)
                :radian $ optional+
                  tuple+ $ [] (number+) (number+)
                :radius $ number+
                :anticlockwise? $ optional+ (bool+)
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-arc-to $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-arc-to $ record+
              {} (:p1 lilac-point) (:p2 lilac-point)
                :radius $ number+
              {} $ :exact-keys? true
        |lilac-begin-fill $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-begin-fill $ record+
              {} (:color lilac-color)
                :alpha $ optional+ (number+)
              {} $ :check-keys? true
        |lilac-bezier-to $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-bezier-to $ record+
              {} (:p1 lilac-point) (:p2 lilac-point) (:to-p lilac-point)
              {} $ :exact-keys? true
        |lilac-image $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-image $ record+
              {}
                :url $ string+
                :size $ options+ lilac-point
                :on $ optional+ lilac-event-map
                :position $ optional+ lilac-point
                :pivot $ optional+ lilac-point
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
              {} $ :check-keys? true
        |lilac-mesh $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-mesh $ record+
              {}
                :on $ optional+ lilac-event-map
                :position lilac-point
                :radius $ number+
                :fill $ optional+ (number+)
                :alpha $ optional+ (number+)
                :rotation $ optional+ (number+)
                :angle $ optional+ (number+)
                :pivot $ optional+ lilac-point
                :fill $ optional+ (number+)
                :on-keyboard $ optional+ lilac-event-map
                :filters $ optional+
                  list+ $ list+ (any+)
                :geometry $ record+
                  {}
                    :attributes $ list+
                      record+ $ {}
                        :id $ string+
                        :buffer $ list+ (number+)
                        :size $ number+
                    :index $ list+
                      number+ $ {} (:min 0)
                :shader $ record+
                  {}
                    :vertex-source $ string+
                    :fragment-source $ string+
                :uniforms $ any+
                :draw-mode $ optional+
                  or (keyword+)
                    number+ $ {} (:min 0) (:max 6)
              {} $ :check-keys? true
        |lilac-quodratic-to $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-quodratic-to $ record+
              {} (:p1 lilac-point) (:to-p lilac-point)
              {} $ :exact-keys? true
        |line-segments $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn line-segments (props & children) (dev-check props lilac-line-segments)
              let
                  line-style $ :style props
                  segments $ :segments props
                create-element :graphics
                  assoc props :ops $ concat
                    [] $ g :line-style line-style
                    -> segments $ mapcat
                      fn (pair)
                        []
                          g :move-to $ nth pair 0
                          g :line-to $ nth pair 1
                  , children
        |mesh $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn mesh (props & children) (dev-check props lilac-mesh) (create-element :mesh props children)
        |mount-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn mount-app! (app dispatch!)
              let
                  element-tree $ render-element app dispatch!
                .!addChild (.-stage @*app) element-tree
        |on-control-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn on-control-event (elapsed states delta)
              if
                and $ :left-b? states
                reset-stage-config!
                let
                    move $ :left-move states
                    scales $ :right-move delta
                  update-stage-config!
                    map move $ fn (x)
                      * x (js/Math.abs x) 0.02
                    nth scales 1
        |polyline $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn polyline (props & children) (dev-check props lilac-polyline)
              let
                  line-style $ :style props
                  points $ :points props
                create-element :graphics
                  assoc props :ops $ concat
                    [] (g :line-style line-style)
                      g :move-to $ nth points 0
                    -> points rest $ map
                      fn (p) (g :line-to p)
                  , children
        |rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rect (props & children) (dev-check props lilac-rect) (create-element :rect props children)
        |render! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render! (expanded-app dispatch! options)
              when (nil? @*app) (init-pixi-app! options) (aset js/window "\"_phloxTree" @*app)
              reset! *dispatch-fn dispatch!
              let
                  wrap-dispatch $ fn (op ? data)
                    if (list? op)
                      @*dispatch-fn $ :: :states op data
                      if (tag? op)
                        @*dispatch-fn $ :: op data
                        @*dispatch-fn op
                ; js/console.log "\"render!" expanded-app
                if (nil? @*tree-element)
                  do (mount-app! expanded-app wrap-dispatch) (handle-keyboard-events *tree-element wrap-dispatch)
                  rerender-app! expanded-app wrap-dispatch options
                reset! *tree-element expanded-app
              render-stage-for-viewer!
        |render-stage-for-viewer! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-stage-for-viewer! ()
              let
                  scale $ :scale @*stage-config
                  move $ :move @*stage-config
                -> @*app .-stage .-position .-x $ set!
                  + (* 0.5 js/window.innerWidth) (nth move 0)
                -> @*app .-stage .-position .-y $ set!
                  + (* 0.5 js/window.innerHeight) (nth move 1)
                -> @*app .-stage .-scale $ .!set scale scale
              -> @*app .-renderer $ .!render (.-stage @*app)
        |rerender-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rerender-app! (app dispatch! options) (; js/console.log "\"rerender tree" app @*tree-element)
              update-children
                [] $ [] 0 app
                [] $ [] 0 @*tree-element
                .-stage @*app
                , dispatch! options
        |reset-stage-config! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reset-stage-config! () $ let
                move0 $ :move @*stage-config
                scale0 $ :scale @*stage-config
              when
                or
                  not= ([] 0 0) move0
                  not= 1 scale0
                if
                  not= ([] 0 0) move0
                  swap! *stage-config update :move $ fn (prev)
                    &let
                      l $ vec-length prev
                      if (< l 4) ([] 0 0)
                        &let
                          move-back $ complex/times prev
                            [] (&/ -4 l) 0
                          complex/add prev move-back
                if (not= scale0 1)
                  swap! *stage-config update :scale $ fn (prev)
                    let
                        delta $ - scale0 1
                      if
                        > 0.01 $ js/Math.abs delta
                        , 1 $ + prev
                          if (> delta 0) -0.01 0.01
                render-stage-for-viewer!
        |text $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn text (props & children) (dev-check props lilac-text) (create-element :text props children)
        |update-stage-config! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-stage-config! (move scale-change)
              let
                  scale0 $ :scale @*stage-config
                when
                  and
                    or
                      not= ([] 0 0) move
                      not= 0 scale-change
                    not $ and (> scale-change 0) (>= scale0 8)
                  swap! *stage-config update :move $ fn (prev)
                    complex/add
                      complex/minus prev $ complex/scale (complex/conjugate move) 0.05
                      complex/scale prev $ / (* 0.01 scale-change) scale0
                  swap! *stage-config update :scale $ fn (prev)
                    let
                        next $ &+ prev (* 0.01 scale-change)
                      &max 0.2 $ &min next 8
                  render-stage-for-viewer!
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.core $ :require ("\"pixi.js" :as PIXI) (phlox.schema :as schema)
            phlox.render :refer $ render-element update-element update-children
            phlox.util :refer $ index-items remove-nil-values detect-func-in-map?
            "\"@quamolit/phlox-utils" :refer $ hcl-to-hex
            phlox.check :refer $ dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-point lilac-circle dev-check-message lilac-line-style lilac-polyline lilac-line-segments
            lilac.core :refer $ record+ number+ string+ optional+ tuple+ dict+ fn+ keyword+ bool+ list+ or+ any+
            phlox.keyboard :refer $ handle-keyboard-events
            memof.once :refer $ reset-memof1-caches!
            phlox.complex :as complex
            phlox.math :refer $ vec-length
            "\"hsluv" :refer $ Hsluv
            "\"pixi.js" :refer $ Color
    |phlox.cursor $ %{} :FileEntry
      :defs $ {}
        |update-states $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-states (store cursor data)
              assoc-in store
                concat ([] :states) cursor $ [] :data
                , data
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.cursor)
    |phlox.input $ %{} :FileEntry
      :defs $ {}
        |lilac-input $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lilac-input $ record+
              {}
                :placeholder $ string+
                :initial $ string+
                :style $ dict+ (keyword+) (any+)
                :textarea? $ bool+
              {} (:all-optional? true) (:check-keys? true)
        |request-text! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn request-text! (e options cb) (dev-check options lilac-input)
              prompt-at!
                [] (-> e .-data .-global .-x) (-> e .-data .-global .-y)
                , options cb
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.input $ :require
            [] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ dict+ fn+ any+ keyword+ bool+ list+ or+ is+
            [] phlox.check :refer $ [] dev-check
            pointed-prompt.core :refer $ prompt-at!
    |phlox.keyboard $ %{} :FileEntry
      :defs $ {}
        |get-value $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-value (*x) @*x
        |handle-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-event (kind tree event dispatch!)
              when (some? tree)
                if (element? tree)
                  do
                    let
                        listener $ get-in tree ([] :props :on-keyboard kind)
                      when (fn? listener) (listener event dispatch!)
                    -> (:children tree)
                      map $ fn (pair)
                        let[] (k child) pair $ handle-event kind child event dispatch!
                  do $ js/console.log "\"unknown tree for handling event:" tree
        |handle-keyboard-events $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-keyboard-events (*tree-element dispatch!)
              .!addEventListener js/window "\"keydown" $ fn (event)
                handle-event :down (get-value *tree-element) (wrap-event event) dispatch!
              .!addEventListener js/window "\"keyup" $ fn (event)
                handle-event :up (get-value *tree-element) (wrap-event event) dispatch!
              .!addEventListener js/window "\"keypress" $ fn (event)
                handle-event :press (get-value *tree-element) (wrap-event event) dispatch!
        |wrap-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wrap-event (event)
              {} (:event event)
                :key $ .-key event
                :key-code $ .-keyCode event
                :ctrl? $ .-ctrlKey event
                :meta? $ .-metaKey event
                :shift? $ .-shiftKey event
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.keyboard $ :require
            [] phlox.util :refer $ [] element?
    |phlox.math $ %{} :FileEntry
      :defs $ {}
        |angle->radian $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn angle->radian (x) (* x radian-ratio)
        |bound-x $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn bound-x (x lower higher)
              js/Math.min (either higher js/+Infinity)
                js/Math.max (either lower js/-Infinity) x
        |radian-ratio $ %{} :CodeEntry (:doc |)
          :code $ quote
            def radian-ratio $ / js/Math.PI 180
        |vec-length $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn vec-length (point)
              let[] (x y) point $ js/Math.sqrt
                &+ (&* x x) (&* y y)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.math)
    |phlox.render $ %{} :FileEntry
      :defs $ {}
        |init-box-size $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-box-size (target size)
              if (some? size)
                do
                  set! (.-width target) (nth size 0)
                  set! (.-height target) (nth size 1)
        |init-fill $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-fill (target color) (.!endFill target)
              if (some? color) (.!beginFill target color)
        |init-filters $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-filters (target filters)
              if
                not $ empty? filters
                let
                    filters-arr $ js-array
                  &doseq (ft filters)
                    if
                      and (list? ft)
                        &= 2 $ count ft
                      let[] (ctor options) ft $ .!push filters-arr
                        new ctor $ to-js-data (nth ft 1)
                      js/console.warn "\"Unknown filter:" ft
                  set! (.-filters target) filters-arr
        |init-geometry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-geometry (data)
              let
                  geo $ new PIXI/Geometry
                  attrs $ :attributes data
                &doseq (attr attrs)
                  .!addAttribute geo (:id attr)
                    to-js-data $ :buffer attr
                    :size attr
                .!addIndex geo $ to-js-data (:index data)
                , geo
        |init-scale $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-scale (target scale)
              when (some? scale)
                cond
                    list? scale
                    do
                      -> target .-scale .-x $ set!
                        if (list? scale) (first scale)
                      -> target .-scale .-y $ set!
                        if (list? scale) (last scale) 1
                  (number? scale)
                    do
                      -> target .-scale .-x $ set! scale
                      -> target .-scale .-y $ set! scale
                  (nil? scale)
                    do
                      -> target .-scale .-x $ set! 1
                      -> target .-scale .-y $ set! 1
                  true $ js/console.error "\"unknown scale" scale
        |init-shader $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-shader (data uniforms)
              .!from PIXI/Shader (:vertex-source data) (:fragment-source data) uniforms
        |read-draw-mode-alias $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-draw-mode-alias (draw-mode)
              if (tag? draw-mode)
                case-default draw-mode (js/console.warn "\"Unknown draw mode:" draw-mode) (:line-loop 0) (:line-strip 1) (:lines 2) (:points 3) (:triangle-fan 4) (:triangle-strip 5) (:triangles 6)
                , draw-mode
        |render-children $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-children (target children dispatch!)
              &doseq (child-pair children)
                if (some? child-pair)
                  .!addChild target $ render-element (last child-pair) dispatch!
                  js/console.log "\"nil child:" child-pair
        |render-circle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-circle (element dispatch!)
              let
                  target $ new PIXI/Graphics
                  props $ :props element
                  line-style $ :line-style props
                  position $ :position props
                  events $ :on props
                init-fill target $ :fill props
                init-line-style target line-style
                draw-circle target $ :radius props
                init-events target events dispatch!
                init-position target $ :position props
                init-scale target $ :scale props
                init-rotation target $ :rotation props
                init-pivot target $ :pivot props
                init-angle target $ :angle props
                init-alpha target $ :alpha props
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                , target
        |render-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-container (element dispatch!)
              let
                  target $ new PIXI/Container
                  props $ :props element
                render-children target (:children element) dispatch!
                init-position target $ :position props
                init-scale target $ :scale props
                init-rotation target $ :rotation props
                init-angle target $ :angle props
                init-pivot target $ :pivot props
                init-alpha target $ :alpha props
                init-filters target $ :filters props
                , target
        |render-element $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-element (element dispatch!)
              if (element? element)
                case-default (:name element)
                  do
                    println "\"unknown tag:" $ :tag element
                    {}
                  nil nil
                  :container $ render-container element dispatch!
                  :graphics $ render-graphics element dispatch!
                  :circle $ render-circle element dispatch!
                  :rect $ render-rect element dispatch!
                  :text $ render-text element dispatch!
                  :mesh $ render-mesh element dispatch!
                  :image $ render-image element dispatch!
                do $ js/console.error "\"Unknown element:" element
        |render-graphics $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-graphics (element dispatch!)
              let
                  target $ new PIXI/Graphics
                  props $ :props element
                  ops $ :ops props
                  events $ :on props
                ; dev-check props lilac-graphics
                call-graphics-ops target ops
                init-rotation target $ :rotation props
                init-angle target $ :angle props
                init-pivot target $ :pivot props
                init-position target $ :position props
                init-scale target $ :scale props
                init-alpha target $ :alpha props
                init-events target events dispatch!
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                , target
        |render-image $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-image (element dispatch!)
              let
                  props $ :props element
                  target $ .!from PIXI/Sprite (:url props)
                  events $ :on props
                init-position target $ :position props
                init-scale target $ :scale props
                init-pivot target $ :pivot props
                init-rotation target $ :rotation props
                init-angle target $ :angle props
                init-alpha target $ :alpha props
                init-box-size target $ :size props
                init-events target events dispatch!
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                , target
        |render-mesh $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-mesh (element dispatch!)
              let
                  props $ :props element
                  geo $ init-geometry (:geometry props)
                  shader $ init-shader (:shader props) (:uniforms props)
                  draw-mode $ or
                    read-draw-mode-alias $ :draw-mode props
                    , js/undefined
                  target $ new PIXI/Mesh geo shader nil draw-mode
                  events $ :on props
                init-position target $ :position props
                init-scale target $ :scale props
                init-pivot target $ :pivot props
                init-angle target $ :angle props
                init-rotation target $ :rotation props
                init-alpha target $ :alpha props
                init-events target events dispatch!
                if
                  = :center $ :align props
                  .!set (.-anchor target) 0.5
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                ; js/console.log target
                , target
        |render-rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-rect (element dispatch!)
              let
                  target $ new PIXI/Graphics
                  props $ :props element
                  events $ :on props
                init-fill target $ :fill props
                init-line-style target $ :line-style props
                draw-rect target (:size props) (:radius props)
                init-position target $ :position props
                init-scale target $ :scale props
                init-pivot target $ :pivot props
                init-rotation target $ :rotation props
                init-angle target $ :angle props
                init-alpha target $ :alpha props
                init-events target events dispatch!
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                , target
        |render-text $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-text (element dispatch!)
              let
                  props $ :props element
                  style $ :style props
                  text-style $ new PIXI/TextStyle (convert-line-style style)
                  target $ new PIXI/Text (:text props) text-style
                init-position target $ :position props
                init-scale target $ :scale props
                init-pivot target $ :pivot props
                init-angle target $ :angle props
                init-rotation target $ :rotation props
                init-alpha target $ :alpha props
                if
                  = :center $ :align props
                  .!set (.-anchor target) 0.5
                init-filters target $ :filters props
                render-children target (:children element) dispatch!
                , target
        |update-angle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-angle (target v v0)
              when (not= v v0)
                set! (.-angle target) v
        |update-box-size $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-box-size (target size size')
              if (not= size size')
                if (some? size)
                  do
                    set! (.-width target) (nth size 0)
                    set! (.-height target) (nth size 1)
                  do
                    set! (.-width target) js/undefined
                    set! (.-height target) js/undefined
        |update-children $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-children (children-dict old-children-dict parent-container dispatch! options)
              when dev? $ assert "\"children should not contain nil element"
                and
                  every? (map children-dict last) some?
                  every? (map old-children-dict last) some?
              let
                  list-ops $ find-minimal-ops lcs-state-0 (map old-children-dict first) (map children-dict first)
                ; js/console.log "\"ops" $ :total list-ops
                loop
                    idx 0
                    ops $ :acc list-ops
                    xs children-dict
                    ys old-children-dict
                  when-not (empty? ops)
                    let
                        op $ first ops
                      case-default (first op)
                        do $ println "\"Unknown op:" op
                        :remains $ do
                          when dev? $ assert
                            = (last op)
                              first $ first xs
                              first $ first ys
                            , "\"check key"
                          update-element
                            last $ first xs
                            last $ first ys
                            , parent-container idx dispatch! options
                          recur (inc idx) (rest ops) (rest xs) (rest ys)
                        :add $ do
                          when dev? $ assert "\"check key"
                            = (last op)
                              first $ first xs
                          .!addChildAt parent-container
                            render-element
                              last $ first xs
                              , dispatch!
                            , idx
                          recur (inc idx) (rest ops) (rest xs) ys
                        :remove $ do
                          when dev? $ assert "\"check key"
                            = (last op)
                              first $ first ys
                          .!removeChildAt parent-container idx
                          recur idx (rest ops) xs $ rest ys
        |update-circle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-circle (element old-element target dispatch!)
              let
                  props $ :props element
                  props' $ :props old-element
                  position $ :position props
                  position' $ :position props'
                  radius $ :radius props
                  radius' $ :radius props'
                  line-style $ :line-style props
                  line-style' $ :line-style props'
                when
                  or (not= position position') (not= radius radius') (not= line-style line-style')
                    not= (:fill props) (:fill props')
                  .!clear target
                  init-fill target $ :fill props
                  init-line-style target line-style
                  draw-circle target $ :radius props
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-alpha target (:alpha props) (:alpha props')
                update-angle target (:angle props) (:angle props')
                update-rotation target (:rotation props) (:rotation props')
                update-pivot target (:pivot props) (:pivot props')
                update-events target (-> element :props :on) (-> old-element :props :on) dispatch!
                update-filters target (:filters props) (:filters props')
        |update-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-container (element old-element target)
              let
                  props $ :props element
                  props' $ :props old-element
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-pivot target (:pivot props) (:pivot props')
                update-angle target (:angle props) (:angle props')
                update-rotation target (:rotation props) (:rotation props')
                update-alpha target (:alpha props) (:alpha props')
                update-filters target (:filters props) (:filters props')
        |update-draw-mode $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-draw-mode (target draw-mode draw-mode')
              when (not= draw-mode draw-mode')
                let
                    m $ read-draw-mode-alias draw-mode
                  if (nil? m) (eprintln "\"updating draw-mode to nil")
                  set! (.-drawMode target) m
        |update-element $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-element (element old-element parent-element idx dispatch! options)
              cond
                  or (nil? element) (nil? element)
                  js/console.error "\"Not supposed to be empty"
                (and (element? element) (element? old-element) (= (:name element) (:name old-element)))
                  do
                    let
                        target $ .!getChildAt parent-element idx
                      case-default (:name element)
                        do $ eprintln "\"not implement yet for updating:" (:name element)
                        :container $ update-container element old-element target
                        :circle $ update-circle element old-element target dispatch!
                        :rect $ update-rect element old-element target dispatch!
                        :text $ update-text element old-element target
                        :graphics $ update-graphics element old-element target dispatch!
                        :mesh $ update-mesh element old-element target dispatch!
                        :image $ update-image element old-element target dispatch!
                    update-children (:children element) (:children old-element) (.!getChildAt parent-element idx) dispatch! options
                (not= (:name element) (:name old-element))
                  do (.!removeChildAt parent-element idx)
                    .!addChildAt parent-element (render-element element dispatch!) idx
                true $ js/console.warn "\"Unknown case:" element old-element
        |update-filters $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-filters (target filters filters0)
              if
                not=
                  map (.to-list filters) last
                  map (.to-list filters0) last
                init-filters target filters
        |update-geometry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-geometry (target geo geo')
              when (not= geo geo')
                -> target .-geometry $ set! (init-geometry geo)
        |update-graphics $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-graphics (element old-element target dispatch!)
              let
                  props $ :props element
                  props' $ :props old-element
                  ops $ :ops props
                  ops' $ :ops props'
                when (not= ops ops') (.!clear target) (call-graphics-ops target ops)
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-rotation target (:rotation props) (:rotation props')
                update-angle target (:angle props) (:angle props')
                update-pivot target (:pivot props) (:pivot props')
                update-alpha target (:alpha props) (:alpha props')
                update-events target (-> element :props :on) (-> old-element :props :on) dispatch!
                update-filters target (:filters props) (:filters props')
        |update-image $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-image (element old-element target dispatch!)
              let
                  props $ :props element
                  props' $ :props old-element
                  position $ :position props
                  position' $ :position props'
                  size $ :size props
                  size' $ :size props'
                when
                  not= (:url props) (:url props')
                  js/console.warn "\"image url changes are not handling in updates"
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-rotation target (:rotation props) (:rotation props')
                update-angle target (:angle props) (:angle props')
                update-pivot target (:pivot props) (:pivot props')
                update-alpha target (:alpha props) (:alpha props')
                update-box-size target (:size props) (:size props')
                update-events target (-> element :props :on) (-> old-element :props :on) dispatch!
                update-filters target (:filters props) (:filters props')
        |update-mesh $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-mesh (element old-element target dispatch!)
              let
                  props $ :props element
                  props' $ :props old-element
                  ops $ :ops props
                  ops' $ :ops props'
                update-geometry target (:geometry props) (:geometry props')
                update-shader target (:shader props) (:shader props') (:uniforms props)
                update-draw-mode target (:draw-mode props) (:draw-mode props')
                let
                    pointer $ -> target .-shader .-uniforms
                  -> (:uniforms props) js/Object.entries $ .!forEach
                    fn (arr ? a b)
                      if
                        not $ identical? (.-1 arr)
                          aget pointer $ .-0 arr
                        aset pointer (.-0 arr) (.-1 arr)
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-rotation target (:rotation props) (:rotation props')
                update-angle target (:angle props) (:angle props')
                update-pivot target (:pivot props) (:pivot props')
                update-alpha target (:alpha props) (:alpha props')
                update-events target (-> element :props :on) (-> old-element :props :on) dispatch!
                update-filters target (:filters props) (:filters props')
        |update-rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-rect (element old-element target dispatch!)
              let
                  props $ :props element
                  props' $ :props old-element
                  position $ :position props
                  position' $ :position props'
                  size $ :size props
                  size' $ :size props'
                  radius $ :radius props
                  radius' $ :radius props'
                  line-style $ :line-style props
                  line-style' $ :line-style props'
                when
                  or (not= size size') (not= radius radius') (not= line-style line-style')
                    not= (:fill props) (:fill props')
                  .!clear target
                  init-fill target $ :fill props
                  init-line-style target line-style
                  draw-rect target size $ :radius props
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-rotation target (:rotation props) (:rotation props')
                update-angle target (:angle props) (:angle props')
                update-pivot target (:pivot props) (:pivot props')
                update-alpha target (:alpha props) (:alpha props')
                update-events target (-> element :props :on) (-> old-element :props :on) dispatch!
                update-filters target (:filters props) (:filters props')
        |update-scale $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-scale (target scale scale')
              when (not= scale scale')
                cond
                    list? scale
                    do
                      set! (-> target .-scale .-x) (first scale)
                      set! (-> target .-scale .-y) (last scale)
                  (number? scale)
                    do
                      set! (-> target .-scale .-x) scale
                      set! (-> target .-scale .-y) scale
                  (nil? scale)
                    do
                      set! (-> target .-scale .-x) 1
                      set! (-> target .-scale .-y) 1
                  true $ js/console.error "\"unknown scale:" scale
        |update-shader $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-shader (target shader shader' uniforms)
              when (not= shader shader')
                -> target .-shader $ set! (init-shader shader uniforms)
        |update-text $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-text (element old-element target)
              let
                  props $ :props element
                  props' $ :props old-element
                  text-style $ :style props
                  text-style' $ :style props'
                when
                  not= (:text props) (:text props')
                  set! (.-text target) (:text props)
                when (not= text-style text-style')
                  let
                      new-style $ new PIXI/TextStyle (convert-line-style text-style)
                    set! (.-style target) new-style
                update-position target (:position props) (:position props')
                update-scale target (:scale props) (:scale props')
                update-rotation target (:rotation props) (:rotation props')
                update-angle target (:angle props) (:angle props')
                update-pivot target (:pivot props) (:pivot props')
                update-alpha target (:alpha props) (:alpha props')
                if
                  not= (:align props) (:align props')
                  if
                    = :center $ :align props
                    .!set (.-anchor target) 0.5
                    .!set (.-anchor target) nil
                update-filters target (:filters props) (:filters props')
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.render $ :require ("\"pixi.js" :as PIXI)
            phlox.util :refer $ use-number element? remove-nil-values index-items convert-line-style
            phlox.util.lcs :refer $ find-minimal-ops lcs-state-0
            phlox.render.draw :refer $ call-graphics-ops update-position update-pivot update-rotation update-alpha update-events draw-circle draw-rect init-events init-position init-pivot init-angle init-rotation init-alpha init-line-style
            phlox.check :refer $ dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-circle
            phlox.config :refer $ dev?
    |phlox.render.draw $ %{} :FileEntry
      :defs $ {}
        |call-graphics-ops $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn call-graphics-ops (target ops)
              &doseq (pair ops)
                when (some? pair)
                  let[] (op data) pair $ case-default op (js/console.warn "\"not supported op:" op data)
                    :move-to $ .!moveTo target (first data) (last data)
                    :line-to $ .!lineTo target (first data) (last data)
                    :line-style $ init-line-style target data
                    :begin-fill $ .!beginFill target (:color data)
                      either (:alpha data) 1
                    :end-fill $ .!endFill target
                    :close-path $ .!closePath target
                    :arc $ let
                        center $ :center data
                        radian $ cond
                            some? $ :radian data
                            :radian data
                          (some? (:angle data))
                            map (:angle data) angle->radian
                          true $ do (js/console.warn "\"Unknown arc" data) ([] 0 0)
                      .!arc target (first center) (last center) (:radius data) (first radian) (last radian) (:anticlockwise? data)
                    :arc-to $ let
                        p1 $ :p1 data
                        p2 $ :p2 data
                      .!arcTo target (first p1) (last p1) (first p2) (last p2) (:radius data)
                    :bezier-to $ let
                        p1 $ :p1 data
                        p2 $ :p2 data
                        to-p $ :to-p data
                      .!bezierCurveTo target (first p1) (last p1) (first p2) (last p2) (first to-p) (last to-p)
                    :quadratic-to $ let
                        p1 $ :p1 data
                        to-p $ :to-p data
                      .!quadraticCurveTo target (first p1) (last p1) (first to-p) (last to-p)
                    :begin-hole $ .!beginHole target
                    :end-hole $ .!endHole target
        |draw-circle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn draw-circle (target radius)
              if (number? radius)
                .!drawCircle target 0 0 $ use-number radius
                js/console.warn "\"Unknown radius"  radius
        |draw-rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn draw-rect (target size radius)
              if (list? size)
                if (some? radius)
                  .!drawRoundedRect target 0 0
                    use-number $ first size
                    use-number $ last size
                    , radius
                  .!drawRect target 0 0
                    use-number $ first size
                    use-number $ last size
                js/console.warn "\"Unknown size" size
        |init-alpha $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-alpha (target alpha)
              when (some? alpha)
                set! (-> target .-alpha) alpha
        |init-angle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-angle (target v)
              when (some? v)
                set! (.-angle target) v
        |init-events $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-events (target events dispatch!)
              when (some? events)
                set! (.-eventMode target) "\"dynamic"
                set! (.-buttonMode target) true
                &doseq
                  pair $ to-pairs events
                  let[] (k listener) pair $ .!on target (turn-string k)
                    fn (event) (listener event dispatch!)
        |init-line-style $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-line-style (target line-style)
              when (some? line-style)
                .!lineStyle target $ js-object
                  :width $ use-number (:width line-style)
                  :color $ use-number (:color line-style)
                  :alpha $ either (:alpha line-style) 1
                  :join $ read-line-join (:join line-style)
                  :cap $ read-line-cap (:cap line-style)
        |init-pivot $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-pivot (target pivot)
              when (some? pivot)
                -> target .-pivot .-x $ set! (first pivot)
                -> target .-pivot .-y $ set! (last pivot)
        |init-position $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-position (target point)
              when (some? point)
                -> target .-position .-x $ set!
                  if (list? point) (first point) 0
                -> target .-position .-y $ set!
                  if (list? point) (last point) 0
        |init-rotation $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn init-rotation (target v)
              when (some? v)
                set! (.-rotation target) v
        |read-line-cap $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-line-cap (x)
              case-default x (println "\"unknown line-cap:" x)
                nil $ .-BUTT PIXI/LINE_CAP
                :butt $ .-BUTT PIXI/LINE_CAP
                :round $ .-ROUND PIXI/LINE_CAP
                :square $ .-SQUARE PIXI/LINE_CAP
        |read-line-join $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn read-line-join (x)
              case-default x
                do $ println "\"unknown line-join value:" x
                nil $ .-MITER PIXI/LINE_JOIN
                :bevel $ .-BEVEL PIXI/LINE_JOIN
                :miter $ .-MITER PIXI/LINE_JOIN
                :round $ .-ROUND PIXI/LINE_JOIN
        |update-alpha $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-alpha (target alpha alpha0)
              when (not= alpha alpha0)
                set! (-> target .-alpha) alpha
        |update-events $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-events (target events old-events dispatch!)
              when (some? old-events)
                &doseq
                  pair $ to-pairs old-events
                  let[] (k listener) pair $ .!off target (turn-string k)
              when (some? events)
                &doseq
                  pair $ to-pairs events
                  let[] (k listener) pair $ .!on target (turn-string k)
                    fn (event) (listener event dispatch!)
              if (some? events)
                do
                  set! (.-buttonMode target) true
                  set! (.-eventMode target) "\"dynamic"
                do
                  set! (.-buttonMode target) false
                  set! (.-eventMode target) "\"none"
        |update-pivot $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-pivot (target pivot pivot0)
              when (not= pivot pivot0)
                set! (-> target .-pivot .-x)
                  if (list? pivot) (first pivot) nil
                set! (-> target .-pivot .-y)
                  if (list? pivot) (last pivot) nil
        |update-position $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-position (target point point0)
              when (not= point point0)
                set! (-> target .-position .-x)
                  if (list? point) (first point) nil
                set! (-> target .-position .-y)
                  if (list? point) (last point) nil
        |update-rotation $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-rotation (target v v0)
              when (not= v v0)
                set! (.-rotation target) v
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.render.draw $ :require
            phlox.util :refer $ use-number
            lilac.core :refer $ record+ number+ string+ optional+ bool+ tuple+ dict+ fn+ keyword+ list+ or+
            phlox.check :refer $ dev-check dev-check-message lilac-point lilac-line-style lilac-color
            phlox.math :refer $ angle->radian
            phlox.render.draw :refer $ init-line-style
            "\"pixi.js" :as PIXI
    |phlox.schema $ %{} :FileEntry
      :defs $ {}
        |PhloxElement $ %{} :CodeEntry (:doc |)
          :code $ quote (defrecord PhloxElement :name :props :children)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.schema)
    |phlox.test $ %{} :FileEntry
      :defs $ {}
        |test-lcs $ %{} :CodeEntry (:doc |)
          :code $ quote
            deftest test-lcs $ testing "\"Find simple changes"
              is $ =
                find-minimal-ops lcs-state-0 (list "\"a") (list "\"b")
                {}
                  :acc $ [] ([] :remove "\"a") ([] :add "\"b")
                  :step 2
              is $ =
                find-minimal-ops lcs-state-0 (list "\"a") (list "\"a")
                {}
                  :acc $ [] ([] :remains "\"a")
                  :step 0
              is $ =
                find-minimal-ops lcs-state-0 (list) (list "\"a")
                {}
                  :acc $ [] ([] :add "\"a")
                  :step 1
              is $ =
                find-minimal-ops lcs-state-0 (list "\"a" "\"b" "\"c") (list "\"a" "\"c")
                {}
                  :acc $ [] ([] :remains "\"a") ([] :remove "\"b") ([] :remains "\"c")
                  :step 1
              is $ =
                find-minimal-ops lcs-state-0 (list "\"a" "\"b" "\"c") (list "\"a" "\"c" "\"c")
                {}
                  :acc $ [] ([] :remains "\"a") ([] :remove "\"b") ([] :remains "\"c") ([] :add "\"c")
                  :step 2
              is $ =
                find-minimal-ops lcs-state-0 (list "\"a" "\"c") (list "\"a" "\"b1" "\"b2" "\"b3" "\"c")
                {}
                  :acc $ [] ([] :remains "\"a") ([] :add "\"b1") ([] :add "\"b2") ([] :add "\"b3") ([] :remains "\"c")
                  :step 3
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.test $ :require
            [] cljs.test :refer $ [] deftest is testing run-tests
            [] phlox.util.lcs :refer $ [] find-minimal-ops lcs-state-0
    |phlox.util $ %{} :FileEntry
      :defs $ {}
        |*ctx-instance $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *ctx-instance nil)
        |camel-case $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn camel-case (x)
              .!replace x (new js/RegExp "\"-[a-z]")
                fn (x idx full-text)
                  .!toUpperCase $ get x 1
        |canvas-center! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn canvas-center! () $ [] (&* 0.5 js/window.innerWidth) (&* 0.5 js/window.innerHeight)
        |convert-line-style $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn convert-line-style (props)
              -> props (to-pairs)
                map $ fn (pair)
                  let-sugar
                        [] k v
                        , pair
                      key-name $ camel-case
                        cond
                            tag? k
                            turn-string k
                          (string? k) k
                          true $ str k
                    [] key-name $ case-default k
                      cond
                          tag? v
                          turn-string v
                        (string? v) v
                        (number? v) v
                        (bool? v) v
                        (list? v) v
                        true $ do (println "\"Unknown style value:" v) v
                      :fill-gradient-type $ case-default v
                        do (println "\"unknown gradient type:") v
                        :h $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL
                        :horizontal $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL
                        :v $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL
                        :vertical $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL
                pairs-map
                to-js-data
        |detect-func-in-map? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn detect-func-in-map? (params)
              if (empty? params) false $ let
                  p0 $ first params
                if
                  and (map? p0)
                    some
                      fn
                          [] k v
                        fn? v
                      , p0
                  , true $ recur (rest params)
        |element? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn element? (x)
              and (record? x) (&record:matches? schema/PhloxElement x)
        |index-items $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn index-items (xs)
              -> xs $ map-indexed
                fn (idx x) ([] idx x)
        |measure-text-width! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn measure-text-width! (text size font-family)
              when (nil? @*ctx-instance)
                let
                    el $ js/document.createElement "\"canvas"
                  reset! *ctx-instance $ .!getContext el "\"2d"
              set! (.-font @*ctx-instance) (str size "\"px " font-family)
              .-width $ .!measureText @*ctx-instance text
        |rand-color $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-color () $ rand-int 0xffffff
        |remove-nil-values $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn remove-nil-values (dict)
              -> dict $ filter
                fn (pair)
                  some? $ last pair
        |use-number $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn use-number (x)
              if
                and (number? x)
                  not $ js/isNaN x
                , x $ do (js/console.error "\"Invalid number:" x) nil
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns phlox.util $ :require ([] "\"pixi.js" :as PIXI) ([] phlox.schema :as schema)
    |phlox.util.lcs $ %{} :FileEntry
      :defs $ {}
        |find-minimal-ops $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn find-minimal-ops (state xs ys)
              ; println "\"find ops" state (count xs) (count ys)
              cond
                  and (empty? xs) (empty? ys)
                  , state
                (and (empty? xs) (not (empty? ys)))
                  recur
                    -> state
                      update :acc $ fn (acc)
                        conj acc $ [] :add (first ys)
                      update :step inc
                    []
                    rest ys
                (and (empty? ys) (not (empty? xs)))
                  recur
                    -> state
                      update :acc $ fn (acc)
                        conj acc $ [] :remove (first xs)
                      update :step inc
                    rest xs
                    []
                true $ let
                    x0 $ first xs
                    y0 $ first ys
                  cond
                      = x0 y0
                      recur
                        -> state
                          update :acc $ fn (acc)
                            conj acc $ [] :remains x0
                          update :step inc
                        rest xs
                        rest ys
                    (any? ys (fn (y) (= x0 y)))
                      recur
                        -> state
                          update :acc $ fn (acc)
                            conj acc $ [] :remove x0
                          update :step inc
                        rest xs
                        , ys
                    (any? ys (fn (x) (= y0 x)))
                      recur
                        -> state
                          update :acc $ fn (acc)
                            conj acc $ [] :add y0
                          update :step inc
                        , xs $ rest ys
                    true $ let
                        solution-a $ find-minimal-ops
                          -> state
                            update :acc $ fn (acc)
                              conj acc $ [] :remove (first xs)
                            update :step inc
                          rest xs
                          , ys
                        solution-b $ find-minimal-ops
                          -> state
                            update :acc $ fn (acc)
                              conj acc $ [] :add (first ys)
                            update :step inc
                          , xs (rest ys)
                      if
                        <= (:step solution-a) (:step solution-b)
                        , solution-a solution-b
        |lcs-state-0 $ %{} :CodeEntry (:doc |)
          :code $ quote
            def lcs-state-0 $ {}
              :acc $ []
              :step 0
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.util.lcs)
    |phlox.util.styles $ %{} :FileEntry
      :defs $ {}
        |font-code $ %{} :CodeEntry (:doc |)
          :code $ quote (def font-code "|Source Code Pro, Menlo, Ubuntu Mono, Consolas, monospace")
        |font-normal $ %{} :CodeEntry (:doc |)
          :code $ quote (def font-normal "|Hind, Helvatica, Arial, sans-serif")
        |layout-column $ %{} :CodeEntry (:doc |)
          :code $ quote
            def layout-column $ {} (:display |flex) (:align-items |stretch) (:flex-direction |column)
        |layout-expand $ %{} :CodeEntry (:doc |)
          :code $ quote
            def layout-expand $ {} (:flex 1) (:overflow :auto)
        |layout-row $ %{} :CodeEntry (:doc |)
          :code $ quote
            def layout-row $ {} (:display |flex) (:align-items |stretch) (:flex-direction |row)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns phlox.util.styles)


{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |phlox
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'phlox.app.main/main!) (:mode :js) (:reload-fn 'phlox.app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |pointed-prompt/ |touch-control/ |js-ffi/
      :type-slots $ {}
  :files $ {}
    'phlox.app.comp.drafts $ %{} 'FileEntry
      :defs $ {} $ 'comp-drafts
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-drafts (x)
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
                :on $ {} $ :pointertap
                  fn (event dispatch!) (dispatch! :add-x nil)
              rect
                {}
                  :position $ [] 40 40
                  :size $ [] 50 50
                  :line-style $ {} (:width 4)
                    :color $ hslx 0 80 50
                    :alpha 1
                  :fill $ hslx 200 80 80
                  :on $ {} $ :pointertap
                    fn (e dispatch!) (dispatch! :add-x nil)
                  :rotation $ + 1 $ * 0.1 x
                  :pivot $ [] 0 0
                text $ {}
                  :text $ str "|Text demo:"
                    + 1 $ * 0.1 x
                    , &newline |pivot $ to-lispy-string
                      {} (:x 100) (:y 100)
                  :style $ {} (:font-family |Menlo) (:font-size 12)
                    :fill $ hslx 200 80 90
                    :align :center
              text $ {}
                :text $ str "|Text demo:" x
                :style $ {} (:font-family |Menlo) (:font-size 12)
                  :fill $ hslx 200 80 $ + 80
                    * 20 $ phlox.core/ffi-random
                  :align :center
                :alpha 1
              create-list :container ({})
                -> (range 20)
                  map $ fn (idx)
                    [] idx $ text $ {}
                      :text $ str idx
                      :style $ {} (:font-family "|Helvetica Neue") (:font-weight 300) (:font-size 14)
                        :fill $ hslx 200 10 $ + 40 (* 4 idx)
                      :position $ []
                        + 200 $ * idx 20
                        + 140 $ * idx 10
                      :rotation $ * 0.1 $ + idx x
              graphics $ {}
                :ops $ []
                  g :line-style $ {} (:width 4)
                    :color $ hslx 200 80 80
                    :alpha 1
                  g :begin-fill $ {} $ :color (hslx 0 80 20)
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
                :on $ {} $ :pointertap
                  fn (e dispatch!) (println |clicked)
              rect $ {}
                :position $ [] 400 40
                :size $ [] 20 20
                :fill $ hclx 240 100 60
              image $ {} (:url |https://cdn.tiye.me/logo/quamolit.png)
                :size $ [] 100 100
                :position $ [] 400 -100
                :on $ {} $ :pointertap
                  fn (e d!) (println "|click on image")
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.drafts
          :require $ [] phlox.core :refer $ [] g hslx hclx rect circle text container graphics create-list image
    'phlox.app.comp.keyboard $ %{} 'FileEntry
      :defs $ {} $ 'comp-keyboard
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-keyboard (on? counted)
            container
              {} $ :position $ [] 120 200
              container
                {} $ :position $ [] 0 0
                rect $ {}
                  :position $ [] 0 0
                  :size $ [] 160 40
                  :fill $ hslx 0 0 50
                  :on $ {} $ :pointertap
                    fn (e d!) (d! :toggle-keyboard nil)
                text $ {}
                  :text $ str "|Toggle: " on?
                  :position $ [] 4 8
                  :style $ {} (:font-size 16)
                    :fill $ hslx 0 0 100
              text $ {}
                :text $ str "|Counted: " counted
                :position $ [] 20 60
                :style $ {} (:font-size 16)
                  :fill $ hslx 0 0 100
                :on-keyboard $ if on?
                  {}
                    :down $ fn (e d!) (d! :counted nil)
                    :up $ fn (e d!) (println :up)
                  {}
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Bool 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.keyboard
          :require $ [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list
    'phlox.app.comp.slider-demo $ %{} 'FileEntry
      :defs $ {}
        'comp-slider-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position $ [] 100 100
                comp-slider (>> states :a)
                  {}
                    :value $ option:unwrap-or (get state :a) nil
                    :unit 1
                    :position $ [] 20 0
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :a value
                comp-slider (>> states :b)
                  {}
                    :value $ option:unwrap-or (get state :b) nil
                    :title |Refine
                    :unit 0.1
                    :position $ [] 20 60
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :b value
                comp-slider (>> states :c)
                  {}
                    :value $ option:unwrap-or (get state :c) nil
                    :unit 10
                    :position $ [] 20 120
                    :fill $ hslx 50 90 70
                    :color $ hslx 200 90 30
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :c value
                comp-slider (>> states :d)
                  {}
                    :value $ option:unwrap-or (get state :d) nil
                    :position $ [] 20 180
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :d value
                    :title |Round
                    :round? true
                comp-slider (>> states :e)
                  {}
                    :value $ option:unwrap-or (get state :e) nil
                    :position $ [] 20 240
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :e value
                    :title "|min 10"
                    :min 10
                comp-slider (>> states :f)
                  {}
                    :value $ option:unwrap-or (get state :f) nil
                    :position $ [] 20 300
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :f value
                    :title "|max 10"
                    :max 10
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'comp-slider-point-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-point-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position $ [] 120 100
                comp-slider-point (>> states :a)
                  {}
                    :value $ option:unwrap-or (get state :a) nil
                    :unit 1
                    :position $ [] 20 0
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :a value
                comp-slider-point (>> states :b)
                  {}
                    :value $ option:unwrap-or (get state :b) nil
                    :unit 0.1
                    :position $ [] 20 60
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :b value
                comp-slider-point (>> states :c)
                  {}
                    :value $ option:unwrap-or (get state :c) nil
                    :unit 10
                    :position $ [] 20 120
                    :fill $ hslx 50 90 70
                    :color $ hslx 200 90 30
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :c value
                comp-slider-point (>> states :d)
                  {}
                    :value $ option:unwrap-or (get state :d) nil
                    :position $ [] 20 180
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :d value
                    :round? true
                comp-slider-point (>> states :e)
                  {}
                    :value $ option:unwrap-or (get state :e) nil
                    :position $ [] 20 240
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :e value
                    :min 10
                comp-slider-point (>> states :f)
                  {}
                    :value $ option:unwrap-or (get state :f) nil
                    :position $ [] 20 300
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :f value
                    :max 10
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'comp-spin-slider-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-spin-slider-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:v1 10)
                    :pos $ [] 240 240
              container ({})
                comp-spin-slider (>> states :demo)
                  {}
                    :position $ option:unwrap-or (get state :pos) nil
                    :value $ option:unwrap-or (get state :v1) nil
                    :unit 1
                    :min 1
                    ; :fill $ hslx 50 90 44
                    :fraction 1
                    :on-change $ fn (v d!)
                      d! cursor $ assoc state :v1 v
                    :on-move $ fn (pos d!)
                      d! cursor $ assoc state :pos pos
                    :label |dgemo
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.slider-demo
          :require
            [] phlox.core :refer $ [] g hslx rect circle text container graphics create-list >>
            [] phlox.comp.slider :refer $ [] comp-slider comp-slider-point comp-spin-slider
    'phlox.app.container $ %{} 'FileEntry
      :defs $ {}
        'comp-arrows-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-arrows-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {}
                    :from $ [] 100 100
                    :to $ [] 200 200
              comp-arrow (>> states :demo1)
                {}
                  :from $ option:unwrap-or (get state :from) nil
                  :to $ option:unwrap-or (get state :to) nil
                  :width 2
                  :arm-length 8
                  :on-change $ fn (from to d!)
                    d! cursor $ assoc (assoc state :from from) :to to
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'comp-buttons $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-buttons ()
            container
              {} $ :position $ [] 100 100
              comp-button $ {} (:text "|DEMO BUTTON")
                :position $ [] 100 0
                :on $ {} $ :pointertap
                  fn (e d!) (js/console.log |clicked e d!)
              comp-button $ {} (:text |Blue)
                :position $ [] 100 60
                :color $ hslx 0 80 70
                :fill $ hslx 200 80 40
              comp-button $ {} (:text "|Short hand pointertap")
                :position $ [] 100 120
                :on-pointertap $ fn (e d!) (println |clicked)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-container (store)
            ; println |Store store $ option:unwrap-or (get store :tab) nil
            let
                cursor $ []
                states $ decode-map-as
                  option:unwrap-or (get store :states) nil
                  :: 'Map 'Tag 'Dynamic
              group
                {} $ :position $ [] 0 0
                comp-tabs tabs
                  option:unwrap-or (get store :tab) nil
                  {} $ :position $ [] 10 10
                  fn (t d!) (d! :tab t)
                match
                  option:unwrap-or (get store :tab) nil
                  :drafts $ comp-drafts $ decode-map-as
                    option:unwrap-or (get store :x) nil
                    , Number
                  :grids $ comp-grids
                  :curves $ comp-curves
                  :gradients $ comp-gradients
                  :keyboard $ comp-keyboard
                    decode-map-as
                      option:unwrap-or (get store :keyboard-on?) nil
                      , Bool
                    option:unwrap-or (get store :counted) nil
                  :buttons $ comp-buttons
                  :slider $ comp-slider-demo $ >> states :slider
                  :points $ comp-points-demo $ >> states :points
                  :switch $ comp-switch-demo $ >> states :switch
                  :input $ comp-text-input $ >> states :input
                  :messages $ comp-messages-demo $ >> states :messages
                  :slider-point $ comp-slider-point-demo $ >> states :slider-point
                  :spin-slider $ comp-spin-slider-demo $ >> states :spin-slider
                  :arrows $ comp-arrows-demo $ >> states :arrows
                  :shadow $ comp-shadow-demo
                  :mesh $ comp-mesh-demo $ >> states :mesh
                  _ $ text $ {} (:text |Unknown)
                    :style $ {}
                      :fill $ hslx 0 100 80
                      :font-size 12
                      :font-family |Helvetica
                circle $ {}
                  :position $ [] 0 0
                  :radius 10
                  :fill 0xffffff
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'comp-curves $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-curves ()
            container ({})
              graphics $ {} $ :ops
                []
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'comp-gradients $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-gradients ()
            container ({})
              text $ {} (:text "|long long text")
                :position $ [] 120 160
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :v
              text $ {} (:text "|long long text")
                :position $ [] 120 200
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :h
              text $ {} (:text "|long long text")
                :position $ [] 120 120
                :style $ {} $ :fill (hslx 20 90 60)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'comp-grids $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-grids () (echo "|calculating grids")
            container ({})
              create-list :container
                {} $ :position $ [] 200 20
                -> (range 60) (mapcat grid-row)
                  map $ fn (pair)
                    let[] (x y) pair $ [] (str x |+ y)
                      rect $ {}
                        :position $ [] (* x 14) (* y 14)
                        :size $ [] 10 10
                        :fill $ hslx 200 80 80
                        :on $ {} $ :pointerover
                          fn (e d!) (println |hover: x y)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'comp-mesh-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-mesh-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ or
                  option:unwrap-or (get states :data) nil
                  {} (:x 0)
                    :base $ [] 109 129
                    :offset $ [] -123 -3
                    :zoom 0.26
              container ({})
                comp-button $ {} (:text |Tick)
                  :position $ [] 200 -40
                  :on-pointertap $ fn (e d!)
                    d! cursor $ update state :x inc
                container
                  {} $ :position $ [] 600 400
                  mesh $ {} (:scale 1)
                    :position $ [] 0 0
                    :geometry $ {}
                      :attributes $ []
                        {} (:id |aVertexPosition) (:size 2)
                          :buffer $ [] -400 -400 400 -400 400 400 -400 400
                        {} (:id |aUvs) (:size 2)
                          :buffer $ [] 0 0 1 0 1 1 0 1
                      :index $ [] 0 1 2 0 3 2
                    :shader $ {}
                      :vertex-source $ inline-file |demo.vert
                      :fragment-source $ inline-file |demo.frag
                    :draw-mode :triangles
                    :uniforms $ let
                        base $ decode-map-as
                          option:unwrap $ get state :base
                          :: 'List 'Number
                        offset $ decode-map-as
                          option:unwrap-or (get state :offset) ([] 0 0)
                          :: 'List 'Number
                      js-object (:uSampler2 sample-texture)
                        :time $ decode-map-as
                          option:unwrap $ get state :x
                          , Number
                        :baseX $ option:unwrap $ first base
                        :baseY $ option:unwrap $ last base
                        :zoom $ decode-map-as
                          option:unwrap $ get state :zoom
                          , Number
                        :offsetX $ option:unwrap-or (first offset) 0
                        :offsetY $ option:unwrap-or (last offset) 0
                    ; :on $ {} $ :pointertap
                      fn (e d!) (println |clicked)
                  comp-drag-point (>> states :base)
                    {} (:radius 6) (:hide-text? true)
                      :position $ option:unwrap-or (get state :base) nil
                      :fill $ hslx 200 100 50
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :base position
                  comp-drag-point (>> states :offset)
                    {} (:radius 6)
                      :fill $ hslx 0 100 50
                      :hide-text? true
                      :position $ option:unwrap-or (get state :offset) nil
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :offset position
                comp-slider-point (>> states :zoom)
                  {}
                    :value $ option:unwrap-or (get state :zoom) nil
                    :min 0.01
                    :position $ [] 300 -40
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :zoom value
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'comp-messages-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-messages-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {}
                    :messages $ []
                    :bottom? false
              container ({})
                comp-button $ {} (:text "|Add message")
                  :position $ [] 120 200
                  :on-pointertap $ fn (e d!)
                    d! cursor $ update state :messages $ fn (xs)
                      unsafe-coerce
                        conj
                          assert-type xs $ :: 'List 'Dynamic
                          let
                              id $ nanoid
                            {} (:id id)
                              :text $ str "|Messages of " id
                        , Dynamic
                comp-switch $ {}
                  :value $ option:unwrap-or (get state :bottom?) nil
                  :title "|At bottom"
                  :position $ [] 200 280
                  :on-change $ fn (e d!)
                    d! cursor $ update state :bottom? not
                comp-messages $ {}
                  :messages $ option:unwrap-or (get state :messages) nil
                  :bottom? $ option:unwrap-or (get state :bottom?) nil
                  :on-pointertap $ fn (message d!)
                    d! cursor $ update state :messages $ fn (xs)
                      unsafe-coerce
                        ->
                          assert-type xs $ :: 'List 'Dynamic
                          filter-not $ fn (x)
                            identical?
                              option:unwrap-or (get x :id) nil
                              option:unwrap-or (get message :id) nil
                        , Dynamic
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'comp-points-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-points-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {}
                    :p1 $ [] 0 0
                    :p2 $ [] 0 40
                    :p3 $ [] 0 80
                    :p4 $ [] 0 120
                    :p5 $ [] 0 160
              container
                {} $ :position $ [] 160 100
                comp-drag-point (>> states :p1)
                  {}
                    :position $ option:unwrap-or (get state :p1) nil
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p1 position
                comp-drag-point (>> states :p2)
                  {}
                    :position $ option:unwrap-or (get state :p2) nil
                    :unit 2
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p2 position
                comp-drag-point (>> states :p3)
                  {}
                    :position $ option:unwrap-or (get state :p3) nil
                    :unit 0.4
                    :radius 10
                    :fill $ hslx 0 90 60
                    :color $ hslx 0 0 50
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p3 position
                comp-drag-point (>> states :p4)
                  {}
                    :position $ option:unwrap-or (get state :p4) nil
                    :title |base
                    :alpha 0.6
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p4 position
                comp-drag-point (>> states :p5)
                  {}
                    :position $ option:unwrap-or (get state :p5) nil
                    :hide-text? true
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p5 position
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'comp-shadow-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-shadow-demo ()
            container
              {} $ :position $ canvas-center!
              text $ {} (:text |Shadows)
                :style $ {}
                  :fill $ hslx 200 100 50
                  :font-size 40
                  :font-family "|Josefin Sans"
                :filters $ [] $ [] DropShadowFilter
                  {}
                    :color $ hslx 10 90 100
                    :distance 2
                    :rotation 30
                    :alpha 1
                    :quality 4
                    :blur 6
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ []
            :features $ #{} :js-ffi
        'comp-switch-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-switch-demo (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} $ :value false
              container
                {} $ :position $ [] 120 300
                comp-switch $ {}
                  :value $ option:unwrap-or (get state :value) nil
                  :position $ [] 0 0
                  :on-change $ fn (value d!)
                    d! cursor $ assoc state :value value
                comp-switch $ {}
                  :value $ option:unwrap-or (get state :value) nil
                  :position $ [] 100 20
                  :title "|Custom title"
                  :on-change $ fn (value d!)
                    d! cursor $ assoc state :value value
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'comp-text-input $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-text-input (states)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:text "|initial text") (:long-text |long..)
              container ({})
                rect
                  {}
                    :position $ [] 140 110
                    :size $ [] 80 24
                    :fill $ hslx 0 0 20
                    :on $ {} $ :pointertap
                      fn (e d!)
                        request-text! e
                          {}
                            :initial $ option:unwrap-or (get state :text) nil
                            :style $ {} $ :color |blue
                          fn (result)
                            d! cursor $ assoc state :text result
                  text $ {}
                    :text $ option:unwrap-or (get state :text) nil
                    :position $ [] 6 4
                    :style $ {} (:font-size 14)
                      :fill $ hslx 0 0 80
                rect
                  {}
                    :position $ [] 140 180
                    :size $ [] 200 100
                    :fill $ hslx 0 0 20
                    :on $ {} $ :pointertap
                      fn (e d!)
                        request-text! e
                          {}
                            :initial $ option:unwrap-or (get state :long-text) nil
                            :style $ {} $ :font-family font-code
                            :textarea? true
                          fn (result)
                            d! cursor $ assoc state :long-text result
                  text $ {}
                    :text $ option:unwrap-or (get state :long-text) nil
                    :position $ [] 6 4
                    :style $ {} (:font-size 14)
                      :fill $ hslx 0 0 80
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'grid-row $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn grid-row (x)
            -> (range 40)
              map $ fn (y) ([] x y)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Number
            :return $ :: 'List $ :: 'List 'Number
        'inline-file $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro inline-file (name)
            read-file $ str |assets/ name
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{} :fs-read
            :expansion $ :: 'Expr 'String
            :required $ [] $ :: 'Expr 'String
        'load-sample-texture $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-sample-texture ()
            .!from PIXI/Texture |https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1a2af589827261.5e022908ed0b1.jpg
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
            :features $ #{} :js-ffi
            :return $ :: 'JsNullish 'JsObject
        'sample-texture $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sample-texture (load-sample-texture)
          :examples $ []
          :schema $ :: 'JsNullish 'JsObject
        'tabs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def tabs
            [] ([] :drafts |Drafts) ([] :grids |Grids) ([] :curves |Curves) ([] :gradients |Gradients) ([] :keyboard |Keyboard) ([] :slider |Slider) ([] :buttons |Buttons) ([] :points |Points) ([] :switch |Switch) ([] :input |Input) ([] :messages |Messages) ([] :slider-point "|Slider Point") ([] :spin-slider "|Spin Slider") ([] :arrows |Arrows) ([] :shadow |Shadow) ([] :mesh |Mesh)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.container
          :require
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
            |nanoid :refer $ nanoid
            phlox.util.styles :refer $ font-code
            phlox.comp.arrow :refer $ comp-arrow
            phlox.complex :refer $ polar-point
            phlox.util :refer $ canvas-center!
            |@pixi/filter-drop-shadow :refer $ DropShadowFilter
            |pixi.js :as PIXI
            phlox.comp.tabs :refer $ comp-tabs
    'phlox.app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store schema/store
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            when
              and dev? $ not=
                option:unwrap-or (nth op 0) :unknown
                , :states
              js/console.log |dispatch! op
            let
                op-id $ nanoid
                op-time $ phlox.core/ffi-number js/Date.now
              reset! *store $ updater @*store op op-id op-time
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            -> (new FontFaceObserver "|Josefin Sans") (phlox.core/ffi-load-font)
              phlox.core/ffi-then $ fn (event) (render-app!)
            add-watch! *store :change $ fn (store prev) (render-app!)
            render-app!
            when true (render-control!) (start-control-loop! 8 on-control-event)
            println "|App Started"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (js-nullish? build-errors)
              do (clear-phlox-caches!) (remove-watch! *store :change)
                add-watch! *store :change $ fn (store prev) (render-app!)
                render-app!
                when true $ replace-control-loop! 8 on-control-event
                hud! |ok~ |OK
              hud! |error build-errors
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render! (comp-container @*store) dispatch! $ {}
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.main
          :require (|pixi.js :as PIXI)
            phlox.core :refer $ render! clear-phlox-caches! on-control-event
            phlox.app.container :refer $ comp-container
            phlox.app.schema :as schema
            phlox.config :refer $ dev? mobile?
            |nanoid :refer $ nanoid
            phlox.app.updater :refer $ updater
            |fontfaceobserver-es :default FontFaceObserver
            |./calcit.build-errors :default build-errors
            |bottom-tip :default hud!
            touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
    'phlox.app.schema $ %{} 'FileEntry
      :defs $ {} $ 'store
        %{} 'CodeEntry (:doc |)
          :code $ quote $ def store
            {} (:tab :mesh) (:x 0) (:keyboard-on? false) (:counted 0)
              :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.schema
    'phlox.app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op op-id op-time)
            match op
              (:add-x)
                update store :x $ fn (x)
                  let
                      x0 $ assert-type x Number
                    if (> x0 10) 0 $ + x0 1
              (:tab t) (assoc store :tab t)
              (:toggle-keyboard)
                update store :keyboard-on? $ fn (x)
                  not $ assert-type x Bool
              (:counted)
                update store :counted $ fn (x)
                  inc $ assert-type x Number
              (:states cursor s) (update-states store cursor s)
              (:hydrate-storage d) d
              _ $ do (eprintln "|unknown op" op) store
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Dynamic 'String 'Number
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.updater
          :require $ [] phlox.cursor :refer $ [] update-states
    'phlox.check $ %{} 'FileEntry
      :defs $ {}
        'dev-check $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro dev-check (data rule) (quasiquote nil)
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Nil
            :required $ [] (:: 'Expr 'Dynamic) (:: 'Expr 'Dynamic)
        'dev-check-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro dev-check-message (message data rule) (quasiquote nil)
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{}
            :expansion $ :: 'Expr 'Nil
            :required $ [] (:: 'Expr 'Dynamic) (:: 'Expr 'Dynamic) (:: 'Expr 'Dynamic)
        'lilac-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-circle nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-color nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-container nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-event-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-event-map nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-graphics nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-line-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-line-segments nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-line-style nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-point nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-polyline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-polyline nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-rect nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-text nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-text-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-text-style nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.check
    'phlox.comp.arrow $ %{} 'FileEntry
      :defs $ {} $ 'comp-arrow
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-arrow (states props) (; dev-check props lilac-arrow)
            let
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                from $ decode-map-as
                  option:unwrap-or (get props :from) nil
                  :: 'List 'Number
                to $ decode-map-as
                  option:unwrap-or (get props :to) nil
                  :: 'List 'Number
                width $ either
                  option:unwrap-or (get props :width) nil
                  , 1
                arg-length $ decode-map-as
                  either
                    option:unwrap-or (get props :arm-length) nil
                    , 10
                  , Number
                on-change $ option:unwrap-or (get props :on-change) nil
                reversed-vec $ complex/minus from to
                reversed-unit $ complex/divide-by reversed-vec $ vec-length reversed-vec
                arm-left $ complex/times reversed-unit $ [] arg-length (negate arg-length)
                arm-right $ complex/times reversed-unit $ [] arg-length arg-length
              container
                {} $ :position $ [] 0 0
                comp-drag-point (>> states :from)
                  {} (:position from)
                    :fill $ hslx 200 80 20
                    :hide-text? true
                    :on-change $ fn (position d!)
                      if (fn? on-change) (on-change position to d!) (js/console.warn "|missing onchange for arrow")
                comp-drag-point (>> states :to)
                  {} (:position to) (:hide-text? true)
                    :fill $ hslx 200 80 20
                    :on-change $ fn (position d!)
                      if (fn? on-change) (on-change from position d!) (js/console.warn "|missing onchange for arrow")
                graphics $ {} $ :ops
                  []
                    g :line-style $ {} (:width width)
                      :color $ hslx 200 80 80
                      :alpha 1
                    g :move-to from
                    g :line-to to
                    g :line-to $ complex/add to arm-left
                    g :move-to to
                    g :line-to $ complex/add to arm-right
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.arrow
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list >>
            [] phlox.check :refer $ [] lilac-event-map dev-check
            phlox.complex :as complex
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.math :refer $ vec-length
    'phlox.comp.button $ %{} 'FileEntry
      :defs $ {}
        'comp-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-button (props) (dev-check props lilac-button)
            let
                button-text $ decode-map-as
                  either
                    option:unwrap-or (get props :text) nil
                    , |BUTTON
                  , String
                size $ decode-map-as
                  either
                    option:unwrap-or (get props :font-size) nil
                    , 14
                  , Number
                font-family $ decode-map-as
                  either
                    option:unwrap-or (get props :font-family) nil
                    , "|Josefin Sans, sans-serif"
                  , String
                fill $ either
                  option:unwrap-or (get props :fill) nil
                  hslx 0 0 20
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                position $ decode-map-as
                  option:unwrap-or (get props :position) ([] 0 0)
                  :: 'List 'Number
                width $ + 16 $ measure-text-width! button-text size font-family
                align-right? $ option:unwrap-or (get props :align-right?) nil
              container
                {} $ :position $ if align-right?
                  []
                    -
                      option:unwrap-or (first position) 0
                      , width
                    option:unwrap $ last position
                  , position
                rect $ {} (:fill fill)
                  :size $ [] width 32
                  :on $ cond
                      non-nil? $ option:unwrap-or (get props :on) nil
                      option:unwrap-or (get props :on) nil
                    (non-nil? (option:unwrap-or (get props :on-pointertap) nil))
                      {} $ :pointertap $ option:unwrap-or (get props :on-pointertap) nil
                    true nil
                text $ {} (:text button-text)
                  :position $ [] 8 8
                  :style $ {} (:fill color) (:font-size size) (:font-family font-family)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'lilac-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-button nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.button
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.util :refer $ measure-text-width!
            phlox.check :refer $ lilac-event-map dev-check
    'phlox.comp.drag-point $ %{} 'FileEntry
      :defs $ {}
        'comp-drag-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-drag-point (states props)
            dev-check
              option:unwrap-or (get states :cursor) nil
              , lilac-cursor
            dev-check props lilac-drag-point
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ assert-type
                  either
                    option:unwrap-or (get states :data) nil
                    {} (:dragging? false)
                      :x0 $ [] 0 0
                  :: 'Map 'Tag 'Dynamic
                unit $ decode-map-as
                  either
                    option:unwrap-or (get props :unit) nil
                    , 1
                  , Number
                radius $ decode-map-as
                  either
                    option:unwrap-or (get props :radius) nil
                    , 8
                  , Number
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                fill $ either
                  option:unwrap-or (get props :fill) nil
                  hslx 0 0 60
                alpha $ decode-map-as
                  either
                    option:unwrap-or (get props :alpha) nil
                    , 1
                  , Number
                on-change $ option:unwrap-or (get props :on-change)
                  fn (pos d!) nil
                hide-text? $ either
                  option:unwrap-or (get props :hide-text?) nil
                  , false
              let
                  position $ option:unwrap-or (get props :position) nil
                container
                  {} $ :position position
                  circle $ {} (:radius radius)
                    :position $ [] 0 0
                    :fill fill
                    :alpha alpha
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                            y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                          d! cursor $ merge state $ {} (:dragging? true)
                            :x0 $ [] x y
                            :p0 position
                      :globalpointermove $ fn (e d!)
                        when
                          option:unwrap-or (get state :dragging?) nil
                          let
                              x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                              y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                            let
                                x0 $ decode-map-as
                                  option:unwrap-or (get state :x0) nil
                                  :: 'List 'Number
                              on-change
                                complex/add
                                  decode-map-as
                                    option:unwrap-or (get state :p0) nil
                                    :: 'List 'Number
                                  []
                                    * unit $ - x $ option:unwrap-or (first x0) 0
                                    * unit $ - y $ option:unwrap-or (last x0) 0
                                , d!
                      :pointerup $ fn (e d!)
                        d! cursor $ assoc state :dragging? false
                      :pointerupoutside $ fn (e d!)
                        d! cursor $ assoc state :dragging? false
                  if-not hide-text? $ text $ {}
                    :text $ str "|("
                      .!toFixed
                        option:unwrap-or (first position) 0
                        , 1
                      , "|, "
                        .!toFixed
                          option:unwrap-or (last position) 0
                          , 1
                        , "|)➤" $ str unit
                    :alpha $ * alpha 0.3
                    :position $ [] -20 -16
                    :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "|Menlo, monospace")
                  if
                    and (not hide-text?)
                      non-nil? $ option:unwrap-or (get props :title) nil
                    text $ {}
                      :text $ option:unwrap-or (get props :title) nil
                      :alpha $ * alpha 0.3
                      :position $ [] -12 6
                      :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "|Menlo, monospace") (:align :center)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'lilac-cursor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-cursor nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-drag-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-drag-point nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.drag-point
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check
            phlox.complex :as complex
    'phlox.comp.messages $ %{} 'FileEntry
      :defs $ {}
        'comp-messages $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-messages (options) (dev-check options lilac-messages)
            let
                messages $ assert-type
                  option:unwrap-or (get options :messages) ([])
                  :: 'List 'Dynamic
                bottom? $ option:unwrap-or (get options :bottom?) nil
                base-position $ either
                  option:unwrap-or (get options :position) nil
                  if bottom?
                    []
                      -
                        * 0.5 $ phlox.core/ffi-number js/window.innerWidth
                        , 16
                      -
                        * 0.5 $ phlox.core/ffi-number js/window.innerHeight
                        , 16
                    []
                      -
                        * 0.5 $ phlox.core/ffi-number js/window.innerWidth
                        , 16
                      - 16 $ * 0.5 $ phlox.core/ffi-number js/window.innerWidth
                on-pointertap $ either
                  option:unwrap-or (get options :on-pointertap) nil
                  fn (x d!) (println "|missing message handler:" x)
              create-list :container
                {} $ :position base-position
                -> messages $ map-indexed $ fn (idx message)
                  []
                    option:unwrap-or (get message :id) nil
                    comp-button $ {}
                      :text $ option:unwrap-or (get message :text) nil
                      :position $ if bottom?
                        [] 0 $ - 8 $ * 40
                          - (count messages) idx
                        [] 0 $ * 40 idx
                      :color $ option:unwrap-or (get options :color) nil
                      :fill $ option:unwrap-or (get options :fill) nil
                      :align-right? true
                      :on-pointertap $ fn (e d!) (on-pointertap message d!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'lilac-message-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-message-list nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-messages $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-messages nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.messages
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check lilac-point
            phlox.comp.button :refer $ comp-button
    'phlox.comp.slider $ %{} 'FileEntry
      :defs $ {}
        '*prev-spin-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *prev-spin-point nil
          :examples $ []
          :schema $ :: 'Ref $ :: 'Optional (:: 'List 'Number)
        '*spin-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *spin-pivot ([] 0 0)
          :examples $ []
          :schema $ :: 'Ref $ :: 'List 'Number
        'comp-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider (states props)
            dev-check
              option:unwrap-or (get states :cursor) nil
              , lilac-cursor
            dev-check props lilac-slider
            let
                value $ decode-map-as
                  either
                    option:unwrap-or (get props :value) nil
                    , 1
                  , Number
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:v0 value) (:x0 0) (:dragging? false)
                title $ option:unwrap-or (get props :title) nil
                unit $ decode-map-as
                  either
                    option:unwrap-or (get props :unit) nil
                    , 0.1
                  , Number
                fill $ either
                  option:unwrap-or (get props :fill) nil
                  hslx 0 0 30
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                on-change $ option:unwrap-or (get props :on-change) nil
                rounded? $ option:unwrap-or (get props :round?) nil
              container
                {} $ :position $ option:unwrap-or (get props :position) nil
                rect
                  {}
                    :size $ [] 120 24
                    :fill fill
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x1 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                          d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                      :globalpointermove $ fn (e d!)
                        when
                          option:unwrap-or (get state :dragging?) nil
                          let
                              x2 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                            if (fn? on-change)
                              on-change
                                ->
                                  +
                                    decode-map-as
                                      option:unwrap-or (get state :v0) value
                                      , Number
                                    * unit $ - x2 $ decode-map-as
                                      option:unwrap-or (get state :x0) 0
                                      , Number
                                  (fn (v) (if rounded? (round v) v))
                                  (fn (v) (if (non-nil? (option:unwrap-or (get props :max) nil)) (&min (decode-map-as (option:unwrap-or (get props :max) v) Number) v) v))
                                  (fn (v) (if (non-nil? (option:unwrap-or (get props :min) nil)) (&max (decode-map-as (option:unwrap-or (get props :min) v) Number) v) v))
                                , d!
                              js/console.log "|[slider] missing :on-change listener"
                      :pointerup $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                      :pointerupoutside $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                  text $ {}
                    :text $ str "|◀ "
                      if (number? value)
                        .!toFixed value $ if rounded? 0 4
                        , |nil
                      , "| ▶"
                    :position $ [] 4 4
                    :style $ {} (:fill color) (:font-size 12) (:font-family "|Menlo, monospace")
                  text $ {}
                    :text $ str
                      if (string? title) (str title "| ") |
                      , "|◈ " unit
                    :position $ [] 0 -18
                    :style $ {}
                      :fill $ hslx 0 0 80
                      :font-size 13
                      :font-family "|Arial, sans-serif"
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'comp-slider-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-point (states props)
            dev-check
              option:unwrap-or (get states :cursor) nil
              , lilac-cursor
            dev-check props lilac-slider-point
            let
                value $ decode-map-as
                  either
                    option:unwrap-or (get props :value) nil
                    , 1
                  , Number
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} (:v0 value) (:x0 0) (:dragging? false)
                unit $ decode-map-as
                  either
                    option:unwrap-or (get props :unit) nil
                    , 0.1
                  , Number
                fill $ either
                  option:unwrap-or (get props :fill) nil
                  hslx 0 0 30
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                on-change $ option:unwrap-or (get props :on-change) nil
                rounded? $ option:unwrap-or (get props :round?) nil
              container
                {} $ :position $ option:unwrap-or (get props :position) nil
                rect
                  {}
                    :size $ [] 16 16
                    :fill fill
                    :radius 4
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x1 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                          d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                      :globalpointermove $ fn (e d!)
                        when
                          option:unwrap-or (get state :dragging?) nil
                          let
                              x2 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                            if (fn? on-change)
                              on-change
                                ->
                                  +
                                    decode-map-as
                                      option:unwrap-or (get state :v0) value
                                      , Number
                                    * unit $ - x2 $ decode-map-as
                                      option:unwrap-or (get state :x0) 0
                                      , Number
                                  (fn (v) (if rounded? (round v) v))
                                  (fn (v) (if (non-nil? (option:unwrap-or (get props :max) nil)) (&min (decode-map-as (option:unwrap-or (get props :max) v) Number) v) v))
                                  (fn (v) (if (non-nil? (option:unwrap-or (get props :min) nil)) (&max (decode-map-as (option:unwrap-or (get props :min) v) Number) v) v))
                                , d!
                              js/console.log "|[slider] missing :on-change listener"
                      :pointerup $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                      :pointerupoutside $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                  text $ {}
                    :text $ str $ if (number? value)
                      .!toFixed value $ if rounded? 0 4
                      , |nil
                    :position $ [] 20 3
                    :style $ {} (:fill color) (:font-size 10) (:font-family "|Menlo, monospace")
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'comp-spin-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-spin-slider (states props)
            let
                cursor $ option:unwrap-or (get states :cursor) nil
                state $ either
                  option:unwrap-or (get states :data) nil
                  {} $ :dragging? false
                unit $ decode-map-as
                  either
                    option:unwrap-or (get props :unit) nil
                    , 1
                  , Number
                radius $ decode-map-as
                  either
                    option:unwrap-or (get props :radius) nil
                    , 44
                  , Number
                color $ either
                  option:unwrap-or (get props :color) nil
                  hslx 0 0 100
                fill $ either
                  option:unwrap-or (get props :fill) nil
                  hslx 0 0 0
                font-size $ either
                  option:unwrap-or (get props :font-size) nil
                  &* radius 0.44
                alpha $ either
                  option:unwrap-or (get props :alpha) nil
                  , 1
                on-change $ option:unwrap-or (get props :on-change) nil
                position $ decode-map-as
                  either
                    option:unwrap-or (get props :position) nil
                    [] 0 0
                  :: 'List 'Number
                on-move $ option:unwrap-or (get props :on-move)
                  fn (pos d!) nil
                border-color $ or
                  option:unwrap-or (get props :border-color) nil
                  hslx 240 80 80
                border-width $ or
                  option:unwrap-or (get props :border-width) nil
                  , 4
              container
                {} $ :position $ [] 0 0
                circle $ {} (:radius radius) (:position position) (:fill fill) (:alpha alpha)
                  :line-style $ {} (:color border-color) (:width border-width) (:alpha 1)
                  :on $ {}
                    :pointerdown $ fn (e d!)
                      let
                          x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                          y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                        reset! *spin-pivot $ [] x y
                        reset! *prev-spin-point $ [] 0 0
                        d! cursor $ assoc state :dragging? true
                    :globalpointermove $ fn (e d!)
                      let
                          x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                          y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                        if
                          option:unwrap-or (get state :dragging?) nil
                          let
                              current-point $ []
                                - x $ option:unwrap-or (first @*spin-pivot) 0
                                - y $ option:unwrap-or (last @*spin-pivot) 0
                              prev-point @*prev-spin-point
                            if
                              < (vec-length current-point) (&* 0.5 radius)
                              reset! *prev-spin-point nil
                              do
                                if (non-nil? prev-point)
                                  let
                                      delta-vec $ rebase current-point prev-point
                                      delta $ phlox.core/ffi-atan2
                                        option:unwrap-or (last delta-vec) 0
                                        option:unwrap-or (first delta-vec) 0
                                    if (fn? on-change)
                                      on-change
                                        bound-x
                                          +
                                            decode-map-as
                                              option:unwrap-or (get props :value) 0
                                              , Number
                                            &* unit delta
                                          option:unwrap-or (get props :min) nil
                                          option:unwrap-or (get props :max) nil
                                        , d!
                                      js/console.warn "|missing :on-change for spin-slider"
                                reset! *prev-spin-point current-point
                    :pointerup $ fn (e d!) (reset! *prev-spin-point nil)
                      d! cursor $ assoc state :dragging? false
                    :pointerupoutside $ fn (e d!) (reset! *prev-spin-point nil)
                      d! cursor $ assoc state :dragging? false
                text $ {}
                  :text $ str $ let
                      v $ option:unwrap-or (get props :value) nil
                    if (number? v)
                      .!toFixed v $ either
                        option:unwrap-or (get props :fraction) nil
                        , 1
                      , |-
                  :position $ complex/add position $ [] 0 -10
                  :style $ {} (:fill color) (:font-size font-size) (:font-family "|Source code pro, Menlo, Roboto Mono, monospace")
                  :align :center
                container
                  {} $ :position $ [] -0 30
                  comp-drag-point (>> states :move)
                    {} (:position position) (:unit 1) (:radius 8)
                      :fill $ hslx 0 90 50
                      :hide-text? true
                      :alpha 0.5
                      :on-change $ fn (pos d!) (on-move pos d!)
                  if-let
                    label $ get props :label
                    text $ {} (:text label) (:alpha 0.8) (:align :center)
                      :position $ complex/add position $ [] 0 -20
                      :style $ {} (:fill color) (:font-size 13) (:font-family "|Josefin Sans, sans-serif")
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Dynamic
            :features $ #{} :js-ffi
        'lilac-cursor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-cursor nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-slider nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-slider-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-slider-point nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.slider
          :require
            phlox.core :refer $ g >> hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check
            phlox.math :refer $ vec-length bound-x
            phlox.complex :refer $ rebase
            phlox.complex :as complex
            phlox.comp.drag-point :refer $ comp-drag-point
    'phlox.comp.switch $ %{} 'FileEntry
      :defs $ {}
        'comp-switch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-switch (props) (dev-check props lilac-switch)
            let
                value $ option:unwrap-or (get props :value) nil
                on-change $ option:unwrap-or (get props :on-change) nil
              container
                {} $ :position $ either
                  option:unwrap-or (get props :position) nil
                  [] 0 0
                rect $ {}
                  :size $ [] 56 20
                  :fill $ if value (hslx 0 0 92) (hslx 0 0 50)
                  :position $ [] 0 0
                  :radius 3
                  :on $ {} $ :pointertap
                    fn (e d!)
                      when (fn? on-change)
                        on-change (not value) d!
                text $ {}
                  :text $ if value |On |Off
                  :position $ if value ([] 8 2) ([] 24 2)
                  :style $ {} (:font-size 14)
                    :fill $ if value (hslx 0 0 50) (hslx 0 0 100)
                    :font-family |Arial
                    :align :right
                    :font-weight 500
                  :alpha $ if value 1 0.4
                text $ {}
                  :text $ either
                    option:unwrap-or (get props :title) nil
                    , |Switch
                  :position $ [] 0 -20
                  :style $ {}
                    :fill $ hslx 0 0 80
                    :font-size 13
                    :font-family "|Arial, sans-serif"
                  :alpha 1
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'lilac-switch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-switch nil
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.switch
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check lilac-point
    'phlox.comp.tabs $ %{} 'FileEntry
      :defs $ {} $ 'comp-tabs
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-tabs (tabs selected options on-select)
            let
                step $ decode-map-as
                  or
                    option:unwrap-or (get options :step) nil
                    , 36
                  , Number
                position $ decode-map-as
                  or
                    option:unwrap-or (get options :position) nil
                    [] 0 0
                  :: 'List 'Number
                font-family $ or
                  option:unwrap-or (get options :font-family) nil
                  , "|Josefin Sans, sans-serif"
              create-list :container ({})
                -> tabs $ map-indexed $ fn (idx info)
                  let[] (tab title) info $ [] idx $ container
                    {} $ :position $ complex/add position
                      [] 0 $ * idx step
                    rect $ {}
                      :position $ [] 0 0
                      :size $ [] 100 30
                      :fill $ if (= selected tab) (hsluvx 180 50 50) (hsluvx 180 50 30)
                      :on $ {} $ :pointertap
                        fn (event d!) (on-select tab d!)
                    text $ {} (:text title)
                      :style $ {}
                        :fill $ hslx 200 90 100
                        :font-size 20
                        :font-family font-family
                      :position $ [] 10 2
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] (:: 'List 'Dynamic) 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.tabs
          :require
            phlox.core :refer $ g hslx hsluvx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check lilac-point
            phlox.complex :as complex
    'phlox.complex $ %{} 'FileEntry
      :defs $ {}
        'add $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn add (p1 p2)
            let[] (a b) p1 $ let[] (x y) p2 $ [] (+ a x) (+ b y)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) (:: 'List 'Number)
            :return $ :: 'List 'Number
        'conjugate $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn conjugate (pair) (update pair 1 negate)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'Number
            :return $ :: 'List 'Number
        'divide-by $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn divide-by (point x)
            []
              /
                option:unwrap-or (first point) 0
                , x
              /
                option:unwrap-or (last point) 0
                , x
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) 'Number
            :return $ :: 'List 'Number
        'minus $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn minus (v1 v2)
            let[] (a b) v1 $ let[] (x y) v2 $ [] (- a x) (- b y)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) (:: 'List 'Number)
            :return $ :: 'List 'Number
        'polar-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn polar-point (angle r)
            []
              * r $ phlox.core/ffi-cos angle
              * r $ phlox.core/ffi-sin angle
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Number 'Number
            :return $ :: 'List 'Number
        'rand-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-point (n & xs)
            let
                m0 $ option:unwrap-or (first xs) n
              []
                - n $ floor $ * (random) (* 2 n)
                - m0 $ floor $ * (random) (* 2 m0)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Number)
            :args $ [] 'Number
            :features $ #{} :js-ffi
            :return $ :: 'List 'Number
        'rebase $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rebase (value base) "|complex number division, renamed since naming collision"
            let[] (x y) value $ let[] (a b) base $ let
                inverted $ / 1 $ + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) (:: 'List 'Number)
            :return $ :: 'List 'Number
        'scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn scale (pair v)
            map pair $ fn (x) (* v x)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) 'Number
            :return $ :: 'List 'Number
        'times $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn times (v1 v2)
            let[] (a b) v1 $ let[] (x y) v2 $ []
              - (* a x) (* b y)
              + (* a y) (* b x)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) (:: 'List 'Number)
            :return $ :: 'List 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.complex
          :require $ js-ffi.browser :refer $ random
    'phlox.config $ %{} 'FileEntry
      :defs $ {}
        'MobileDetectHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait MobileDetectHost
            .mobile $ :: 'Fn $ {}
              :args $ [] 'MobileDetectHost
              :return $ :: 'JsNullish 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'detect-mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn detect-mobile? ()
            js-present? $ .!mobile $ unsafe-coerce (new mobile-detect js/window.navigator.userAgent) MobileDetectHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ []
            :features $ #{} :js-ffi
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $ option:unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Dynamic
        'mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mobile? (detect-mobile?)
          :examples $ []
          :schema $ :: 'Bool
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.config
          :require $ |mobile-detect :default mobile-detect
    'phlox.core $ %{} 'FileEntry
      :defs $ {}
        '*app $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *app nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*dispatch-fn $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *dispatch-fn
            fn (& args) nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*drag-moving-cache $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *drag-moving-cache nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*events-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *events-element nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*renderer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *renderer nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*stage-config $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *stage-config
            {}
              :move $ [] 0 0
              :scale 1
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '*tree-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *tree-element nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        '>> $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn >> (states k)
            let
                parent-cursor $ option:unwrap-or (get states :cursor) ([])
                branch $ assert-type
                  let
                      value $ option:unwrap-or (get states k) ({})
                    if (map? value) value $ raise |expected-child-state-map
                  :: 'Map 'Tag 'Dynamic
              assoc branch :cursor $ conj
                assert-type parent-cursor $ :: 'List 'Dynamic
                , k
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag
            :return $ :: 'Map 'Tag 'Dynamic
          :tests $ []
            %{} 'TestEntry (:name |missing-branch)
              :code $ quote $ assert= ([] :root :child)
                option:unwrap $ get
                  >>
                    {} $ :cursor $ [] :root
                    , :child
                  , :cursor
            %{} 'TestEntry (:name |existing-branch)
              :code $ quote $ let
                  child $ >>
                    {}
                      :cursor $ [] :root
                      :child $ {} $ :value 7
                    , :child
                assert= 7 $ option:unwrap $ get child :value
                assert= ([] :root :child)
                  option:unwrap $ get child :cursor
            %{} 'TestEntry (:name |rejects-non-map-branch)
              :code $ quote $ assert= true
                try
                  >>
                    {} $ :child 7
                    , :child
                  fn (e) true
        'AppendableHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait AppendableHost
            .appendChild $ :: 'Fn $ {}
              :args $ [] 'AppendableHost 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'CanvasContextHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait CanvasContextHost (:font 'String)
            .measureText $ :: 'Fn $ {}
              :args $ [] 'CanvasContextHost 'String
              :return 'JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'CanvasHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait CanvasHost
            .getContext $ :: 'Fn $ {}
              :args $ [] 'CanvasHost 'String
              :return 'JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ColorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ColorHost
            .toNumber $ :: 'Fn $ {}
              :args $ [] 'ColorHost
              :return 'Number
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'DestroyableHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DestroyableHost
            .destroy $ :: 'Fn $ {}
              :args $ [] 'DestroyableHost
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'DocumentHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DocumentHost (:body 'JsObject)
            .createElement $ :: 'Fn $ {}
              :args $ [] 'DocumentHost 'String
              :return 'JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'DomEventHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DomEventHost (:clientX 'Number) (:clientY 'Number) (:data 'JsObject) (:deltaY 'Number) (:key 'String) (:keyCode 'Number) (:ctrlKey 'Bool) (:metaKey 'Bool) (:shiftKey 'Bool)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'EventTargetHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait EventTargetHost
            .addEventListener $ :: 'Fn $ {}
              :args $ [] 'EventTargetHost 'String $ :: 'Fn
                {}
                  :args $ [] 'Dynamic
                  :return 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'EventTargetWithOptionsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait EventTargetWithOptionsHost
            .addEventListener $ :: 'Fn $ {}
              :args $ [] 'EventTargetWithOptionsHost 'String
                :: 'Fn $ {}
                  :args $ [] 'Dynamic
                  :return 'Dynamic
                , 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'FontFaceObserverHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait FontFaceObserverHost
            .load $ :: 'Fn $ {}
              :args $ [] 'FontFaceObserverHost
              :return 'Dynamic
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'HsluvHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait HsluvHost (:hsluv_h 'Number) (:hsluv_s 'Number) (:hsluv_l 'Number) (:rgb_r 'Number) (:rgb_g 'Number) (:rgb_b 'Number)
            .hsluvToRgb $ :: 'Fn $ {}
              :args $ [] 'HsluvHost
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'JsArrayHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait JsArrayHost
            .push $ :: 'Fn $ {}
              :args $ [] 'JsArrayHost 'Dynamic
              :return 'Number
            .forEach $ :: 'Fn $ {}
              :args $ [] 'JsArrayHost $ :: 'Fn
                {}
                  :args $ [] 'Dynamic
                  :return 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'JsEntryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait JsEntryHost (:0 'String) (:1 'Dynamic)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiAnchorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiAnchorHost
            .set $ :: 'Fn $ {}
              :args $ [] 'PixiAnchorHost 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiAppHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiAppHost (:renderer 'JsObject) (:stage 'JsObject) (:ticker 'JsObject) (:view 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiContainerHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiContainerHost
            .addChild $ :: 'Fn $ {}
              :args $ [] 'PixiContainerHost 'Dynamic
              :return 'Unit
            .addChildAt $ :: 'Fn $ {}
              :args $ [] 'PixiContainerHost 'Dynamic 'Number
              :return 'Unit
            .getChildAt $ :: 'Fn $ {}
              :args $ [] 'PixiContainerHost 'Number
              :return 'JsObject
            .removeChildAt $ :: 'Fn $ {}
              :args $ [] 'PixiContainerHost 'Number
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiDisplayHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiDisplayHost (:anchor 'JsObject) (:pivot 'JsObject) (:position 'JsObject) (:scale 'JsObject) (:shader 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiEventDataHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiEventDataHost (:global 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiGeometryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiGeometryHost
            .addAttribute $ :: 'Fn $ {}
              :args $ [] 'PixiGeometryHost 'Dynamic 'Dynamic 'Dynamic
              :return 'Unit
            .addIndex $ :: 'Fn $ {}
              :args $ [] 'PixiGeometryHost 'Dynamic
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiPluginsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiPluginsHost (:accessibility 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiRendererHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiRendererHost (:plugins 'JsObject)
            .render $ :: 'Fn $ {}
              :args $ [] 'PixiRendererHost 'Dynamic
              :return 'Unit
            .resize $ :: 'Fn $ {}
              :args $ [] 'PixiRendererHost 'Number 'Number
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiScaleHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiScaleHost
            .set $ :: 'Fn $ {}
              :args $ [] 'PixiScaleHost 'Number 'Number
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiShaderHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiShaderHost (:uniforms 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiTickerHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiTickerHost
            .stop $ :: 'Fn $ {}
              :args $ [] 'PixiTickerHost
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PixiVectorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiVectorHost (:x 'Number) (:y 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'PromiseHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PromiseHost
            .then $ :: 'Fn $ {}
              :args $ [] 'PromiseHost $ :: 'Fn
                {}
                  :args $ [] 'Dynamic
                  :return 'Dynamic
              :return 'Dynamic
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'TextMetricsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait TextMetricsHost (:width 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn circle (props & children) (dev-check props lilac-circle) (create-element :circle props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'clear-phlox-caches! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn clear-phlox-caches! () &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn container (props & children) (dev-check props lilac-container) (create-element :container props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'create-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-element (tag props children)
            %{} schema/PhloxElement (:name tag) (:props props)
              :children $ remove-nil-values $ index-items children
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Tag 'Dynamic $ :: 'List 'Dynamic
        'create-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-list (tag props children)
            %{} schema/PhloxElement (:name tag) (:props props)
              :children $ remove-nil-values $ decode-map-as children
                :: 'List $ :: 'List 'Dynamic
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Tag 'Dynamic $ :: 'List 'Dynamic
        'defcomp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro defcomp (name params & body)
            quasiquote $ defn ~name ~params ~@body
          :examples $ []
          :schema $ :: 'Macro $ {} (:rest 'Syntax)
            :capabilities $ #{}
            :expansion $ :: 'Definition 'Fn
            :required $ [] 'SyntaxSymbol 'SyntaxList
        'ffi-abs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-abs (value)
            unsafe-coerce (js/Math.abs value) Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
            :features $ #{} :js-ffi
        'ffi-accessibility $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-accessibility (plugins)
            unsafe-coerce
              .-accessibility $ unsafe-coerce plugins PixiPluginsHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-add-child $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-child (parent child)
            do
              .!addChild (unsafe-coerce parent PixiContainerHost) child
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-add-event-listener $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-event-listener (target event callback)
            do
              .!addEventListener (unsafe-coerce target EventTargetHost) event callback
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'String $ :: 'Fn
              {} (:return 'Dynamic)
                :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-add-event-listener-options $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-event-listener-options (target event callback options)
            do
              .!addEventListener (unsafe-coerce target EventTargetWithOptionsHost) event callback options
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'String
              :: 'Fn $ {} (:return 'Dynamic)
                :args $ [] 'Dynamic
              , 'Dynamic
            :features $ #{} :js-ffi
        'ffi-anchor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-anchor (target)
            unsafe-coerce
              .-anchor $ unsafe-coerce target PixiDisplayHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-append-child $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-append-child (parent child)
            do
              .!appendChild (unsafe-coerce parent AppendableHost) child
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-atan2 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-atan2 (y x)
            unsafe-coerce (js/Math.atan2 y x) Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
            :features $ #{} :js-ffi
        'ffi-bool $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-bool (value) (unsafe-coerce value Bool)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-cos $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-cos (value)
            unsafe-coerce (js/Math.cos value) Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
            :features $ #{} :js-ffi
        'ffi-create-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-create-element (document tag)
            unsafe-coerce
              .!createElement (unsafe-coerce document DocumentHost) tag
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic 'String
            :features $ #{} :js-ffi
        'ffi-destroy $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-destroy (target)
            do
              .!destroy $ unsafe-coerce target DestroyableHost
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-document-body $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-document-body (document)
            unsafe-coerce
              .-body $ unsafe-coerce document DocumentHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-entry-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-entry-key (entry)
            .-0 $ unsafe-coerce entry JsEntryHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-entry-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-entry-value (entry)
            .-1 $ unsafe-coerce entry JsEntryHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-client-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-client-x (event)
            .-clientX $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-client-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-client-y (event)
            .-clientY $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-ctrl? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-ctrl? (event)
            .-ctrlKey $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-data $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-data (event)
            unsafe-coerce
              .-data $ unsafe-coerce event DomEventHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-delta-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-delta-y (event)
            unsafe-coerce
              .-deltaY $ unsafe-coerce event DomEventHost
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-key (event)
            .-key $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-key-code $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-key-code (event)
            .-keyCode $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-meta? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-meta? (event)
            .-metaKey $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-event-shift? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-shift? (event)
            .-shiftKey $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-for-each $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-for-each (items callback)
            do
              .!forEach (unsafe-coerce items JsArrayHost) callback
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic $ :: 'Fn
              {} (:return 'Dynamic)
                :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-geometry-add-attribute! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-geometry-add-attribute! (target id buffer size)
            do
              .!addAttribute (unsafe-coerce target PixiGeometryHost) id buffer size
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-geometry-add-index! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-geometry-add-index! (target index)
            do
              .!addIndex (unsafe-coerce target PixiGeometryHost) index
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-get-context $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-get-context (element kind)
            unsafe-coerce
              .!getContext (unsafe-coerce element CanvasHost) kind
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic 'String
            :features $ #{} :js-ffi
        'ffi-global $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-global (data)
            unsafe-coerce
              .-global $ unsafe-coerce data PixiEventDataHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-load-font $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-load-font (font)
            .!load $ unsafe-coerce font FontFaceObserverHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-measure-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-measure-text (context text)
            unsafe-coerce
              .!measureText (unsafe-coerce context CanvasContextHost) text
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic 'String
            :features $ #{} :js-ffi
        'ffi-nullish? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-nullish? (value)
            nil? $ unsafe-coerce value Dynamic
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-number (value) (unsafe-coerce value Number)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-object-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-object-x (value)
            .-x $ unsafe-coerce value PixiVectorHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-object-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-object-y (value)
            .-y $ unsafe-coerce value PixiVectorHost
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-pivot (target)
            unsafe-coerce
              .-pivot $ unsafe-coerce target PixiDisplayHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-plugins $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-plugins (renderer)
            unsafe-coerce
              .-plugins $ unsafe-coerce renderer PixiRendererHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-position (target)
            unsafe-coerce
              .-position $ unsafe-coerce target PixiDisplayHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-push-array! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-push-array! (xs x)
            unsafe-coerce
              .!push (unsafe-coerce xs JsArrayHost) x
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-random $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-random ()
            unsafe-coerce (js/Math.random) Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'ffi-render $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-render (renderer stage)
            do
              .!render (unsafe-coerce renderer PixiRendererHost) stage
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-renderer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-renderer (app)
            unsafe-coerce
              .-renderer $ unsafe-coerce app PixiAppHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-resize $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-resize (renderer width height)
            do
              .!resize (unsafe-coerce renderer PixiRendererHost) width height
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Number 'Number
            :features $ #{} :js-ffi
        'ffi-scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-scale (target)
            unsafe-coerce
              .-scale $ unsafe-coerce target PixiDisplayHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-set-anchor! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-anchor! (anchor value)
            do
              .!set (unsafe-coerce anchor PixiAnchorHost) value
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-set-font! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-font! (context font)
            set!
              .-font $ unsafe-coerce context CanvasContextHost
              , font
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'String
            :features $ #{} :js-ffi
        'ffi-set-scale! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-scale! (target x y)
            do
              .!set (unsafe-coerce target PixiScaleHost) x y
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Number 'Number
            :features $ #{} :js-ffi
        'ffi-set-x! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-x! (target value)
            set!
              .-x $ unsafe-coerce target PixiVectorHost
              , value
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Number
            :features $ #{} :js-ffi
        'ffi-set-y! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-y! (target value)
            set!
              .-y $ unsafe-coerce target PixiVectorHost
              , value
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Number
            :features $ #{} :js-ffi
        'ffi-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-shader (target)
            unsafe-coerce
              .-shader $ unsafe-coerce target PixiDisplayHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-sin $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-sin (value)
            unsafe-coerce (js/Math.sin value) Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
            :features $ #{} :js-ffi
        'ffi-stage $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-stage (app)
            unsafe-coerce
              .-stage $ unsafe-coerce app PixiAppHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-stop $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-stop (target)
            do
              .!stop $ unsafe-coerce target PixiTickerHost
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-text-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-text-width (metrics)
            unsafe-coerce
              .-width $ unsafe-coerce metrics TextMetricsHost
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-then $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-then (promise callback)
            .!then (unsafe-coerce promise PromiseHost) callback
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic $ :: 'Fn
              {} (:return 'Dynamic)
                :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-ticker $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-ticker (app)
            unsafe-coerce
              .-ticker $ unsafe-coerce app PixiAppHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-uniforms $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-uniforms (shader)
            unsafe-coerce
              .-uniforms $ unsafe-coerce shader PixiShaderHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-view $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-view (app)
            unsafe-coerce
              .-view $ unsafe-coerce app PixiAppHost
              , JsObject
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'ffi-window-height $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-window-height ()
            let
                viewport $ browser/viewport
              viewport :height
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'ffi-window-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-window-width ()
            let
                viewport $ browser/viewport
              viewport :width
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'g $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn g (op & args)
            let
                data $ option:unwrap-or (first args) nil
              match op
                :move-to $ dev-check-message "|check :move-to" data lilac-point
                :line-to $ dev-check-message "|check :line-to" data lilac-point
                :line-style $ dev-check-message "|check :line-style" data lilac-line-style
                :begin-fill $ dev-check-message "|check :fill" data lilac-begin-fill
                :end-fill nil
                :close-path nil
                :arc $ dev-check-message "|check :arc" data lilac-arc
                :arc-to $ dev-check-message "|check :arc-to" data lilac-arc-to
                :bezier-to $ dev-check-message "|check :bezier-to" data lilac-bezier-to
                :quadratic-to $ dev-check-message "|check :quadratic-to" data lilac-quadratic-to
                :begin-hole nil
                :end-hole nil
                _ $ js/console.warn "|not supported:" op
              [] op data
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic)
            :args $ [] 'Tag
            :features $ #{} :js-ffi
            :return $ :: 'List 'Dynamic
        'graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn graphics (props & children) (dev-check props lilac-graphics) (create-element :graphics props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'group $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn group (props & children) (dev-check props lilac-container)
            noted "|which is an alias of container" $ create-element :container props children
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'handle-drag-moving $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-drag-moving (el)
            ffi-add-event-listener el |mousedown $ fn (event)
              reset! *drag-moving-cache $ [] (ffi-event-client-x event) (ffi-event-client-y event)
            ffi-add-event-listener el |mouseup $ fn (event) (reset! *drag-moving-cache nil)
            ffi-add-event-listener el |mousemove $ fn (event)
              if
                and
                  or (ffi-event-meta? event) (ffi-event-ctrl? event) (ffi-event-shift? event)
                  non-nil? @*drag-moving-cache
                let
                    prev @*drag-moving-cache
                    current $ [] (ffi-event-client-x event) (ffi-event-client-y event)
                    delta $ complex/minus current prev
                  reset! *drag-moving-cache current
                  swap! *stage-config update :move $ fn (prev)
                    unsafe-coerce
                      complex/add
                        assert-type prev $ :: 'List 'Number
                        , delta
                      , Dynamic
                  render-stage-for-viewer!
            ffi-add-event-listener-options el |wheel
              fn (event)
                if
                  or (ffi-event-meta? event) (ffi-event-ctrl? event) (ffi-event-shift? event)
                  let
                      dy $ * 0.001 $ ffi-event-delta-y event
                      scale $ option:unwrap-or (get @*stage-config :scale) 1
                      pointer $ complex/minus
                        [] (ffi-event-client-x event) (ffi-event-client-y event)
                        []
                          * 0.5 $ ffi-number js/window.innerWidth
                          * 0.5 $ ffi-number js/window.innerHeight
                    when
                      not $ or
                        and (<= scale 0.1)
                          < (ffi-event-delta-y event) 0
                        and (>= scale 4)
                          > (ffi-event-delta-y event) 0
                      swap! *stage-config update :move $ fn (pos)
                        unsafe-coerce
                          let
                              pos0 $ assert-type pos $ :: 'List 'Number
                              shift $ complex/minus pointer pos0
                            complex/minus pos0 $ complex/times shift $ [] (/ dy scale) 0
                          , Dynamic
                      swap! *stage-config update :scale $ fn (x)
                        unsafe-coerce
                          + (assert-type x Number) dy
                          , Dynamic
                      render-stage-for-viewer!
              js-object $ :passive true
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'hclx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hclx (h c l)
            unsafe-coerce
              .!toNumber $ unsafe-coerce
                new Color $ hcl-to-hex h c l
                , ColorHost
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'hsluvx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hsluvx (h c l)
            let
                conv $ unsafe-coerce (new Hsluv) HsluvHost
              set! (.-hsluv_h conv) h
              set! (.-hsluv_s conv) c
              set! (.-hsluv_l conv) l
              do (.!hsluvToRgb conv)
                unsafe-coerce
                  .!toNumber $ unsafe-coerce
                    new Color $ js-array (.-rgb_r conv) (.-rgb_g conv) (.-rgb_b conv)
                    , ColorHost
                  , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'hslx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hslx (h s l)
            unsafe-coerce
              .!toNumber $ unsafe-coerce
                new Color $ js-object (:h h) (:s s) (:l l) (:a 1)
                , ColorHost
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number 'Number
            :features $ #{} :js-ffi
        'image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn image (props & children) (dev-check props lilac-image) (create-element :image props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'init-pixi-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-pixi-app! (options)
            let
                pixi-app $ new PIXI/Application $ js-object (:antialias true) (:autoDensity true) (:autoStart false) (:resolution 2)
                  :width $ ffi-window-width
                  :height $ ffi-window-height
                  :backgroundColor $ either
                    option:unwrap-or (get options :background-color) nil
                    hslx 0 0 0
                  :interactive $ either
                    option:unwrap-or (get options :interactive) nil
                    , true
                  :backgroundAlpha $ either
                    option:unwrap-or (get options :background-alpha) nil
                    , 1
              ffi-stop $ ffi-ticker pixi-app
              -> PIXI/Ticker .-shared $ ffi-stop
              -> PIXI/Ticker .-system $ ffi-stop
              reset! *app pixi-app
              let
                  el $ ffi-view pixi-app
                -> js/document ffi-document-body $ ffi-append-child el
                handle-drag-moving el
              -> pixi-app ffi-renderer ffi-plugins ffi-accessibility $ ffi-destroy
              ffi-add-event-listener js/window |resize $ fn (event)
                -> pixi-app ffi-renderer $ ffi-resize (ffi-window-width) (ffi-window-height)
                render-stage-for-viewer!
              , pixi-app
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'lilac-arc $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-arc nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-arc-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-arc-to nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-begin-fill $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-begin-fill nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-bezier-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-bezier-to nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-image nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-mesh nil
          :examples $ []
          :schema $ :: 'Dynamic
        'lilac-quadratic-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-quadratic-to nil
          :examples $ []
          :schema $ :: 'Dynamic
        'line-segment->ops $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn line-segment->ops (pair)
            let
                pair0 $ assert-type pair $ :: 'List 'Dynamic
              []
                g :move-to $ option:unwrap $ nth pair0 0
                g :line-to $ option:unwrap $ nth pair0 1
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
            :return $ :: 'List 'Dynamic
        'line-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn line-segments (props & children) (dev-check props lilac-line-segments)
            let
                line-style $ option:unwrap-or (get props :style) nil
                segments $ option:unwrap-or (get props :segments) ([])
              create-element :graphics
                assoc props :ops $ concat
                  assert-type
                    [] $ g :line-style line-style
                    :: 'List 'Dynamic
                  assert-type
                    ->
                      assert-type segments $ :: 'List 'Dynamic
                      mapcat line-segment->ops
                    :: 'List 'Dynamic
                , children
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mesh (props & children) (dev-check props lilac-mesh) (create-element :mesh props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'mount-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mount-app! (app dispatch!)
            let
                element-tree $ render-element app dispatch!
              ffi-add-child (ffi-stage @*app) element-tree
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
        'on-control-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-control-event (elapsed states delta)
            if (:left-b? states) (reset-stage-config!)
              let
                  move $ :left-move states
                  scales $ :right-move delta
                update-stage-config!
                  map move $ fn (x)
                    * x (ffi-abs x) 0.02
                  option:unwrap-or (nth scales 1) 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Number 'touch-control.core/ControlState 'touch-control.core/ControlDelta
            :features $ #{} :js-ffi
        'polyline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn polyline (props & children) (dev-check props lilac-polyline)
            let
                line-style $ option:unwrap-or (get props :style) nil
                points $ option:unwrap-or (get props :points) ([])
              create-element :graphics
                assoc props :ops $ concat
                  [] (g :line-style line-style)
                    g :move-to $ option:unwrap $ nth points 0
                  ->
                    assert-type points $ :: 'List 'Dynamic
                    rest
                    map $ fn (p) (g :line-to p)
                , children
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rect (props & children) (dev-check props lilac-rect) (create-element :rect props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'render! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render! (expanded-app dispatch! options)
            when
              ffi-nullish? $ unsafe-coerce @*app Dynamic
              init-pixi-app! options
              aset js/window |_phloxTree @*app
            reset! *dispatch-fn dispatch!
            let
                wrap-dispatch $ fn (op & args)
                  let
                      data $ option:unwrap-or (first args) nil
                    if (list? op)
                      @*dispatch-fn $ :: :states op data
                      if (tag? op)
                        @*dispatch-fn $ :: op data
                        @*dispatch-fn op
              ; js/console.log |render! expanded-app
              if
                ffi-nullish? $ unsafe-coerce @*tree-element Dynamic
                do (mount-app! expanded-app wrap-dispatch) (handle-keyboard-events *tree-element wrap-dispatch)
                rerender-app! expanded-app wrap-dispatch options
              reset! *tree-element expanded-app
            render-stage-for-viewer!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'render-stage-for-viewer! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-stage-for-viewer! ()
            let
                scale $ option:unwrap-or (get @*stage-config :scale) nil
                move $ option:unwrap-or (get @*stage-config :move) nil
              ffi-set-x!
                ffi-position $ ffi-stage @*app
                +
                  * 0.5 $ ffi-number js/window.innerWidth
                  option:unwrap-or (nth move 0) 0
              ffi-set-y!
                ffi-position $ ffi-stage @*app
                +
                  * 0.5 $ ffi-number js/window.innerHeight
                  option:unwrap-or (nth move 1) 0
              -> @*app ffi-stage ffi-scale $ ffi-set-scale! scale scale
            -> @*app ffi-renderer $ ffi-render $ ffi-stage @*app
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'rerender-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rerender-app! (app dispatch! options) (; js/console.log "|rerender tree" app @*tree-element)
            update-children
              [] $ [] 0 app
              [] $ [] 0 @*tree-element
              ffi-stage @*app
              , dispatch! options
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'reset-stage-config! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reset-stage-config! ()
            let
                move0 $ option:unwrap-or (get @*stage-config :move) nil
                scale0 $ option:unwrap-or (get @*stage-config :scale) 1
              when
                or
                  not= ([] 0 0) move0
                  not= 1 scale0
                if
                  not= ([] 0 0) move0
                  swap! *stage-config update :move $ fn (prev)
                    unsafe-coerce
                      let
                          prev0 $ assert-type prev $ :: 'List 'Number
                          l $ vec-length prev0
                        if (< l 4) ([] 0 0)
                          &let
                            move-back $ complex/times prev0 $ [] (&/ -4 l) 0
                            complex/add prev0 move-back
                      , Dynamic
                if (not= scale0 1)
                  swap! *stage-config update :scale $ fn (prev)
                    unsafe-coerce
                      let
                          delta $ - scale0 1
                          prev0 $ assert-type prev Number
                        if
                          > 0.01 $ ffi-abs delta
                          , 1 $ + prev0 $ if (> delta 0) -0.01 0.01
                      , Dynamic
                render-stage-for-viewer!
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn text (props & children) (dev-check props lilac-text) (create-element :text props children)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Dynamic)
            :args $ [] 'Dynamic
        'update-stage-config! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-stage-config! (move scale-change)
            let
                scale0 $ option:unwrap-or (get @*stage-config :scale) 1
              when
                and
                  or
                    not= ([] 0 0) move
                    not= 0 scale-change
                  not $ and (> scale-change 0) (>= scale0 8)
                swap! *stage-config update :move $ fn (prev)
                  unsafe-coerce
                    let
                        prev0 $ assert-type prev $ :: 'List 'Number
                      complex/add
                        complex/minus prev0 $ complex/scale (complex/conjugate move) 0.05
                        complex/scale prev0 $ / (* 0.01 scale-change) scale0
                    , Dynamic
                swap! *stage-config update :scale $ fn (prev)
                  unsafe-coerce
                    let
                        prev0 $ assert-type prev Number
                        next $ &+ prev0 $ * 0.01 scale-change
                      &max 0.2 $ &min next 8
                    , Dynamic
                render-stage-for-viewer!
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] (:: 'List 'Number) 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.core
          :require (|pixi.js :as PIXI) (phlox.schema :as schema)
            phlox.render :refer $ render-element update-element update-children
            phlox.util :refer $ index-items remove-nil-values detect-func-in-map?
            |@quamolit/phlox-utils :refer $ hcl-to-hex
            phlox.check :refer $ dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-point lilac-circle dev-check-message lilac-line-style lilac-polyline lilac-line-segments lilac-event-map
            phlox.keyboard :refer $ handle-keyboard-events
            phlox.complex :as complex
            phlox.math :refer $ vec-length
            |hsluv :refer $ Hsluv
            |pixi.js :refer $ Color
            js-ffi.browser :as browser
    'phlox.cursor $ %{} 'FileEntry
      :defs $ {} $ 'update-states
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-states (store cursor data)
            assoc-in store
              concat ([] :states)
                assert-type cursor $ :: 'List 'Dynamic
                [] :data
              , data
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'List 'Dynamic) 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.cursor
    'phlox.input $ %{} 'FileEntry
      :defs $ {}
        'lilac-input $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-input nil
          :examples $ []
          :schema $ :: 'Dynamic
        'request-text! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-text! (e options cb) (dev-check options lilac-input)
            prompt-at!
              [] (-> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x) (-> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y)
              decode-map-as options $ :: 'Map 'Tag 'Dynamic
              , cb
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.input
          :require
            phlox.check :refer $ dev-check
            pointed-prompt.core :refer $ prompt-at!
    'phlox.keyboard $ %{} 'FileEntry
      :defs $ {}
        'get-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-value (*x) @*x
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] $ :: 'Ref 'Dynamic
        'handle-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-event (kind tree event dispatch!)
            when (non-nil? tree)
              if (element? tree)
                do
                  let
                      listener $ option:unwrap-or
                        get-in tree $ [] :props :on-keyboard kind
                        , nil
                    when (fn? listener) (listener event dispatch!)
                  ->
                    decode-map-as
                      option:unwrap-or (get tree :children) ([])
                      :: 'List $ :: 'List 'Dynamic
                    map $ fn (pair)
                      let[] (k child) pair $ handle-event kind child event dispatch!
                do $ js/console.log "|unknown tree for handling event:" tree
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Tag 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'handle-keyboard-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-keyboard-events (*tree-element dispatch!)
            phlox.core/ffi-add-event-listener js/window |keydown $ fn (event)
              handle-event :down (get-value *tree-element) (wrap-event event) dispatch!
            phlox.core/ffi-add-event-listener js/window |keyup $ fn (event)
              handle-event :up (get-value *tree-element) (wrap-event event) dispatch!
            phlox.core/ffi-add-event-listener js/window |keypress $ fn (event)
              handle-event :press (get-value *tree-element) (wrap-event event) dispatch!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] (:: 'Ref 'Dynamic) 'Dynamic
            :features $ #{} :js-ffi
        'wrap-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-event (event)
            {} (:event event)
              :key $ phlox.core/ffi-event-key event
              :key-code $ phlox.core/ffi-event-key-code event
              :ctrl? $ phlox.core/ffi-event-ctrl? event
              :meta? $ phlox.core/ffi-event-meta? event
              :shift? $ phlox.core/ffi-event-shift? event
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.keyboard
          :require $ [] phlox.util :refer $ [] element?
    'phlox.math $ %{} 'FileEntry
      :defs $ {}
        'angle->radian $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn angle->radian (x) (* x radian-ratio)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
        'bound-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn bound-x (x lower higher)
            unsafe-coerce
              js/Math.min (either higher js/+Infinity)
                js/Math.max (either lower js/-Infinity) x
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'ffi-pi $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def ffi-pi 3.141592653589793
          :examples $ []
          :schema $ :: 'Number
        'radian-ratio $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def radian-ratio (/ ffi-pi 180)
          :examples $ []
          :schema $ :: 'Number
        'vec-length $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn vec-length (point)
            let[] (x y) point $ unsafe-coerce
              js/Math.sqrt $ &+ (&* x x) (&* y y)
              , Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] $ :: 'List 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.math
    'phlox.render $ %{} 'FileEntry
      :defs $ {}
        'first-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn first-value (items)
            option:unwrap-or (first items) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
        'init-box-size $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-box-size (target size)
            if (non-nil? size)
              let
                  size $ decode-map-as size $ :: 'List 'Number
                set! (.-width target)
                  option:unwrap $ nth size 0
                set! (.-height target)
                  option:unwrap $ nth size 1
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-fill $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-fill (target color) (.!endFill target)
            if (non-nil? color) (.!beginFill target color)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-filters $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-filters (target filters)
            if
              and (non-nil? filters)
                not $ empty? filters
              let
                  filters-arr $ js-array
                &doseq (ft filters)
                  if
                    and (list? ft)
                      &= 2 $ count ft
                    let[] (ctor options) ft $ phlox.core/ffi-push-array! filters-arr $ new ctor (to-js-data options)
                    js/console.warn "|Unknown filter:" ft
                set! (.-filters target) filters-arr
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-geometry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-geometry (data)
            let
                geo $ new PIXI/Geometry
                attrs $ option:unwrap-or (get data :attributes) nil
              &doseq (attr attrs)
                phlox.core/ffi-geometry-add-attribute! geo
                  option:unwrap-or (get attr :id) nil
                  to-js-data $ option:unwrap-or (get attr :buffer) nil
                  option:unwrap-or (get attr :size) nil
              phlox.core/ffi-geometry-add-index! geo $ to-js-data $ option:unwrap-or (get data :index) nil
              , geo
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'init-scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-scale (target scale)
            when (non-nil? scale)
              cond
                  list? scale
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target)
                      decode-map-as
                        option:unwrap-or (first scale) 1
                        , Number
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target)
                      decode-map-as
                        option:unwrap-or (last scale) 1
                        , Number
                (number? scale)
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target) scale
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target) scale
                (nil? scale)
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target) 1
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target) 1
                true $ js/console.error "|unknown scale" scale
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-shader (data uniforms)
            .!from PIXI/Shader
              option:unwrap-or (get data :vertex-source) nil
              option:unwrap-or (get data :fragment-source) nil
              , uniforms
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'last-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn last-value (items)
            option:unwrap-or (last items) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
        'read-draw-mode-alias $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-draw-mode-alias (draw-mode)
            if (tag? draw-mode)
              match draw-mode (:line-loop 0) (:line-strip 1) (:lines 2) (:points 3) (:triangle-fan 4) (:triangle-strip 5) (:triangles 6)
                _ $ js/console.warn "|Unknown draw mode:" draw-mode
              , draw-mode
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'render-children $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-children (target children dispatch!)
            &doseq (child-pair children)
              if (non-nil? child-pair)
                .!addChild target $ render-element
                  option:unwrap $ last child-pair
                  , dispatch!
                js/console.log "|nil child:" child-pair
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-circle (element dispatch!)
            let
                target $ new PIXI/Graphics
                props $ option:unwrap-or (get element :props) nil
                line-style $ option:unwrap-or (get props :line-style) nil
                position $ option:unwrap-or (get props :position) nil
                events $ option:unwrap-or (get props :on) nil
              init-fill target $ option:unwrap-or (get props :fill) nil
              init-line-style target line-style
              draw-circle target $ option:unwrap-or (get props :radius) nil
              init-events target events dispatch!
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-container (element dispatch!)
            let
                target $ new PIXI/Container
                props $ option:unwrap-or (get element :props) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-filters target $ option:unwrap-or (get props :filters) nil
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-element (element dispatch!)
            if (element? element)
              match
                option:unwrap-or (get element :name) nil
                nil nil
                :container $ render-container element dispatch!
                :graphics $ render-graphics element dispatch!
                :circle $ render-circle element dispatch!
                :rect $ render-rect element dispatch!
                :text $ render-text element dispatch!
                :mesh $ render-mesh element dispatch!
                :image $ render-image element dispatch!
                _ $ do
                  println "|unknown tag:" $ option:unwrap-or (get element :tag) nil
                  {}
              do $ js/console.error "|Unknown element:" element
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-graphics (element dispatch!)
            let
                target $ new PIXI/Graphics
                props $ option:unwrap-or (get element :props) nil
                ops $ option:unwrap-or (get props :ops) nil
                events $ option:unwrap-or (get props :on) nil
              ; dev-check props lilac-graphics
              call-graphics-ops target ops
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-events target events dispatch!
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-image (element dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                target $ .!from PIXI/Sprite $ option:unwrap-or (get props :url) nil
                events $ option:unwrap-or (get props :on) nil
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-box-size target $ option:unwrap-or (get props :size) nil
              init-events target events dispatch!
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-mesh (element dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                geo $ init-geometry $ option:unwrap-or (get props :geometry) nil
                shader $ init-shader
                  option:unwrap-or (get props :shader) nil
                  option:unwrap-or (get props :uniforms) nil
                draw-mode $ or
                  read-draw-mode-alias $ option:unwrap-or (get props :draw-mode) nil
                  , js/undefined
                target $ new PIXI/Mesh geo shader nil draw-mode
                events $ option:unwrap-or (get props :on) nil
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-events target events dispatch!
              if
                = :center $ option:unwrap-or (get props :align) :left
                phlox.core/ffi-set-anchor! (phlox.core/ffi-anchor target) 0.5
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              ; js/console.log target
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-rect (element dispatch!)
            let
                target $ new PIXI/Graphics
                props $ option:unwrap-or (get element :props) nil
                events $ option:unwrap-or (get props :on) nil
              init-fill target $ option:unwrap-or (get props :fill) nil
              init-line-style target $ option:unwrap-or (get props :line-style) nil
              draw-rect target
                option:unwrap-or (get props :size) nil
                option:unwrap-or (get props :radius) nil
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              init-events target events dispatch!
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'render-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-text (element dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                style $ option:unwrap-or (get props :style) nil
                text-style $ new PIXI/TextStyle $ convert-line-style style
                target $ new PIXI/Text
                  option:unwrap-or (get props :text) nil
                  , text-style
              init-position target $ option:unwrap-or (get props :position) nil
              init-scale target $ option:unwrap-or (get props :scale) nil
              init-pivot target $ option:unwrap-or (get props :pivot) nil
              init-angle target $ option:unwrap-or (get props :angle) nil
              init-rotation target $ option:unwrap-or (get props :rotation) nil
              init-alpha target $ option:unwrap-or (get props :alpha) nil
              if
                = :center $ option:unwrap-or (get props :align) :left
                phlox.core/ffi-set-anchor! (phlox.core/ffi-anchor target) 0.5
              init-filters target $ option:unwrap-or (get props :filters) nil
              render-children target
                option:unwrap-or (get element :children) nil
                , dispatch!
              , target
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-angle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-angle (target v v0)
            when (not= v v0)
              set! (.-angle target) v
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-box-size $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-box-size (target size size')
            if (not= size size')
              if (non-nil? size)
                let
                    size $ decode-map-as size $ :: 'List 'Number
                  set! (.-width target)
                    option:unwrap $ nth size 0
                  set! (.-height target)
                    option:unwrap $ nth size 1
                do
                  set! (.-width target) js/undefined
                  set! (.-height target) js/undefined
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-children $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-children (raw-children raw-old-children parent-container dispatch! options)
            let
                children-dict $ decode-map-as raw-children $ :: 'List (:: 'List 'Dynamic)
                old-children-dict $ decode-map-as raw-old-children $ :: 'List (:: 'List 'Dynamic)
              when dev? $ assert "|children should not contain nil element" $ and
                every? (map children-dict last-value) non-nil?
                every? (map old-children-dict last-value) non-nil?
              let
                  list-ops $ find-minimal-ops lcs-state-0 (map old-children-dict first-value) (map children-dict first-value)
                loop
                    idx 0
                    ops $ decode-map-as
                      option:unwrap $ get list-ops :acc
                      :: 'List $ :: 'List 'Dynamic
                    xs children-dict
                    ys old-children-dict
                  when-not (empty? ops)
                    let
                        op $ first-value ops
                      match (first-value op)
                        :remains $ do
                          when dev? $ assert
                            = (last-value op)
                              first-value $ first-value xs
                              first-value $ first-value ys
                            , "|check key"
                          update-element
                            last-value $ first-value xs
                            last-value $ first-value ys
                            , parent-container idx dispatch! options
                          recur (inc idx) (rest ops) (rest xs) (rest ys)
                        :add $ do
                          when dev? $ assert "|check key" $ = (last-value op)
                            first-value $ first-value xs
                          .!addChildAt parent-container
                            render-element
                              last-value $ first-value xs
                              , dispatch!
                            , idx
                          recur (inc idx) (rest ops) (rest xs) ys
                        :remove $ do
                          when dev? $ assert "|check key" $ = (last-value op)
                            first-value $ first-value ys
                          .!removeChildAt parent-container idx
                          recur idx (rest ops) xs $ rest ys
                        _ $ do $ println "|Unknown op:" op
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'update-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-circle (element old-element target dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                position $ option:unwrap-or (get props :position) nil
                position' $ option:unwrap-or (get props' :position) nil
                radius $ option:unwrap-or (get props :radius) nil
                radius' $ option:unwrap-or (get props' :radius) nil
                line-style $ option:unwrap-or (get props :line-style) nil
                line-style' $ option:unwrap-or (get props' :line-style) nil
              when
                or (not= position position') (not= radius radius') (not= line-style line-style')
                  not=
                    option:unwrap-or (get props :fill) nil
                    option:unwrap-or (get props' :fill) nil
                .!clear target
                init-fill target $ option:unwrap-or (get props :fill) nil
                init-line-style target line-style
                draw-circle target $ option:unwrap-or (get props :radius) nil
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-events target
                option:unwrap-or (get props :on) nil
                option:unwrap-or (get props' :on) nil
                , dispatch!
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-container (element old-element target)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-draw-mode $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-draw-mode (target draw-mode draw-mode')
            when (not= draw-mode draw-mode')
              let
                  m $ read-draw-mode-alias draw-mode
                if (nil? m) (eprintln "|updating draw-mode to nil")
                set! (.-drawMode target) m
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-element (element old-element parent-element idx dispatch! options)
            cond
                or (nil? element) (nil? element)
                js/console.error "|Not supposed to be empty"
              (and (element? element) (element? old-element) (= (option:unwrap-or (get element :name) nil) (option:unwrap-or (get old-element :name) nil)))
                do
                  let
                      target $ .!getChildAt parent-element idx
                    match
                      option:unwrap-or (get element :name) nil
                      :container $ update-container element old-element target
                      :circle $ update-circle element old-element target dispatch!
                      :rect $ update-rect element old-element target dispatch!
                      :text $ update-text element old-element target
                      :graphics $ update-graphics element old-element target dispatch!
                      :mesh $ update-mesh element old-element target dispatch!
                      :image $ update-image element old-element target dispatch!
                      _ $ do $ eprintln "|not implement yet for updating:"
                        option:unwrap-or (get element :name) nil
                  update-children
                    option:unwrap-or (get element :children) nil
                    option:unwrap-or (get old-element :children) nil
                    .!getChildAt parent-element idx
                    , dispatch! options
              (not= (option:unwrap-or (get element :name) nil) (option:unwrap-or (get old-element :name) nil))
                do (.!removeChildAt parent-element idx)
                  .!addChildAt parent-element (render-element element dispatch!) idx
              true $ js/console.warn "|Unknown case:" element old-element
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Number 'Dynamic $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'update-filters $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-filters (target filters filters0)
            let
                next-filters $ decode-map-as
                  either filters $ []
                  :: 'List $ :: 'List 'Dynamic
                prev-filters $ decode-map-as
                  either filters0 $ []
                  :: 'List $ :: 'List 'Dynamic
              if
                not= (map next-filters last) (map prev-filters last)
                if (empty? next-filters)
                  set! (.-filters target) nil
                  init-filters target next-filters
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-geometry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-geometry (target geo geo')
            when (not= geo geo')
              -> target .-geometry $ set! $ init-geometry geo
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-graphics (element old-element target dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                ops $ option:unwrap-or (get props :ops) nil
                ops' $ option:unwrap-or (get props' :ops) nil
              when (not= ops ops') (.!clear target) (call-graphics-ops target ops)
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-events target
                option:unwrap-or (get props :on) nil
                option:unwrap-or (get props' :on) nil
                , dispatch!
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-image (element old-element target dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                position $ option:unwrap-or (get props :position) nil
                position' $ option:unwrap-or (get props' :position) nil
                size $ option:unwrap-or (get props :size) nil
                size' $ option:unwrap-or (get props' :size) nil
              when
                not=
                  option:unwrap-or (get props :url) nil
                  option:unwrap-or (get props' :url) nil
                js/console.warn "|image url changes are not handling in updates"
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-box-size target
                option:unwrap-or (get props :size) nil
                option:unwrap-or (get props' :size) nil
              update-events target
                option:unwrap-or (get props :on) nil
                option:unwrap-or (get props' :on) nil
                , dispatch!
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-mesh (element old-element target dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                ops $ option:unwrap-or (get props :ops) nil
                ops' $ option:unwrap-or (get props' :ops) nil
              update-geometry target
                option:unwrap-or (get props :geometry) nil
                option:unwrap-or (get props' :geometry) nil
              update-shader target
                option:unwrap-or (get props :shader) nil
                option:unwrap-or (get props' :shader) nil
                option:unwrap-or (get props :uniforms) nil
              update-draw-mode target
                option:unwrap-or (get props :draw-mode) nil
                option:unwrap-or (get props' :draw-mode) nil
              let
                  pointer $ -> target phlox.core/ffi-shader phlox.core/ffi-uniforms
                ->
                  option:unwrap-or (get props :uniforms) nil
                  , js/Object.entries $ phlox.core/ffi-for-each $ fn (arr & args)
                    if
                      not $ identical? (phlox.core/ffi-entry-value arr)
                        aget pointer $ phlox.core/ffi-entry-key arr
                      aset pointer (phlox.core/ffi-entry-key arr) (phlox.core/ffi-entry-value arr)
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-events target
                option:unwrap-or (get props :on) nil
                option:unwrap-or (get props' :on) nil
                , dispatch!
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-rect (element old-element target dispatch!)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                position $ option:unwrap-or (get props :position) nil
                position' $ option:unwrap-or (get props' :position) nil
                size $ option:unwrap-or (get props :size) nil
                size' $ option:unwrap-or (get props' :size) nil
                radius $ option:unwrap-or (get props :radius) nil
                radius' $ option:unwrap-or (get props' :radius) nil
                line-style $ option:unwrap-or (get props :line-style) nil
                line-style' $ option:unwrap-or (get props' :line-style) nil
              when
                or (not= size size') (not= radius radius') (not= line-style line-style')
                  not=
                    option:unwrap-or (get props :fill) nil
                    option:unwrap-or (get props' :fill) nil
                .!clear target
                init-fill target $ option:unwrap-or (get props :fill) nil
                init-line-style target line-style
                draw-rect target size $ option:unwrap-or (get props :radius) nil
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              update-events target
                option:unwrap-or (get props :on) nil
                option:unwrap-or (get props' :on) nil
                , dispatch!
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-scale (target scale scale')
            when (not= scale scale')
              cond
                  list? scale
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target)
                      decode-map-as
                        option:unwrap-or (first scale) 1
                        , Number
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target)
                      decode-map-as
                        option:unwrap-or (last scale) 1
                        , Number
                (number? scale)
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target) scale
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target) scale
                (nil? scale)
                  do
                    phlox.core/ffi-set-x! (phlox.core/ffi-scale target) 1
                    phlox.core/ffi-set-y! (phlox.core/ffi-scale target) 1
                true $ js/console.error "|unknown scale:" scale
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-shader (target shader shader' uniforms)
            when (not= shader shader')
              -> target .-shader $ set! $ init-shader shader uniforms
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-text (element old-element target)
            let
                props $ option:unwrap-or (get element :props) nil
                props' $ option:unwrap-or (get old-element :props) nil
                text-style $ option:unwrap-or (get props :style) nil
                text-style' $ option:unwrap-or (get props' :style) nil
              when
                not=
                  option:unwrap-or (get props :text) nil
                  option:unwrap-or (get props' :text) nil
                set! (.-text target)
                  option:unwrap-or (get props :text) nil
              when (not= text-style text-style')
                let
                    new-style $ new PIXI/TextStyle $ convert-line-style text-style
                  set! (.-style target) new-style
              update-position target
                option:unwrap-or (get props :position) nil
                option:unwrap-or (get props' :position) nil
              update-scale target
                option:unwrap-or (get props :scale) nil
                option:unwrap-or (get props' :scale) nil
              update-rotation target
                option:unwrap-or (get props :rotation) nil
                option:unwrap-or (get props' :rotation) nil
              update-angle target
                option:unwrap-or (get props :angle) nil
                option:unwrap-or (get props' :angle) nil
              update-pivot target
                option:unwrap-or (get props :pivot) nil
                option:unwrap-or (get props' :pivot) nil
              update-alpha target
                option:unwrap-or (get props :alpha) nil
                option:unwrap-or (get props' :alpha) nil
              if
                not=
                  option:unwrap-or (get props :align) nil
                  option:unwrap-or (get props' :align) :left
                if
                  = :center $ option:unwrap-or (get props :align) :left
                  phlox.core/ffi-set-anchor! (phlox.core/ffi-anchor target) 0.5
                  phlox.core/ffi-set-anchor! (phlox.core/ffi-anchor target) nil
              update-filters target
                option:unwrap-or (get props :filters) nil
                option:unwrap-or (get props' :filters) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.render
          :require (|pixi.js :as PIXI)
            phlox.util :refer $ use-number element? remove-nil-values index-items convert-line-style
            phlox.util.lcs :refer $ find-minimal-ops lcs-state-0
            phlox.render.draw :refer $ call-graphics-ops update-position update-pivot update-rotation update-alpha update-events draw-circle draw-rect init-events init-position init-pivot init-angle init-rotation init-alpha init-line-style
            phlox.check :refer $ dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-circle
            phlox.config :refer $ dev?
    'phlox.render.draw $ %{} 'FileEntry
      :defs $ {}
        'call-graphics-ops $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn call-graphics-ops (target ops)
            &doseq (pair ops)
              when (non-nil? pair)
                let[] (op data) pair $ match op
                  :move-to $ .!moveTo target
                    option:unwrap $ first data
                    option:unwrap $ last data
                  :line-to $ .!lineTo target
                    option:unwrap $ first data
                    option:unwrap $ last data
                  :line-style $ init-line-style target data
                  :begin-fill $ .!beginFill target
                    option:unwrap-or (get data :color) nil
                    either
                      option:unwrap-or (get data :alpha) nil
                      , 1
                  :end-fill $ .!endFill target
                  :close-path $ .!closePath target
                  :arc $ let
                      center $ option:unwrap-or (get data :center) nil
                      radian $ cond
                          non-nil? $ option:unwrap-or (get data :radian) nil
                          option:unwrap-or (get data :radian) nil
                        (non-nil? (option:unwrap-or (get data :angle) nil))
                          map
                            decode-map-as
                              option:unwrap-or (get data :angle) ([])
                              :: 'List 'Number
                            , angle->radian
                        true $ do (js/console.warn "|Unknown arc" data) ([] 0 0)
                    .!arc target
                      option:unwrap $ first center
                      option:unwrap $ last center
                      option:unwrap-or (get data :radius) nil
                      option:unwrap $ first radian
                      option:unwrap $ last radian
                      option:unwrap-or (get data :anticlockwise?) nil
                  :arc-to $ let
                      p1 $ option:unwrap-or (get data :p1) nil
                      p2 $ option:unwrap-or (get data :p2) nil
                    .!arcTo target
                      option:unwrap $ first p1
                      option:unwrap $ last p1
                      option:unwrap $ first p2
                      option:unwrap $ last p2
                      option:unwrap-or (get data :radius) nil
                  :bezier-to $ let
                      p1 $ option:unwrap-or (get data :p1) nil
                      p2 $ option:unwrap-or (get data :p2) nil
                      to-p $ option:unwrap-or (get data :to-p) nil
                    .!bezierCurveTo target
                      option:unwrap $ first p1
                      option:unwrap $ last p1
                      option:unwrap $ first p2
                      option:unwrap $ last p2
                      option:unwrap $ first to-p
                      option:unwrap $ last to-p
                  :quadratic-to $ let
                      p1 $ option:unwrap-or (get data :p1) nil
                      to-p $ option:unwrap-or (get data :to-p) nil
                    .!quadraticCurveTo target
                      option:unwrap $ first p1
                      option:unwrap $ last p1
                      option:unwrap $ first to-p
                      option:unwrap $ last to-p
                  :begin-hole $ .!beginHole target
                  :end-hole $ .!endHole target
                  _ $ js/console.warn "|not supported op:" op data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'draw-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn draw-circle (target radius)
            if (number? radius)
              .!drawCircle target 0 0 $ use-number radius
              js/console.warn "|Unknown radius" radius
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'draw-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn draw-rect (target size radius)
            if (list? size)
              if (non-nil? radius)
                .!drawRoundedRect target 0 0
                  use-number $ option:unwrap $ first size
                  use-number $ option:unwrap $ last size
                  , radius
                .!drawRect target 0 0
                  use-number $ option:unwrap $ first size
                  use-number $ option:unwrap $ last size
              js/console.warn "|Unknown size" size
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-alpha $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-alpha (target alpha)
            when (non-nil? alpha)
              set! (-> target .-alpha) alpha
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-angle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-angle (target v)
            when (non-nil? v)
              set! (.-angle target) v
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-events (target events dispatch!)
            when (non-nil? events)
              let
                  checked-events $ decode-map-as events $ :: 'Map 'Tag 'Dynamic
                set! (.-eventMode target) |dynamic
                set! (.-buttonMode target) true
                &doseq
                  k $ keys checked-events
                  let
                      listener $ option:unwrap $ get checked-events k
                    .!on target (to-string k)
                      fn (event)
                        when (fn? listener) (listener event dispatch!)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-line-style (target line-style)
            when (non-nil? line-style)
              .!lineStyle target $ js-object
                :width $ use-number $ option:unwrap-or (get line-style :width) nil
                :color $ use-number $ option:unwrap-or (get line-style :color) nil
                :alpha $ either
                  option:unwrap-or (get line-style :alpha) nil
                  , 1
                :join $ read-line-join $ option:unwrap-or (get line-style :join) nil
                :cap $ read-line-cap $ option:unwrap-or (get line-style :cap) nil
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-pivot (target pivot)
            when (non-nil? pivot)
              phlox.core/ffi-set-x! (phlox.core/ffi-pivot target)
                decode-map-as
                  option:unwrap-or (first pivot) 0
                  , Number
              phlox.core/ffi-set-y! (phlox.core/ffi-pivot target)
                decode-map-as
                  option:unwrap-or (last pivot) 0
                  , Number
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-position (target point)
            when (non-nil? point)
              phlox.core/ffi-set-x! (phlox.core/ffi-position target)
                if (list? point)
                  decode-map-as
                    option:unwrap-or (first point) 0
                    , Number
                  , 0
              phlox.core/ffi-set-y! (phlox.core/ffi-position target)
                if (list? point)
                  decode-map-as
                    option:unwrap-or (last point) 0
                    , Number
                  , 0
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'init-rotation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-rotation (target v)
            when (non-nil? v)
              set! (.-rotation target) v
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'read-line-cap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-line-cap (x)
            match x
              nil $ .-BUTT PIXI/LINE_CAP
              :butt $ .-BUTT PIXI/LINE_CAP
              :round $ .-ROUND PIXI/LINE_CAP
              :square $ .-SQUARE PIXI/LINE_CAP
              _ $ println "|unknown line-cap:" x
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'read-line-join $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-line-join (x)
            match x
              nil $ .-MITER PIXI/LINE_JOIN
              :bevel $ .-BEVEL PIXI/LINE_JOIN
              :miter $ .-MITER PIXI/LINE_JOIN
              :round $ .-ROUND PIXI/LINE_JOIN
              _ $ do $ println "|unknown line-join value:" x
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'update-alpha $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-alpha (target alpha alpha0)
            when (not= alpha alpha0)
              set! (-> target .-alpha) alpha
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-events (target events old-events dispatch!)
            when (non-nil? old-events)
              let
                  checked-events $ decode-map-as old-events $ :: 'Map 'Tag 'Dynamic
                &doseq
                  k $ keys checked-events
                  .!off target $ to-string k
            when (non-nil? events)
              let
                  checked-events $ decode-map-as events $ :: 'Map 'Tag 'Dynamic
                &doseq
                  k $ keys checked-events
                  let
                      listener $ option:unwrap $ get checked-events k
                    .!on target (to-string k)
                      fn (event)
                        when (fn? listener) (listener event dispatch!)
            if (non-nil? events)
              do
                set! (.-buttonMode target) true
                set! (.-eventMode target) |dynamic
              do
                set! (.-buttonMode target) false
                set! (.-eventMode target) |none
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-pivot (target pivot pivot0)
            when (not= pivot pivot0)
              phlox.core/ffi-set-x! (phlox.core/ffi-pivot target)
                if (list? pivot)
                  decode-map-as
                    option:unwrap-or (first pivot) 0
                    , Number
                  , 0
              phlox.core/ffi-set-y! (phlox.core/ffi-pivot target)
                if (list? pivot)
                  decode-map-as
                    option:unwrap-or (last pivot) 0
                    , Number
                  , 0
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-position (target point point0)
            when (not= point point0)
              phlox.core/ffi-set-x! (phlox.core/ffi-position target)
                if (list? point)
                  decode-map-as
                    option:unwrap-or (first point) 0
                    , Number
                  , 0
              phlox.core/ffi-set-y! (phlox.core/ffi-position target)
                if (list? point)
                  decode-map-as
                    option:unwrap-or (last point) 0
                    , Number
                  , 0
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
        'update-rotation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-rotation (target v v0)
            when (not= v v0)
              set! (.-rotation target) v
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Dynamic 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.render.draw
          :require
            phlox.util :refer $ use-number
            phlox.check :refer $ dev-check dev-check-message lilac-point lilac-line-style lilac-color
            phlox.math :refer $ angle->radian
            phlox.render.draw :refer $ init-line-style
            |pixi.js :as PIXI
    'phlox.schema $ %{} 'FileEntry
      :defs $ {} $ 'PhloxElement
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct PhloxElement (:name 'Dynamic) (:props 'Dynamic) (:children 'Dynamic)
          :examples $ []
          :schema $ :: 'Enum
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.schema
    'phlox.util $ %{} 'FileEntry
      :defs $ {}
        '*ctx-instance $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *ctx-instance nil
          :examples $ []
          :schema $ :: 'Ref 'Dynamic
        'camel-case $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn camel-case (x)
            unsafe-coerce
              .!replace x (new js/RegExp |-[a-z])
                fn (x idx full-text)
                  .!toUpperCase $ option:unwrap-or (get x 1) |
              , String
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'canvas-center! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn canvas-center! ()
            []
              &* 0.5 $ phlox.core/ffi-number js/window.innerWidth
              &* 0.5 $ phlox.core/ffi-number js/window.innerHeight
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ []
            :features $ #{} :js-ffi
            :return $ :: 'List 'Number
        'convert-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn convert-line-style (props)
            -> props (to-pairs)
              map $ fn (pair)
                let[] (k v) pair $ let
                    key-name $ camel-case $ cond
                        tag? k
                        to-string k
                      (string? k) k
                      true $ str k
                  [] key-name $ match k
                    :fill-gradient-type $ match v
                      :h $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL
                      :horizontal $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL
                      :v $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL
                      :vertical $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL
                      _ $ do (println "|unknown gradient type:") v
                    _ $ cond
                        tag? v
                        to-string v
                      (string? v) v
                      (number? v) v
                      (bool? v) v
                      (list? v) v
                      true $ do (println "|Unknown style value:" v) v
              &set:to-list
              pairs-map
              to-js-data
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'detect-func-in-map? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn detect-func-in-map? (params)
            if (empty? params) false $ let
                p0 $ option:unwrap-or (first params) nil
              if
                and (map? p0)
                  any? (to-pairs p0)
                    fn (pair)
                      fn? $ option:unwrap-or (last pair) nil
                , true $ recur $ rest params
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
        'element? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn element? (x)
            and (struct? x)
              = (&struct:definition x) schema/PhloxElement
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Bool)
            :args $ [] 'Dynamic
        'index-items $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn index-items (xs)
            -> xs $ map-indexed $ fn (idx x) ([] idx x)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'Dynamic
            :return $ :: 'List $ :: 'List 'Dynamic
        'measure-text-width! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn measure-text-width! (text size font-family)
            when
              phlox.core/ffi-nullish? $ unsafe-coerce @*ctx-instance Dynamic
              let
                  el $ phlox.core/ffi-create-element js/document |canvas
                reset! *ctx-instance $ phlox.core/ffi-get-context el |2d
            phlox.core/ffi-set-font! @*ctx-instance $ str size "|px " font-family
            phlox.core/ffi-text-width $ phlox.core/ffi-measure-text @*ctx-instance text
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'String 'Number 'String
            :features $ #{} :js-ffi
        'rand-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-color ()
            floor $ * (random) 0xffffff
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ []
            :features $ #{} :js-ffi
        'remove-nil-values $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-nil-values (dict)
            -> dict $ filter $ fn (pair)
              non-nil? $ option:unwrap-or (last pair) nil
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List (:: 'List 'Dynamic)
            :return $ :: 'List $ :: 'List 'Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |nil-filter-keeps-false-and-keys)
            :code $ quote $ assert=
              [] ([] 1 false) ([] 2 |a)
              remove-nil-values $ index-items $ [] nil false |a
        'use-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn use-number (x)
            if
              and (number? x)
                not $ js/isNaN x
              , x $ do (js/console.error "|Invalid number:" x) nil
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Dynamic)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util
          :require
            js-ffi.browser :refer $ random
            |pixi.js :as PIXI
            phlox.schema :as schema
    'phlox.util.lcs $ %{} 'FileEntry
      :defs $ {}
        'append-op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn append-op (state kind key cost)
            -> state
              assoc :acc $ conj
                decode-map-as
                  option:unwrap $ get state :acc
                  :: 'List $ :: 'List 'Dynamic
                [] kind key
              assoc :step $ + cost $ decode-map-as
                option:unwrap $ get state :step
                , Number
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag 'Dynamic 'Number
            :return $ :: 'Map 'Tag 'Dynamic
        'find-minimal-ops $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn find-minimal-ops (state xs ys)
            cond
                and (empty? xs) (empty? ys)
                , state
              (empty? xs)
                recur
                  append-op state :add
                    option:unwrap $ first ys
                    , 1
                  , xs $ rest ys
              (empty? ys)
                recur
                  append-op state :remove
                    option:unwrap $ first xs
                    , 1
                  rest xs
                  , ys
              true $ let
                  x0 $ option:unwrap $ first xs
                  y0 $ option:unwrap $ first ys
                cond
                    identical? x0 y0
                    recur (append-op state :remains x0 0) (rest xs) (rest ys)
                  (not (any? ys (fn (y) (identical? x0 y))))
                    recur (append-op state :remove x0 1) (rest xs) ys
                  (not (any? xs (fn (x) (identical? y0 x))))
                    recur (append-op state :add y0 1) xs $ rest ys
                  true $ let
                      solution-a $ find-minimal-ops (append-op state :remove x0 1) (rest xs) ys
                      solution-b $ find-minimal-ops (append-op state :add y0 1) xs $ rest ys
                    if
                      <=
                        decode-map-as
                          option:unwrap $ get solution-a :step
                          , Number
                        decode-map-as
                          option:unwrap $ get solution-b :step
                          , Number
                      , solution-a solution-b
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'List 'Dynamic) (:: 'List 'Dynamic)
            :return $ :: 'Map 'Tag 'Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |legacy-simple-changes)
            :code $ quote $ do
              assert=
                {}
                  :acc $ [] ([] :remove |a) ([] :add |b)
                  :step 2
                find-minimal-ops lcs-state-0 ([] |a) ([] |b)
              assert=
                {}
                  :acc $ [] $ [] :remains |a
                  :step 0
                find-minimal-ops lcs-state-0 ([] |a) ([] |a)
              assert=
                {}
                  :acc $ [] $ [] :add |a
                  :step 1
                find-minimal-ops lcs-state-0 ([]) ([] |a)
              assert=
                {}
                  :acc $ [] ([] :remains |a) ([] :remove |b) ([] :remains |c)
                  :step 1
                find-minimal-ops lcs-state-0 ([] |a |b |c) ([] |a |c)
              assert=
                {}
                  :acc $ [] ([] :remains |a) ([] :remove |b) ([] :remains |c) ([] :add |c)
                  :step 2
                find-minimal-ops lcs-state-0 ([] |a |b |c) ([] |a |c |c)
              assert=
                {}
                  :acc $ [] ([] :remains |a) ([] :add |b1) ([] :add |b2) ([] :add |b3) ([] :remains |c)
                  :step 3
                find-minimal-ops lcs-state-0 ([] |a |c) ([] |a |b1 |b2 |b3 |c)
            :tags $ #{} :unit
        'lcs-state-0 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lcs-state-0
            {}
              :acc $ []
              :step 0
          :examples $ []
          :schema $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util.lcs
    'phlox.util.styles $ %{} 'FileEntry
      :defs $ {}
        'font-code $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def font-code "|Source Code Pro, Menlo, Ubuntu Mono, Consolas, monospace"
          :examples $ []
          :schema $ :: 'Dynamic
        'font-normal $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def font-normal "|Hind, Helvetica, Arial, sans-serif"
          :examples $ []
          :schema $ :: 'Dynamic
        'layout-column $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-column
            {} (:display |flex) (:align-items |stretch) (:flex-direction |column)
          :examples $ []
          :schema $ :: 'Dynamic
        'layout-expand $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-expand
            {} (:flex 1) (:overflow :auto)
          :examples $ []
          :schema $ :: 'Dynamic
        'layout-row $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-row
            {} (:display |flex) (:align-items |stretch) (:flex-direction |row)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util.styles

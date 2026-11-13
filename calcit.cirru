
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
                  fn (event dispatch!)
                    dispatch! $ :: :add-x
              rect
                {}
                  :position $ [] 40 40
                  :size $ [] 50 50
                  :line-style $ {} (:width 4)
                    :color $ hslx 0 80 50
                    :alpha 1
                  :fill $ hslx 200 80 80
                  :on $ {} $ :pointertap
                    fn (e dispatch!)
                      dispatch! $ :: :add-x
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
          :schema $ quote $ Fn Number (-> phlox.schema/PhloxElement) (:features :io :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.drafts
          :require $ phlox.core :refer $ g hslx hclx rect circle text container graphics create-list image
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
                    fn (e d!)
                      d! $ :: :toggle-keyboard
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
                    :down $ fn (e d!)
                      d! $ :: :counted
                    :up $ fn (e d!) (println :up)
                  {}
          :examples $ []
          :schema $ quote $ Fn Bool Number (-> phlox.schema/PhloxElement) (:features :io :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.keyboard
          :require $ phlox.core :refer $ g hslx rect circle text container graphics create-list
    'phlox.app.comp.slider-demo $ %{} 'FileEntry
      :defs $ {}
        'comp-slider-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position $ [] 100 100
                comp-slider (>> states :a)
                  {}
                    :value $ phlox.util/prop state :a
                    :unit 1
                    :position $ [] 20 0
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :a value
                comp-slider (>> states :b)
                  {}
                    :value $ phlox.util/prop state :b
                    :title |Refine
                    :unit 0.1
                    :position $ [] 20 60
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :b value
                comp-slider (>> states :c)
                  {}
                    :value $ phlox.util/prop state :c
                    :unit 10
                    :position $ [] 20 120
                    :fill $ hslx 50 90 70
                    :color $ hslx 200 90 30
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :c value
                comp-slider (>> states :d)
                  {}
                    :value $ phlox.util/prop state :d
                    :position $ [] 20 180
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :d value
                    :title |Round
                    :round? true
                comp-slider (>> states :e)
                  {}
                    :value $ phlox.util/prop state :e
                    :position $ [] 20 240
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :e value
                    :title "|min 10"
                    :min 10
                comp-slider (>> states :f)
                  {}
                    :value $ phlox.util/prop state :f
                    :position $ [] 20 300
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :f value
                    :title "|max 10"
                    :max 10
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-slider-point-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-point-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position $ [] 120 100
                comp-slider-point (>> states :a)
                  {}
                    :value $ phlox.util/prop state :a
                    :unit 1
                    :position $ [] 20 0
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :a value
                comp-slider-point (>> states :b)
                  {}
                    :value $ phlox.util/prop state :b
                    :unit 0.1
                    :position $ [] 20 60
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :b value
                comp-slider-point (>> states :c)
                  {}
                    :value $ phlox.util/prop state :c
                    :unit 10
                    :position $ [] 20 120
                    :fill $ hslx 50 90 70
                    :color $ hslx 200 90 30
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :c value
                comp-slider-point (>> states :d)
                  {}
                    :value $ phlox.util/prop state :d
                    :position $ [] 20 180
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :d value
                    :round? true
                comp-slider-point (>> states :e)
                  {}
                    :value $ phlox.util/prop state :e
                    :position $ [] 20 240
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :e value
                    :min 10
                comp-slider-point (>> states :f)
                  {}
                    :value $ phlox.util/prop state :f
                    :position $ [] 20 300
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :f value
                    :max 10
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-spin-slider-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-spin-slider-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} (:v1 10)
                    :pos $ [] 240 240
              container ({})
                comp-spin-slider (>> states :demo)
                  {}
                    :position $ phlox.util/prop state :pos
                    :value $ phlox.util/prop state :v1
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
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi :state)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.comp.slider-demo
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list >>
            phlox.comp.slider :refer $ comp-slider comp-slider-point comp-spin-slider
    'phlox.app.container $ %{} 'FileEntry
      :defs $ {}
        'comp-arrows-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-arrows-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {}
                    :from $ [] 100 100
                    :to $ [] 200 200
              comp-arrow (>> states :demo1)
                {}
                  :from $ phlox.util/prop state :from
                  :to $ phlox.util/prop state :to
                  :width 2
                  :arm-length 8
                  :on-change $ fn (from to d!)
                    d! cursor $ assoc (assoc state :from from) :to to
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi)
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
          :schema $ quote $ Fn (-> phlox.schema/PhloxElement) (:features :io :js-ffi :state)
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-container (store)
            let
                cursor $ []
                states $ decode-map-as (phlox.util/require-prop store :states) (Map Tag Dynamic)
              group
                {} $ :position $ [] 0 0
                comp-tabs tabs (phlox.util/require-prop store :tab)
                  {} $ :position $ [] 10 10
                  fn (t d!) (d! :tab t)
                match (phlox.util/require-prop store :tab)
                  :drafts $ comp-drafts $ decode-map-as (phlox.util/require-prop store :x) Number
                  :grids $ comp-grids
                  :curves $ comp-curves
                  :gradients $ comp-gradients
                  :keyboard $ comp-keyboard
                    decode-map-as (phlox.util/require-prop store :keyboard-on?) Bool
                    decode-map-as (phlox.util/prop-or store :counted 0) Number
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
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :io :js-ffi :state)
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
          :schema $ quote $ Fn (-> phlox.schema/PhloxElement) (:features :js-ffi)
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
          :schema $ quote $ Fn (-> phlox.schema/PhloxElement) (:features :js-ffi)
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
          :schema $ quote $ Fn (-> phlox.schema/PhloxElement) (:features :io :js-ffi)
        'comp-mesh-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-mesh-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ phlox.util/prop-or states :data $ {} (:x 0)
                  :base $ [] 109 129
                  :offset $ [] -123 -3
                  :zoom 0.26
              container ({})
                comp-button $ {} (:text |Tick)
                  :position $ [] 200 -40
                  :on-pointertap $ fn (e d!)
                    d! cursor $ update state :x $ fn (current)
                      inc $ decode-map-as current 'Number
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
                          .unwrap $ get state :base
                          List Number
                        offset $ decode-map-as
                          phlox.util/prop-or state :offset $ [] 0 0
                          List Number
                      js-object (:uSampler2 sample-texture)
                        :time $ decode-map-as
                          .unwrap $ get state :x
                          , Number
                        :baseX $ .unwrap $ first base
                        :baseY $ .unwrap $ last base
                        :zoom $ decode-map-as
                          .unwrap $ get state :zoom
                          , Number
                        :offsetX $ .unwrap-or (first offset) 0
                        :offsetY $ .unwrap-or (last offset) 0
                    ; :on $ {} $ :pointertap
                      fn (e d!) (println |clicked)
                  comp-drag-point (>> states :base)
                    {} (:radius 6) (:hide-text? true)
                      :position $ phlox.util/prop state :base
                      :fill $ hslx 200 100 50
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :base position
                  comp-drag-point (>> states :offset)
                    {} (:radius 6)
                      :fill $ hslx 0 100 50
                      :hide-text? true
                      :position $ phlox.util/prop state :offset
                      :on-change $ fn (position d!)
                        d! cursor $ assoc state :offset position
                comp-slider-point (>> states :zoom)
                  {}
                    :value $ phlox.util/prop state :zoom
                    :min 0.01
                    :position $ [] 300 -40
                    :on-change $ fn (value d!)
                      d! cursor $ assoc state :zoom value
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi :state)
        'comp-messages-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-messages-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ decode-map-as
                  .unwrap-or (get states :data)
                    {}
                      :messages $ []
                      :bottom? false
                  Map Tag Dynamic
              container ({})
                comp-button $ {} (:text "|Add message")
                  :position $ [] 120 200
                  :on-pointertap $ fn (e d!)
                    d! cursor $ assoc state :messages $ conj
                      decode-map-as (phlox.util/require-prop state :messages)
                        List $ Map Tag String
                      let
                          id $ nanoid
                        {} (:id id)
                          :text $ str "|Messages of " id
                comp-switch $ {}
                  :value $ phlox.util/prop state :bottom?
                  :title "|At bottom"
                  :position $ [] 200 280
                  :on-change $ fn (e d!)
                    d! cursor $ update state :bottom? $ fn (current)
                      not $ decode-map-as current 'Bool
                comp-messages $ {}
                  :messages $ phlox.util/prop state :messages
                  :bottom? $ phlox.util/prop state :bottom?
                  :on-pointertap $ fn (message d!)
                    d! cursor $ assoc state :messages $ let
                        clicked-id $ decode-map-as (phlox.util/require-prop message :id) String
                      filter-not
                        decode-map-as (phlox.util/require-prop state :messages)
                          List $ Map Tag String
                        fn (x)
                          hint-fn $ Fn (Map Tag String) (-> Bool)
                          identical?
                            .unwrap $ get x :id
                            , clicked-id
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :io :js-ffi :state)
        'comp-points-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-points-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
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
                    :position $ phlox.util/prop state :p1
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p1 position
                comp-drag-point (>> states :p2)
                  {}
                    :position $ phlox.util/prop state :p2
                    :unit 2
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p2 position
                comp-drag-point (>> states :p3)
                  {}
                    :position $ phlox.util/prop state :p3
                    :unit 0.4
                    :radius 10
                    :fill $ hslx 0 90 60
                    :color $ hslx 0 0 50
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p3 position
                comp-drag-point (>> states :p4)
                  {}
                    :position $ phlox.util/prop state :p4
                    :title |base
                    :alpha 0.6
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p4 position
                comp-drag-point (>> states :p5)
                  {}
                    :position $ phlox.util/prop state :p5
                    :hide-text? true
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p5 position
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (-> phlox.schema/PhloxElement) (:features :js-ffi)
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
          :schema $ quote $ Fn (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-switch-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-switch-demo (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} $ :value false
              container
                {} $ :position $ [] 120 300
                comp-switch $ {}
                  :value $ phlox.util/prop state :value
                  :position $ [] 0 0
                  :on-change $ fn (value d!)
                    d! cursor $ assoc state :value value
                comp-switch $ {}
                  :value $ phlox.util/prop state :value
                  :position $ [] 100 20
                  :title "|Custom title"
                  :on-change $ fn (value d!)
                    d! cursor $ assoc state :value value
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-text-input $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-text-input (states)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
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
                            :initial $ phlox.util/prop-or state :text |
                            :style $ {} $ :color |blue
                          fn (result)
                            d! cursor $ assoc state :text result
                            , &unit
                  text $ {}
                    :text $ phlox.util/prop state :text
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
                            :initial $ phlox.util/prop-or state :long-text |
                            :style $ {} $ :font-family font-code
                            :textarea? true
                          fn (result)
                            d! cursor $ assoc state :long-text result
                            , &unit
                  text $ {}
                    :text $ phlox.util/prop state :long-text
                    :position $ [] 6 4
                    :style $ {} (:font-size 14)
                      :fill $ hslx 0 0 80
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'grid-row $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn grid-row (x)
            -> (range 40)
              map $ fn (y) ([] x y)
          :examples $ []
          :schema $ quote $ Fn Number
            -> $ List $ List Number
        'inline-file $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro inline-file (name)
            read-file $ str |assets/ name
          :examples $ []
          :schema $ quote $ Macro (Expr String)
            -> $ Expr String
            :capabilities :fs-read
        'load-sample-texture $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-sample-texture ()
            .!from PIXI/Texture |https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1a2af589827261.5e022908ed0b1.jpg
          :examples $ []
          :schema $ quote $ Fn
            -> $ JsNullish JsObject
            :features :js-ffi
        'sample-texture $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sample-texture (load-sample-texture)
          :examples $ []
          :schema $ quote $ JsNullish JsObject
        'tabs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def tabs
            [] ([] :drafts |Drafts) ([] :grids |Grids) ([] :curves |Curves) ([] :gradients |Gradients) ([] :keyboard |Keyboard) ([] :slider |Slider) ([] :buttons |Buttons) ([] :points |Points) ([] :switch |Switch) ([] :input |Input) ([] :messages |Messages) ([] :slider-point "|Slider Point") ([] :spin-slider "|Spin Slider") ([] :arrows |Arrows) ([] :shadow |Shadow) ([] :mesh |Mesh)
          :examples $ []
          :schema $ quote $ List (List Dynamic)
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
          :schema $ quote $ Ref (Map Tag Dynamic)
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            when
              and dev? $ not=
                .unwrap-or (nth op 0) :unknown
                , :states
              js/console.log |dispatch! op
            let
                op-id $ js-ffi.contract/expect-string |nanoid $ nanoid
                op-time $ phlox.core/ffi-number $ js/Date.now
              reset! *store $ updater @*store op op-id op-time
              , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Unit) (:features :io :js-ffi :state)
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
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (js-nullish? build-errors)
              do (clear-phlox-caches!) (remove-watch! *store :change)
                add-watch! *store :change $ fn (store prev) (render-app!)
                render-app!
                when true $ replace-control-loop! 8 on-control-event
                hud! |ok~ |OK
              hud! |error build-errors
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render! (comp-container @*store) dispatch! $ {}
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
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
          :schema $ quote $ Map Tag Dynamic
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
                      x0 $ decode-map-as x Number
                    if (> x0 10) 0 $ + x0 1
              (:tab t) (assoc store :tab t)
              (:toggle-keyboard)
                update store :keyboard-on? $ fn (x)
                  not $ decode-map-as x Bool
              (:counted)
                update store :counted $ fn (x)
                  inc $ decode-map-as x Number
              (:states cursor s)
                update-states store
                  decode-map-as cursor $ List Dynamic
                  , s
              (:hydrate-storage d)
                decode-map-as d $ Map Tag Dynamic
              _ $ do (eprintln "|unknown op" op) store
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) Dynamic String Number
            -> $ Map Tag Dynamic
            :features :io
          :tests $ [] $ %{} 'TestEntry (:name |payload-free-demo-operations)
            :code $ quote $ let
                store $ {} (:x 0) (:keyboard-on? false) (:counted 0)
                toggled $ updater store (:: :toggle-keyboard) |test 0
                counted $ updater toggled (:: :counted) |test 0
                incremented $ updater counted (:: :add-x) |test 0
              assert= (Some true) (get toggled :keyboard-on?)
              assert= (Some 1) (get counted :counted)
              assert= (Some 1) (get incremented :x)
            :tags $ #{} :unit
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.app.updater
          :require $ phlox.cursor :refer $ update-states
    'phlox.check $ %{} 'FileEntry
      :defs $ {}
        'dev-check $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro dev-check (data rule) (quasiquote nil)
          :examples $ []
          :schema $ quote $ Macro (Expr Dynamic) (Expr Dynamic)
            -> $ Expr Nil
        'dev-check-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro dev-check-message (message data rule) (quasiquote nil)
          :examples $ []
          :schema $ quote $ Macro (Expr Dynamic) (Expr Dynamic) (Expr Dynamic)
            -> $ Expr Nil
        'lilac-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-circle nil
          :examples $ []
          :schema $ quote Nil
        'lilac-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-color nil
          :examples $ []
          :schema $ quote Nil
        'lilac-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-container nil
          :examples $ []
          :schema $ quote Nil
        'lilac-event-map $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-event-map nil
          :examples $ []
          :schema $ quote Nil
        'lilac-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-graphics nil
          :examples $ []
          :schema $ quote Nil
        'lilac-line-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-line-segments nil
          :examples $ []
          :schema $ quote Nil
        'lilac-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-line-style nil
          :examples $ []
          :schema $ quote Nil
        'lilac-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-point nil
          :examples $ []
          :schema $ quote Nil
        'lilac-polyline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-polyline nil
          :examples $ []
          :schema $ quote Nil
        'lilac-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-rect nil
          :examples $ []
          :schema $ quote Nil
        'lilac-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-text nil
          :examples $ []
          :schema $ quote Nil
        'lilac-text-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-text-style nil
          :examples $ []
          :schema $ quote Nil
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.check
    'phlox.comp.arrow $ %{} 'FileEntry
      :defs $ {} $ 'comp-arrow
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-arrow (states props) (; dev-check props lilac-arrow)
            let
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                from $ decode-map-as (phlox.util/require-prop props :from) (List Number)
                to $ decode-map-as (phlox.util/require-prop props :to) (List Number)
                width $ phlox.util/prop-or props :width 1
                arg-length $ decode-map-as (phlox.util/prop-or props :arm-length 10) Number
                on-change $ phlox.util/prop props :on-change
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
                      if-let (handler on-change) (handler position to d!) (js/console.warn "|missing onchange for arrow")
                comp-drag-point (>> states :to)
                  {} (:position to) (:hide-text? true)
                    :fill $ hslx 200 80 20
                    :on-change $ fn (position d!)
                      if-let (handler on-change) (handler from position d!) (js/console.warn "|missing onchange for arrow")
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
          :schema $ quote $ Fn (Map Dynamic Dynamic) Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.arrow
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list >>
            phlox.check :refer $ lilac-event-map dev-check
            phlox.complex :as complex
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.math :refer $ vec-length
    'phlox.comp.button $ %{} 'FileEntry
      :defs $ {}
        'comp-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-button (props) (dev-check props lilac-button)
            let
                button-text $ decode-map-as (phlox.util/prop-or props :text |BUTTON) String
                size $ decode-map-as (phlox.util/prop-or props :font-size 14) Number
                font-family $ decode-map-as (phlox.util/prop-or props :font-family "|Josefin Sans, sans-serif") String
                fill $ phlox.util/prop-or props :fill $ hslx 0 0 20
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                position $ decode-map-as
                  phlox.util/prop-or props :position $ [] 0 0
                  List Number
                width $ + 16 $ measure-text-width! button-text size font-family
                align-right? $ phlox.util/prop-or props :align-right? false
              container
                {} $ :position $ if align-right?
                  []
                    -
                      .unwrap-or (first position) 0
                      , width
                    .unwrap $ last position
                  , position
                rect $ {} (:fill fill)
                  :size $ [] width 32
                  :on $ match (phlox.util/prop props :on)
                    (:some on) (Some on)
                    (:none)
                      match (phlox.util/prop props :on-pointertap)
                        (:some tap)
                          Some $ {} $ :pointertap tap
                        (:none) None
                text $ {} (:text button-text)
                  :position $ [] 8 8
                  :style $ {} (:fill color) (:font-size size) (:font-family font-family)
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi :state)
        'lilac-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-button nil
          :examples $ []
          :schema $ quote Nil
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
              phlox.util/prop-or states :cursor $ []
              , lilac-cursor
            dev-check props lilac-drag-point
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ decode-map-as
                  .unwrap-or (get states :data)
                    {} (:dragging? false)
                      :x0 $ [] 0 0
                  Map Tag Dynamic
                unit $ decode-map-as (phlox.util/prop-or props :unit 1) Number
                radius $ decode-map-as (phlox.util/prop-or props :radius 8) Number
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                fill $ phlox.util/prop-or props :fill $ hslx 0 0 60
                alpha $ decode-map-as (phlox.util/prop-or props :alpha 1) Number
                on-change $ .unwrap-or (get props :on-change)
                  fn (pos d!) nil
                hide-text? $ phlox.util/prop-or props :hide-text? false
              let
                  position $ phlox.util/prop-or props :position $ [] 0 0
                create-list :container
                  {} $ :position position
                  concat
                    [] $ [] 0 $ circle
                      {} (:radius radius)
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
                            when (phlox.util/prop-or state :dragging? false)
                              let
                                  x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                                  y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                                let
                                    x0 $ decode-map-as (phlox.util/require-prop state :x0) (List Number)
                                  on-change
                                    complex/add
                                      decode-map-as (phlox.util/require-prop state :p0) (List Number)
                                      []
                                        * unit $ - x $ .unwrap-or (first x0) 0
                                        * unit $ - y $ .unwrap-or (last x0) 0
                                    , d!
                          :pointerup $ fn (e d!)
                            d! cursor $ assoc state :dragging? false
                          :pointerupoutside $ fn (e d!)
                            d! cursor $ assoc state :dragging? false
                    if hide-text? ([])
                      [] $ [] 1 $ text
                        {}
                          :text $ str "|("
                            .!toFixed
                              .unwrap-or (first position) 0
                              , 1
                            , "|, "
                              .!toFixed
                                .unwrap-or (last position) 0
                                , 1
                              , "|)➤" $ str unit
                          :alpha $ * alpha 0.3
                          :position $ [] -20 -16
                          :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "|Menlo, monospace")
                    if
                      and (not hide-text?)
                        .some? $ phlox.util/prop props :title
                      [] $ [] 2 $ text
                        {}
                          :text $ phlox.util/prop props :title
                          :alpha $ * alpha 0.3
                          :position $ [] -12 6
                          :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "|Menlo, monospace") (:align :center)
                      []
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'lilac-cursor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-cursor nil
          :examples $ []
          :schema $ quote Nil
        'lilac-drag-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-drag-point nil
          :examples $ []
          :schema $ quote Nil
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
                messages $ decode-map-as
                  phlox.util/prop-or options :messages $ []
                  List Dynamic
                bottom? $ phlox.util/prop-or options :bottom? false
                base-position $ .unwrap-or (get options :position)
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
                on-pointertap $ .unwrap-or (get options :on-pointertap)
                  fn (x d!) (println "|missing message handler:" x)
              create-list :container
                {} $ :position base-position
                -> messages $ map-indexed $ fn (idx message)
                  [] (phlox.util/require-prop message :id)
                    comp-button $ {}
                      :text $ phlox.util/prop message :text
                      :position $ if bottom?
                        [] 0 $ - 8 $ * 40
                          - (count messages) idx
                        [] 0 $ * 40 idx
                      :color $ phlox.util/prop options :color
                      :fill $ phlox.util/prop options :fill
                      :align-right? true
                      :on-pointertap $ fn (e d!) (on-pointertap message d!)
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :io :js-ffi :state)
        'lilac-message-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-message-list nil
          :examples $ []
          :schema $ quote Nil
        'lilac-messages $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-messages nil
          :examples $ []
          :schema $ quote Nil
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.comp.messages
          :require
            phlox.core :refer $ g hslx rect circle text container graphics create-list
            phlox.check :refer $ lilac-event-map dev-check lilac-point
            phlox.comp.button :refer $ comp-button
    'phlox.comp.slider $ %{} 'FileEntry
      :defs $ {}
        '*prev-spin-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *prev-spin-point None
          :examples $ []
          :schema $ quote $ Ref
            Option $ List Number
        '*spin-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *spin-pivot ([] 0 0)
          :examples $ []
          :schema $ quote $ Ref (List Number)
        'comp-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider (states props)
            dev-check
              phlox.util/prop-or states :cursor $ []
              , lilac-cursor
            dev-check props lilac-slider
            let
                value $ decode-map-as (phlox.util/prop-or props :value 1) Number
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} (:v0 value) (:x0 0) (:dragging? false)
                title $ phlox.util/prop props :title
                unit $ decode-map-as (phlox.util/prop-or props :unit 0.1) Number
                fill $ phlox.util/prop-or props :fill $ hslx 0 0 30
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                on-change $ phlox.util/prop props :on-change
                rounded? $ phlox.util/prop-or props :round? false
              container
                {} $ :position $ phlox.util/prop props :position
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
                        when (phlox.util/prop-or state :dragging? false)
                          let
                              x2 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                            if-let (handler on-change)
                              handler
                                let
                                    v0 $ +
                                      decode-map-as (phlox.util/prop-or state :v0 value) Number
                                      * unit $ - x2 $ decode-map-as (phlox.util/prop-or state :x0 0) Number
                                    v1 $ if rounded? (round v0) v0
                                    v2 $ if
                                      .some? $ phlox.util/prop props :max
                                      &min
                                        decode-map-as (phlox.util/prop-or props :max v1) Number
                                        , v1
                                      , v1
                                  if
                                    .some? $ phlox.util/prop props :min
                                    &max
                                      decode-map-as (phlox.util/prop-or props :min v2) Number
                                      , v2
                                    , v2
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
                      match title
                        (:some t)
                          if (string? t) (str t "| ") |
                        (:none) |
                      , "|◈ " unit
                    :position $ [] 0 -18
                    :style $ {}
                      :fill $ hslx 0 0 80
                      :font-size 13
                      :font-family "|Arial, sans-serif"
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-slider-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider-point (states props)
            dev-check
              phlox.util/prop-or states :cursor $ []
              , lilac-cursor
            dev-check props lilac-slider-point
            let
                value $ decode-map-as (phlox.util/prop-or props :value 1) Number
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} (:v0 value) (:x0 0) (:dragging? false)
                unit $ decode-map-as (phlox.util/prop-or props :unit 0.1) Number
                fill $ phlox.util/prop-or props :fill $ hslx 0 0 30
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                on-change $ phlox.util/prop props :on-change
                rounded? $ phlox.util/prop-or props :round? false
              container
                {} $ :position $ phlox.util/prop props :position
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
                        when (phlox.util/prop-or state :dragging? false)
                          let
                              x2 $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                            if-let (handler on-change)
                              handler
                                let
                                    v0 $ +
                                      decode-map-as (phlox.util/prop-or state :v0 value) Number
                                      * unit $ - x2 $ decode-map-as (phlox.util/prop-or state :x0 0) Number
                                    v1 $ if rounded? (round v0) v0
                                    v2 $ if
                                      .some? $ phlox.util/prop props :max
                                      &min
                                        decode-map-as (phlox.util/prop-or props :max v1) Number
                                        , v1
                                      , v1
                                  if
                                    .some? $ phlox.util/prop props :min
                                    &max
                                      decode-map-as (phlox.util/prop-or props :min v2) Number
                                      , v2
                                    , v2
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
          :schema $ quote $ Fn Dynamic Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-spin-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-spin-slider (states props)
            let
                cursor $ phlox.util/prop-or states :cursor $ []
                state $ .unwrap-or (get states :data)
                  {} $ :dragging? false
                unit $ decode-map-as (phlox.util/prop-or props :unit 1) Number
                radius $ decode-map-as (phlox.util/prop-or props :radius 44) Number
                color $ phlox.util/prop-or props :color $ hslx 0 0 100
                fill $ phlox.util/prop-or props :fill $ hslx 0 0 0
                font-size $ phlox.util/prop-or props :font-size $ &* radius 0.44
                alpha $ phlox.util/prop-or props :alpha 1
                on-change $ phlox.util/prop props :on-change
                position $ decode-map-as
                  phlox.util/prop-or props :position $ [] 0 0
                  List Number
                on-move $ .unwrap-or (get props :on-move)
                  fn (pos d!) nil
                border-color $ phlox.util/prop-or props :border-color $ hslx 240 80 80
                border-width $ phlox.util/prop-or props :border-width 4
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
                        reset! *prev-spin-point $ Some $ [] 0 0
                        d! cursor $ assoc state :dragging? true
                    :globalpointermove $ fn (e d!)
                      let
                          x $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x
                          y $ -> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y
                        if (phlox.util/prop-or state :dragging? false)
                          let
                              current-point $ []
                                - x $ .unwrap-or (first @*spin-pivot) 0
                                - y $ .unwrap-or (last @*spin-pivot) 0
                              prev-point @*prev-spin-point
                            if
                              < (vec-length current-point) (&* 0.5 radius)
                              reset! *prev-spin-point None
                              do
                                when-let (prev-point prev-point)
                                  let
                                      delta-vec $ rebase current-point prev-point
                                      delta $ phlox.core/ffi-atan2
                                        .unwrap-or (last delta-vec) 0
                                        .unwrap-or (first delta-vec) 0
                                    if-let (handler on-change)
                                      handler
                                        bound-x
                                          +
                                            decode-map-as (phlox.util/prop-or props :value 0) Number
                                            &* unit delta
                                          phlox.util/prop props :min
                                          phlox.util/prop props :max
                                        , d!
                                      js/console.warn "|missing :on-change for spin-slider"
                                reset! *prev-spin-point $ Some current-point
                    :pointerup $ fn (e d!) (reset! *prev-spin-point None)
                      d! cursor $ assoc state :dragging? false
                    :pointerupoutside $ fn (e d!) (reset! *prev-spin-point None)
                      d! cursor $ assoc state :dragging? false
                text $ {}
                  :text $ str $ match (phlox.util/prop props :value)
                    (:some v)
                      if (number? v)
                        .!toFixed v $ phlox.util/prop-or props :fraction 1
                        , |-
                    (:none) |-
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
          :schema $ quote $ Fn (Map Dynamic Dynamic) Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi :state)
        'lilac-cursor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-cursor nil
          :examples $ []
          :schema $ quote Nil
        'lilac-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-slider nil
          :examples $ []
          :schema $ quote Nil
        'lilac-slider-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-slider-point nil
          :examples $ []
          :schema $ quote Nil
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
                value $ phlox.util/prop-or props :value false
                on-change $ phlox.util/prop props :on-change
              container
                {} $ :position $ phlox.util/prop-or props :position ([] 0 0)
                rect $ {}
                  :size $ [] 56 20
                  :fill $ if value (hslx 0 0 92) (hslx 0 0 50)
                  :position $ [] 0 0
                  :radius 3
                  :on $ {} $ :pointertap
                    fn (e d!)
                      if-let (handler on-change)
                        handler (not value) d!
                        , &unit
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
                  :text $ phlox.util/prop-or props :title |Switch
                  :position $ [] 0 -20
                  :style $ {}
                    :fill $ hslx 0 0 80
                    :font-size 13
                    :font-family "|Arial, sans-serif"
                  :alpha 1
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'lilac-switch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-switch nil
          :examples $ []
          :schema $ quote Nil
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
                step $ decode-map-as (phlox.util/prop-or options :step 36) Number
                position $ decode-map-as
                  phlox.util/prop-or options :position $ [] 0 0
                  List Number
                font-family $ phlox.util/prop-or options :font-family "|Josefin Sans, sans-serif"
              create-list :container ({})
                -> tabs $ map-indexed $ fn (idx info)
                  let[] (tab title)
                    decode-map-as info $ List Dynamic
                    [] idx $ container
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
          :schema $ quote $ Fn (List Dynamic) Dynamic Dynamic Dynamic (-> phlox.schema/PhloxElement) (:features :js-ffi)
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
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'conjugate $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn conjugate (pair) (update pair 1 negate)
          :examples $ []
          :schema $ quote $ Fn (List Number)
            -> $ List Number
        'divide-by $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn divide-by (point x)
            []
              /
                .unwrap-or (first point) 0
                , x
              /
                .unwrap-or (last point) 0
                , x
          :examples $ []
          :schema $ quote $ Fn (List Number) Number
            -> $ List Number
        'minus $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn minus (v1 v2)
            let[] (a b) v1 $ let[] (x y) v2 $ [] (- a x) (- b y)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'polar-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn polar-point (angle r)
            []
              * r $ phlox.core/ffi-cos angle
              * r $ phlox.core/ffi-sin angle
          :examples $ []
          :schema $ quote $ Fn Number Number
            -> $ List Number
        'rand-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-point (n & xs)
            let
                m0 $ .unwrap-or (first xs) n
              []
                - n $ floor $ * (random) (* 2 n)
                - m0 $ floor $ * (random) (* 2 m0)
          :examples $ []
          :schema $ quote $ Fn Number (& Number)
            -> $ List Number
            :features :js-ffi
        'rebase $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rebase (value base) "|complex number division, renamed since naming collision"
            let[] (x y) value $ let[] (a b) base $ let
                inverted $ / 1 $ + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn scale (pair v)
            map pair $ fn (x) (* v x)
          :examples $ []
          :schema $ quote $ Fn (List Number) Number
            -> $ List Number
        'times $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn times (v1 v2)
            let[] (a b) v1 $ let[] (x y) v2 $ []
              - (* a x) (* b y)
              + (* a y) (* b x)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.complex
          :require $ js-ffi.browser :refer $ random
    'phlox.config $ %{} 'FileEntry
      :defs $ {}
        'MobileDetectHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait MobileDetectHost
            .mobile $ Fn MobileDetectHost $ -> (JsNullish String)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'detect-mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn detect-mobile? ()
            js-present? $ .!mobile $ unsafe-coerce (new mobile-detect js/window.navigator.userAgent) MobileDetectHost
          :examples $ []
          :schema $ quote $ Fn (-> Bool) (:features :js-ffi)
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $ .unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ quote Bool
        'mobile? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mobile? (detect-mobile?)
          :examples $ []
          :schema $ quote Bool
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.config
          :require $ |mobile-detect :default mobile-detect
    'phlox.core $ %{} 'FileEntry
      :defs $ {}
        '*app $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *app None
          :examples $ []
          :schema $ quote $ Ref (Option PixiAppHost)
        '*dispatch-fn $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *dispatch-fn
            fn (& args) nil
          :examples $ []
          :schema $ quote $ Ref Dynamic
        '*drag-moving-cache $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *drag-moving-cache None
          :examples $ []
          :schema $ quote $ Ref
            Option $ List Number
        '*events-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *events-element nil
          :examples $ []
          :schema $ quote $ Ref Dynamic
        '*renderer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *renderer nil
          :examples $ []
          :schema $ quote $ Ref Dynamic
        '*stage-config $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *stage-config
            {}
              :move $ [] 0 0
              :scale 1
          :examples $ []
          :schema $ quote $ Ref (Map Tag Dynamic)
        '*tree-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *tree-element None
          :examples $ []
          :schema $ quote $ Ref (Option schema/PhloxElement)
        '>> $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn >> (states k)
            let
                parent-cursor $ phlox.util/prop-or states :cursor $ []
                branch $ decode-map-as
                  let
                      value $ .unwrap-or (get states k) ({})
                    if (map? value) value $ raise |expected-child-state-map
                  Map Dynamic Dynamic
              assoc branch :cursor $ conj
                decode-map-as parent-cursor $ List Dynamic
                , k
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) Dynamic
            -> $ Map Dynamic Dynamic
          :tests $ []
            %{} 'TestEntry (:name |missing-branch)
              :code $ quote $ assert= ([] :root :child)
                .unwrap $ get
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
                assert= 7 $ .unwrap $ get child :value
                assert= ([] :root :child)
                  .unwrap $ get child :cursor
            %{} 'TestEntry (:name |rejects-non-map-branch)
              :code $ quote $ assert= true
                try
                  >>
                    {} $ :child 7
                    , :child
                  fn (e) true
            %{} 'TestEntry (:name |numeric-child-state-roundtrip)
              :code $ quote $ let
                  store $ phlox.cursor/update-states
                    {} $ :states $ {}
                    [] :demo 0 :drag
                    {} $ :dragging? true
                  root $ >>
                    .unwrap $ get store :states
                    , :demo
                  row $ >> root 0
                  drag $ >> row :drag
                assert= ([] :demo 0 :drag)
                  .unwrap $ get drag :cursor
                assert=
                  {} $ :dragging? true
                  .unwrap $ get drag :data
              :tags $ #{} :unit
            %{} 'TestEntry (:name |string-child-state-and-numeric-sibling)
              :code $ quote $ let
                  states $ {}
                    :cursor $ [] :demo
                    |frequency:0 $ {} $ :data 3
                    0 $ {} $ :data 8
                  child $ >> states |frequency:0
                assert= ([] :demo |frequency:0)
                  .unwrap $ get child :cursor
                assert= 3 $ .unwrap $ get child :data
                assert=
                  {} $ :data 8
                  .unwrap $ get states 0
              :tags $ #{} :unit
        'AppendableHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait AppendableHost
            .appendChild $ Fn AppendableHost Dynamic $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'CanvasContextHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait CanvasContextHost (:font 'String)
            .measureText $ Fn CanvasContextHost String $ -> phlox.core/TextMetricsHost
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :writable $ #{} :font
          :schema $ quote Trait
        'CanvasHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait CanvasHost
            .getContext $ Fn CanvasHost String $ -> JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'ColorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ColorHost
            .toNumber $ Fn ColorHost $ -> Number
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'DestroyableHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DestroyableHost
            .destroy $ Fn DestroyableHost $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'DocumentHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DocumentHost (:body 'JsObject)
            .createElement $ Fn DocumentHost String $ -> JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'DomEventHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait DomEventHost (:clientX 'Number) (:clientY 'Number) (:data 'PixiEventDataHost) (:deltaY 'Number) (:key 'String) (:keyCode 'Number) (:ctrlKey 'Bool) (:metaKey 'Bool) (:shiftKey 'Bool)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'EventTargetHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait EventTargetHost
            .addEventListener $ Fn EventTargetHost String
              Fn phlox.core/DomEventHost $ -> Dynamic
              -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'EventTargetWithOptionsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait EventTargetWithOptionsHost
            .addEventListener $ Fn EventTargetWithOptionsHost String
              Fn phlox.core/DomEventHost $ -> Dynamic
              , Dynamic $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'FontFaceObserverHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait FontFaceObserverHost
            .load $ Fn FontFaceObserverHost $ -> phlox.core/PromiseHost
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'HsluvHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait HsluvHost (:hsluv_h 'Number) (:hsluv_s 'Number) (:hsluv_l 'Number) (:rgb_r 'Number) (:rgb_g 'Number) (:rgb_b 'Number)
            .hsluvToRgb $ Fn HsluvHost $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'JsArrayHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait JsArrayHost
            .push $ Fn JsArrayHost Dynamic $ -> Number
            .forEach $ Fn JsArrayHost
              Fn Dynamic $ -> Dynamic
              -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'JsEntriesHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait JsEntriesHost
            .forEach $ Fn JsEntriesHost
              Fn phlox.core/JsEntryHost $ -> Unit
              -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'JsEntryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait JsEntryHost (:0 'String) (:1 'Dynamic)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiAnchorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiAnchorHost
            .set $ Fn PixiAnchorHost Dynamic $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiAnchoredHost $ %{} 'CodeEntry
          :doc "|A Pixi Sprite or Text: a display object that also has an anchor point."
          :code $ quote $ deftrait PixiAnchoredHost (:anchor 'PixiAnchorHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiAppHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiAppHost (:renderer 'PixiRendererHost) (:stage 'PixiDisplayHost) (:ticker 'PixiTickerHost) (:view 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiContainerHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiContainerHost
            .addChild $ Fn PixiContainerHost Dynamic $ -> Unit
            .addChildAt $ Fn PixiContainerHost Dynamic Number $ -> Unit
            .getChildAt $ Fn PixiContainerHost Number $ -> JsObject
            .removeChildAt $ Fn PixiContainerHost Number $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiDisplayHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiDisplayHost (:alpha 'Number) (:angle 'Number) (:rotation 'Number) (:pivot 'PixiVectorHost) (:position 'PixiVectorHost) (:scale 'PixiVectorHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :writable $ #{} :alpha :angle :rotation
          :schema $ quote Trait
        'PixiEventDataHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiEventDataHost (:global 'PixiVectorHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiGeometryHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiGeometryHost
            .addAttribute $ Fn PixiGeometryHost Dynamic Dynamic Dynamic $ -> Unit
            .addIndex $ Fn PixiGeometryHost Dynamic $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiMeshHost $ %{} 'CodeEntry
          :doc "|A Pixi Mesh: a display object that also carries its shader."
          :code $ quote $ deftrait PixiMeshHost (:shader 'PixiShaderHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiPluginsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiPluginsHost (:accessibility 'DestroyableHost)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiRendererHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiRendererHost (:plugins 'PixiPluginsHost)
            .render $ Fn PixiRendererHost Dynamic $ -> Unit
            .resize $ Fn PixiRendererHost Number Number $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiScaleHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiScaleHost
            .set $ Fn PixiScaleHost Number Number $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiShaderHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiShaderHost (:uniforms 'JsObject)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiTickerHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiTickerHost
            .stop $ Fn PixiTickerHost $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PixiVectorHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PixiVectorHost (:x 'Number) (:y 'Number)
            .set $ Fn PixiVectorHost Number Number $ -> Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'PromiseHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait PromiseHost
            .then $ Fn PromiseHost
              Fn Dynamic $ -> Dynamic
              -> Dynamic
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'TextMetricsHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait TextMetricsHost (:width 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ quote Trait
        'circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn circle (props & children) (dev-check props lilac-circle) (create-element :circle props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'clear-phlox-caches! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn clear-phlox-caches! () &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn container (props & children) (dev-check props lilac-container) (create-element :container props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'create-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-element (tag props children)
            schema/PhloxElement :name tag :props props :children $ remove-nil-values $ index-items children
          :examples $ []
          :schema $ quote $ Fn Tag (Map Tag Dynamic) (List Dynamic) (-> schema/PhloxElement)
        'create-list $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-list (tag props children)
            schema/PhloxElement :name tag :props props :children $ remove-nil-values $ decode-map-as children
              List $ List Dynamic
          :examples $ []
          :schema $ quote $ Fn Tag (Map Tag Dynamic) (List Dynamic) (-> schema/PhloxElement)
        'defcomp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro defcomp (name params & body)
            quasiquote $ defn ~name ~params ~@body
          :examples $ []
          :schema $ quote $ Macro SyntaxSymbol SyntaxList (& Syntax)
            -> $ Definition Fn
        'ffi-abs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-abs (value)
            js-ffi.contract/expect-number |Math.abs $ js/Math.abs value
          :examples $ []
          :schema $ quote $ Fn Number (-> Number) (:features :js-ffi)
        'ffi-accessibility $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-accessibility (plugins) (.-accessibility plugins)
          :examples $ []
          :schema $ quote $ Fn PixiPluginsHost (-> DestroyableHost) (:features :js-ffi)
        'ffi-add-child $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-child (parent child) (.addChild parent child) &unit
          :examples $ []
          :schema $ quote $ Fn PixiContainerHost Dynamic (-> Unit) (:features :js-ffi)
        'ffi-add-event-listener $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-event-listener (target event callback) (.addEventListener target event callback) &unit
          :examples $ []
          :schema $ quote $ Fn EventTargetHost String
            Fn DomEventHost $ -> Dynamic
            -> Unit
            :features :js-ffi
        'ffi-add-event-listener-options $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-add-event-listener-options (target event callback options) (.addEventListener target event callback options) &unit
          :examples $ []
          :schema $ quote $ Fn EventTargetWithOptionsHost String
            Fn DomEventHost $ -> Dynamic
            , Dynamic (-> Unit) (:features :js-ffi)
        'ffi-anchor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-anchor (target) (.-anchor target)
          :examples $ []
          :schema $ quote $ Fn PixiAnchoredHost (-> PixiAnchorHost) (:features :js-ffi)
        'ffi-append-child $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-append-child (parent child)
            .!appendChild (unsafe-coerce parent AppendableHost) child
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'ffi-atan2 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-atan2 (y x)
            js-ffi.contract/expect-number |Math.atan2 $ js/Math.atan2 y x
          :examples $ []
          :schema $ quote $ Fn Number Number (-> Number) (:features :js-ffi)
        'ffi-bool $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-bool (value) (js-ffi.contract/expect-bool |Phlox.boolean value)
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Bool) (:features :js-ffi)
        'ffi-cos $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-cos (value)
            js-ffi.contract/expect-number |Math.cos $ js/Math.cos value
          :examples $ []
          :schema $ quote $ Fn Number (-> Number) (:features :js-ffi)
        'ffi-create-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-create-element (document tag) (.createElement document tag)
          :examples $ []
          :schema $ quote $ Fn DocumentHost String (-> JsObject) (:features :js-ffi)
        'ffi-destroy $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-destroy (target) (.destroy target) &unit
          :examples $ []
          :schema $ quote $ Fn DestroyableHost (-> Unit) (:features :js-ffi)
        'ffi-document-body $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-document-body (document) (.-body document)
          :examples $ []
          :schema $ quote $ Fn DocumentHost (-> JsObject) (:features :js-ffi)
        'ffi-entry-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-entry-key (entry) (.-0 entry)
          :examples $ []
          :schema $ quote $ Fn JsEntryHost (-> String) (:features :js-ffi)
        'ffi-entry-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-entry-value (entry) (.-1 entry)
          :examples $ []
          :schema $ quote $ Fn JsEntryHost (-> Dynamic) (:features :js-ffi)
        'ffi-event-client-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-client-x (event) (.-clientX event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Number) (:features :js-ffi)
        'ffi-event-client-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-client-y (event) (.-clientY event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Number) (:features :js-ffi)
        'ffi-event-ctrl? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-ctrl? (event) (.-ctrlKey event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Bool) (:features :js-ffi)
        'ffi-event-data $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-data (event)
            .-data $ unsafe-coerce event DomEventHost
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> PixiEventDataHost) (:features :js-ffi)
        'ffi-event-delta-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-delta-y (event) (.-deltaY event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Number) (:features :js-ffi)
        'ffi-event-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-key (event) (.-key event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> String) (:features :js-ffi)
        'ffi-event-key-code $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-key-code (event) (.-keyCode event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Number) (:features :js-ffi)
        'ffi-event-meta? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-meta? (event) (.-metaKey event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Bool) (:features :js-ffi)
        'ffi-event-shift? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-event-shift? (event) (.-shiftKey event)
          :examples $ []
          :schema $ quote $ Fn DomEventHost (-> Bool) (:features :js-ffi)
        'ffi-for-each $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-for-each (items callback)
            .!forEach (unsafe-coerce items JsArrayHost) callback
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic
            Fn Dynamic $ -> Dynamic
            -> Unit
            :features :js-ffi
        'ffi-geometry-add-attribute! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-geometry-add-attribute! (target id buffer size)
            .!addAttribute (unsafe-coerce target PixiGeometryHost) id buffer size
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'ffi-geometry-add-index! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-geometry-add-index! (target index)
            .!addIndex (unsafe-coerce target PixiGeometryHost) index
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'ffi-get-context $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-get-context (element kind) (.getContext element kind)
          :examples $ []
          :schema $ quote $ Fn CanvasHost String (-> JsObject) (:features :js-ffi)
        'ffi-global $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-global (data) (.-global data)
          :examples $ []
          :schema $ quote $ Fn PixiEventDataHost (-> PixiVectorHost) (:features :js-ffi)
        'ffi-load-font $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-load-font (font)
            .load $ js-cast font 'phlox.core/FontFaceObserverHost
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> PromiseHost) (:features :js-ffi)
        'ffi-measure-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-measure-text (context text) (.measureText context text)
          :examples $ []
          :schema $ quote $ Fn CanvasContextHost String (-> TextMetricsHost) (:features :js-ffi)
        'ffi-nullish? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-nullish? (value)
            nil? $ unsafe-coerce value Dynamic
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Bool) (:features :js-ffi)
        'ffi-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-number (value) (js-ffi.contract/expect-number |Phlox.number value)
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Number) (:features :js-ffi)
        'ffi-object-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-object-x (value) (.-x value)
          :examples $ []
          :schema $ quote $ Fn PixiVectorHost (-> Number) (:features :js-ffi)
        'ffi-object-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-object-y (value) (.-y value)
          :examples $ []
          :schema $ quote $ Fn PixiVectorHost (-> Number) (:features :js-ffi)
        'ffi-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-pivot (target) (.-pivot target)
          :examples $ []
          :schema $ quote $ Fn PixiDisplayHost (-> PixiVectorHost) (:features :js-ffi)
        'ffi-plugins $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-plugins (renderer) (.-plugins renderer)
          :examples $ []
          :schema $ quote $ Fn PixiRendererHost (-> PixiPluginsHost) (:features :js-ffi)
        'ffi-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-position (target) (.-position target)
          :examples $ []
          :schema $ quote $ Fn PixiDisplayHost (-> PixiVectorHost) (:features :js-ffi)
        'ffi-push-array! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-push-array! (xs x)
            js-ffi.contract/expect-number |Array.push $ .!push (unsafe-coerce xs JsArrayHost) x
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Number) (:features :js-ffi)
        'ffi-random $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-random () (browser/random)
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'ffi-render $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-render (renderer stage) (.render renderer stage) &unit
          :examples $ []
          :schema $ quote $ Fn PixiRendererHost Dynamic (-> Unit) (:features :js-ffi)
        'ffi-renderer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-renderer (app) (.-renderer app)
          :examples $ []
          :schema $ quote $ Fn PixiAppHost (-> PixiRendererHost) (:features :js-ffi)
        'ffi-resize $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-resize (renderer width height) (.resize renderer width height) &unit
          :examples $ []
          :schema $ quote $ Fn PixiRendererHost Number Number (-> Unit) (:features :js-ffi)
        'ffi-scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-scale (target) (.-scale target)
          :examples $ []
          :schema $ quote $ Fn PixiDisplayHost (-> PixiVectorHost) (:features :js-ffi)
        'ffi-set-anchor! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-anchor! (anchor value) (.set anchor value) &unit
          :examples $ []
          :schema $ quote $ Fn PixiAnchorHost Dynamic (-> Unit) (:features :js-ffi)
        'ffi-set-font! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-font! (context font)
            set! (.-font context) font
            , &unit
          :examples $ []
          :schema $ quote $ Fn CanvasContextHost String (-> Unit) (:features :js-ffi)
        'ffi-set-scale! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-scale! (target x y) (.set target x y) &unit
          :examples $ []
          :schema $ quote $ Fn PixiVectorHost Number Number (-> Unit) (:features :js-ffi)
        'ffi-set-x! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-x! (target value)
            set! (.-x target) value
            , &unit
          :examples $ []
          :schema $ quote $ Fn PixiVectorHost Number (-> Unit) (:features :js-ffi)
        'ffi-set-y! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-set-y! (target value)
            set! (.-y target) value
            , &unit
          :examples $ []
          :schema $ quote $ Fn PixiVectorHost Number (-> Unit) (:features :js-ffi)
        'ffi-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-shader (target) (.-shader target)
          :examples $ []
          :schema $ quote $ Fn PixiMeshHost (-> PixiShaderHost) (:features :js-ffi)
        'ffi-sin $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-sin (value)
            js-ffi.contract/expect-number |Math.sin $ js/Math.sin value
          :examples $ []
          :schema $ quote $ Fn Number (-> Number) (:features :js-ffi)
        'ffi-stage $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-stage (app) (.-stage app)
          :examples $ []
          :schema $ quote $ Fn PixiAppHost (-> PixiDisplayHost) (:features :js-ffi)
        'ffi-stop $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-stop (target) (.stop target) &unit
          :examples $ []
          :schema $ quote $ Fn PixiTickerHost (-> Unit) (:features :js-ffi)
        'ffi-text-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-text-width (metrics) (.-width metrics)
          :examples $ []
          :schema $ quote $ Fn TextMetricsHost (-> Number) (:features :js-ffi)
        'ffi-then $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-then (promise callback) (.then promise callback)
          :examples $ []
          :schema $ quote $ Fn PromiseHost
            Fn Dynamic $ -> Dynamic
            -> Dynamic
            :features :js-ffi
        'ffi-ticker $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-ticker (app) (.-ticker app)
          :examples $ []
          :schema $ quote $ Fn PixiAppHost (-> PixiTickerHost) (:features :js-ffi)
        'ffi-uniforms $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-uniforms (shader) (.-uniforms shader)
          :examples $ []
          :schema $ quote $ Fn PixiShaderHost (-> JsObject) (:features :js-ffi)
        'ffi-view $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-view (app) (.-view app)
          :examples $ []
          :schema $ quote $ Fn PixiAppHost (-> JsObject) (:features :js-ffi)
        'ffi-window-height $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-window-height ()
            let
                viewport $ browser/viewport
              viewport :height
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'ffi-window-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn ffi-window-width ()
            let
                viewport $ browser/viewport
              viewport :width
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'g $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn g (op & args)
            match (first args)
              (:none) ([] op)
              (:some data)
                do
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
          :schema $ quote $ Fn Tag (& Dynamic)
            -> $ List Dynamic
            :features :js-ffi
        'get-app $ %{} 'CodeEntry
          :doc "|the Pixi application created by render!, fails before the first render"
          :code $ quote $ defn get-app () (.unwrap @*app)
          :examples $ []
          :schema $ quote $ Fn (-> PixiAppHost) (:features :js-ffi :state)
        'graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn graphics (props & children) (dev-check props lilac-graphics) (create-element :graphics props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'group $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn group (props & children) (dev-check props lilac-container)
            noted "|which is an alias of container" $ create-element :container props children
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'handle-drag-moving $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-drag-moving (el)
            ffi-add-event-listener (js-cast el 'phlox.core/EventTargetHost) |mousedown $ fn (event)
              reset! *drag-moving-cache $ Some $ [] (ffi-event-client-x event) (ffi-event-client-y event)
            ffi-add-event-listener (js-cast el 'phlox.core/EventTargetHost) |mouseup $ fn (event) (reset! *drag-moving-cache None)
            ffi-add-event-listener (js-cast el 'phlox.core/EventTargetHost) |mousemove $ fn (event)
              when
                or (ffi-event-meta? event) (ffi-event-ctrl? event) (ffi-event-shift? event)
                match @*drag-moving-cache
                  (:none) &unit
                  (:some prev)
                    let
                        current $ [] (ffi-event-client-x event) (ffi-event-client-y event)
                        delta $ complex/minus current prev
                      reset! *drag-moving-cache $ Some current
                      swap! *stage-config update :move $ fn (prev)
                        unsafe-coerce
                          complex/add
                            decode-map-as prev $ List Number
                            , delta
                          , Dynamic
                      render-stage-for-viewer!
            ffi-add-event-listener-options (js-cast el 'phlox.core/EventTargetWithOptionsHost) |wheel
              fn (event)
                if
                  or (ffi-event-meta? event) (ffi-event-ctrl? event) (ffi-event-shift? event)
                  let
                      dy $ * 0.001 $ ffi-event-delta-y event
                      scale $ decode-map-as
                        .unwrap-or (get @*stage-config :scale) 1
                        , 'Number
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
                              pos0 $ decode-map-as pos $ List Number
                              shift $ complex/minus pointer pos0
                            complex/minus pos0 $ complex/times shift $ [] (/ dy scale) 0
                          , Dynamic
                      swap! *stage-config update :scale $ fn (x)
                        unsafe-coerce
                          + (decode-map-as x Number) dy
                          , Dynamic
                      render-stage-for-viewer!
              js-object $ :passive true
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Unit) (:features :js-ffi :state)
        'hclx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hclx (h c l)
            js-ffi.contract/expect-number |Color.toNumber $ .!toNumber $ unsafe-coerce
              new Color $ hcl-to-hex h c l
              , ColorHost
          :examples $ []
          :schema $ quote $ Fn Number Number Number (-> Number) (:features :js-ffi)
        'hsluvx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hsluvx (h c l)
            let
                conv $ unsafe-coerce (new Hsluv) HsluvHost
              set! (.-hsluv_h conv) h
              set! (.-hsluv_s conv) c
              set! (.-hsluv_l conv) l
              .!hsluvToRgb conv
              js-ffi.contract/expect-number |Color.toNumber $ .!toNumber $ unsafe-coerce
                new Color $ js-array (.-rgb_r conv) (.-rgb_g conv) (.-rgb_b conv)
                , ColorHost
          :examples $ []
          :schema $ quote $ Fn Number Number Number (-> Number) (:features :js-ffi)
        'hslx $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn hslx (h s l)
            js-ffi.contract/expect-number |Color.toNumber $ .!toNumber $ unsafe-coerce
              new Color $ js-object (:h h) (:s s) (:l l) (:a 1)
              , ColorHost
          :examples $ []
          :schema $ quote $ Fn Number Number Number (-> Number) (:features :js-ffi)
        'image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn image (props & children) (dev-check props lilac-image) (create-element :image props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'init-pixi-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-pixi-app! (options)
            let
                raw-app $ new PIXI/Application $ js-object (:antialias true) (:autoDensity true) (:autoStart false) (:resolution 2)
                  :width $ ffi-window-width
                  :height $ ffi-window-height
                  :backgroundColor $ phlox.util/prop-or options :background-color $ hslx 0 0 0
                  :interactive $ phlox.util/prop-or options :interactive true
                  :backgroundAlpha $ phlox.util/prop-or options :background-alpha 1
                pixi-app $ js-cast raw-app 'phlox.core/PixiAppHost
              ffi-stop $ ffi-ticker pixi-app
              ffi-stop $ js-cast (.-shared PIXI/Ticker) 'phlox.core/PixiTickerHost
              ffi-stop $ js-cast (.-system PIXI/Ticker) 'phlox.core/PixiTickerHost
              reset! *app $ Some pixi-app
              let
                  el $ ffi-view pixi-app
                -> (js-cast js/document 'phlox.core/DocumentHost) ffi-document-body $ ffi-append-child el
                handle-drag-moving el
              -> pixi-app ffi-renderer ffi-plugins ffi-accessibility $ ffi-destroy
              ffi-add-event-listener (js-cast js/window 'phlox.core/EventTargetHost) |resize $ fn (event)
                -> pixi-app ffi-renderer $ ffi-resize (ffi-window-width) (ffi-window-height)
                render-stage-for-viewer!
              , pixi-app
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (-> PixiAppHost) (:features :js-ffi :state)
        'lilac-arc $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-arc nil
          :examples $ []
          :schema $ quote Nil
        'lilac-arc-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-arc-to nil
          :examples $ []
          :schema $ quote Nil
        'lilac-begin-fill $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-begin-fill nil
          :examples $ []
          :schema $ quote Nil
        'lilac-bezier-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-bezier-to nil
          :examples $ []
          :schema $ quote Nil
        'lilac-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-image nil
          :examples $ []
          :schema $ quote Nil
        'lilac-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-mesh nil
          :examples $ []
          :schema $ quote Nil
        'lilac-quadratic-to $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-quadratic-to nil
          :examples $ []
          :schema $ quote Nil
        'line-segment->ops $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn line-segment->ops (pair)
            let
                pair0 $ decode-map-as pair $ List Dynamic
              []
                g :move-to $ .unwrap $ nth pair0 0
                g :line-to $ .unwrap $ nth pair0 1
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ List $ List Dynamic
            :features :js-ffi
        'line-segments $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn line-segments (props & children) (dev-check props lilac-line-segments)
            let
                line-style $ phlox.util/prop props :style
                segments $ decode-map-as
                  phlox.util/prop-or props :segments $ []
                  List Dynamic
              create-element :graphics
                assoc props :ops $ concat
                  match line-style
                    (:some style)
                      [] $ g :line-style style
                    (:none) ([])
                  mapcat segments line-segment->ops
                , children
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mesh (props & children) (dev-check props lilac-mesh) (create-element :mesh props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'mount-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mount-app! (app dispatch!)
            let
                element-tree $ render-element app dispatch!
              ffi-add-child
                js-cast
                  ffi-stage $ get-app
                  , 'phlox.core/PixiContainerHost
                , element-tree
          :examples $ []
          :schema $ quote $ Fn schema/PhloxElement Dynamic (-> Unit) (:features :io :js-ffi :state)
        'on-control-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-control-event (elapsed states delta)
            if (:left-b? states) (reset-stage-config!)
              let
                  move $ :left-move states
                  scales $ :right-move delta
                update-stage-config!
                  map move $ fn (x)
                    * x (ffi-abs x) 0.02
                  .unwrap-or (nth scales 1) 0
          :examples $ []
          :schema $ quote $ Fn Number touch-control.core/ControlState touch-control.core/ControlDelta (-> Unit) (:features :js-ffi :state)
        'path-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn path-graphics (position ops)
            hint-fn $ Fn (List Number) (List schema/PathOp) (-> schema/PhloxElement) (:features :js-ffi)
            graphics $ {} (:position position)
              :ops $ map ops $ fn (op)
                match op
                  (:move-to point) (g :move-to point)
                  (:line-to point) (g :line-to point)
                  (:arc center radius angle)
                    g :arc $ {} (:center center) (:radius radius) (:angle angle)
                  (:close-path) (g :close-path)
                  (:line-style color width alpha)
                    g :line-style $ {} (:color color) (:width width) (:alpha alpha)
          :examples $ []
        'polyline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn polyline (props & children) (dev-check props lilac-polyline)
            let
                line-style $ phlox.util/prop props :style
                points $ decode-map-as
                  phlox.util/prop-or props :points $ []
                  List Dynamic
              create-element :graphics
                assoc props :ops $ concat
                  match line-style
                    (:some style)
                      [] $ g :line-style style
                    (:none) ([])
                  [] $ g :move-to $ .unwrap (nth points 0)
                  -> points rest $ map $ fn (p) (g :line-to p)
                , children
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rect (props & children) (dev-check props lilac-rect) (create-element :rect props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'render! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render! (expanded-app dispatch! options)
            match @*app
              (:some _app) &unit
              (:none)
                let
                    app $ init-pixi-app! options
                  aset js/window |_phloxTree app
                  , &unit
            reset! *dispatch-fn dispatch!
            let
                wrap-dispatch $ fn (op & args)
                  ; "an op dispatched without data carries nil, as before"
                  let
                      data $ if (empty? args) nil $ .unwrap (first args)
                    if (list? op)
                      @*dispatch-fn $ :: :states op data
                      if (tag? op)
                        @*dispatch-fn $ :: op data
                        @*dispatch-fn op
              ; js/console.log |render! expanded-app
              match @*tree-element
                (:none)
                  do (mount-app! expanded-app wrap-dispatch) (handle-keyboard-events *tree-element wrap-dispatch)
                (:some _) (rerender-app! expanded-app wrap-dispatch options)
              reset! *tree-element $ Some expanded-app
            render-stage-for-viewer!
          :examples $ []
          :schema $ quote $ Fn schema/PhloxElement Dynamic (Map Tag Dynamic) (-> Unit) (:features :io :js-ffi :state)
        'render-stage-for-viewer! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-stage-for-viewer! ()
            let
                scale $ decode-map-as
                  .unwrap-or (get @*stage-config :scale) nil
                  , 'Number
                move $ decode-map-as
                  .unwrap-or (get @*stage-config :move) nil
                  List Number
              ffi-set-x!
                ffi-position $ ffi-stage $ get-app
                +
                  * 0.5 $ ffi-number js/window.innerWidth
                  .unwrap-or (nth move 0) 0
              ffi-set-y!
                ffi-position $ ffi-stage $ get-app
                +
                  * 0.5 $ ffi-number js/window.innerHeight
                  .unwrap-or (nth move 1) 0
              -> (get-app) ffi-stage ffi-scale $ ffi-set-scale! scale scale
            -> (get-app) ffi-renderer $ ffi-render $ ffi-stage (get-app)
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi :state)
        'rerender-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rerender-app! (app dispatch! options) (; js/console.log "|rerender tree" app @*tree-element)
            update-children
              [] $ [] 0 app
              [] $ [] 0 $ .unwrap @*tree-element
              ffi-stage $ get-app
              , dispatch! options
          :examples $ []
          :schema $ quote $ Fn schema/PhloxElement Dynamic (Map Tag Dynamic) (-> Unit) (:features :io :js-ffi :state)
        'reset-stage-config! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reset-stage-config! ()
            let
                move0 $ decode-map-as
                  .unwrap-or (get @*stage-config :move) nil
                  List Number
                scale0 $ decode-map-as
                  .unwrap-or (get @*stage-config :scale) 1
                  , 'Number
              when
                or
                  not= ([] 0 0) move0
                  not= 1 scale0
                if
                  not= ([] 0 0) move0
                  swap! *stage-config update :move $ fn (prev)
                    unsafe-coerce
                      let
                          prev0 $ decode-map-as prev $ List Number
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
                          prev0 $ decode-map-as prev Number
                        if
                          > 0.01 $ ffi-abs delta
                          , 1 $ + prev0 $ if (> delta 0) -0.01 0.01
                      , Dynamic
                render-stage-for-viewer!
              , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi :state)
        'text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn text (props & children) (dev-check props lilac-text) (create-element :text props children)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (& Dynamic) (-> schema/PhloxElement)
        'update-stage-config! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-stage-config! (move scale-change)
            let
                scale0 $ decode-map-as
                  .unwrap-or (get @*stage-config :scale) 1
                  , 'Number
              when
                and
                  or
                    not= ([] 0 0) move
                    not= 0 scale-change
                  not $ and (> scale-change 0) (>= scale0 8)
                swap! *stage-config update :move $ fn (prev)
                  unsafe-coerce
                    let
                        prev0 $ decode-map-as prev $ List Number
                      complex/add
                        complex/minus prev0 $ complex/scale (complex/conjugate move) 0.05
                        complex/scale prev0 $ / (* 0.01 scale-change) scale0
                    , Dynamic
                swap! *stage-config update :scale $ fn (prev)
                  unsafe-coerce
                    let
                        prev0 $ decode-map-as prev Number
                        next $ &+ prev0 $ * 0.01 scale-change
                      &max 0.2 $ &min next 8
                    , Dynamic
                render-stage-for-viewer!
              , &unit
          :examples $ []
          :schema $ quote $ Fn (List Number) Number (-> Unit) (:features :js-ffi :state)
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
            assoc store :states $ assoc-in
              phlox.util/prop-or store :states $ {}
              conj cursor :data
              , data
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (List Dynamic) Dynamic
            -> $ Map Tag Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.cursor
    'phlox.input $ %{} 'FileEntry
      :defs $ {}
        'lilac-input $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def lilac-input nil
          :examples $ []
          :schema $ quote Nil
        'request-text! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn request-text! (e options cb) (dev-check options lilac-input)
            prompt-at!
              [] (-> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-x) (-> e phlox.core/ffi-event-data phlox.core/ffi-global phlox.core/ffi-object-y)
              decode-map-as options $ Map Tag Dynamic
              , cb
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic
            Fn String $ -> Unit
            -> Unit
            :features :js-ffi
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
          :schema $ quote $ Fn (Ref T) (-> T) (:generics T) (:features :state)
        'handle-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-event (kind tree event dispatch!)
            when (non-nil? tree)
              if (struct? tree)
                struct-match tree
                  phlox.schema/PhloxElement element $ let
                      listener $ .unwrap-or
                        get-in (:props element) ([] :on-keyboard kind)
                        , nil
                    when (fn? listener) (listener event dispatch!)
                    &doseq
                      pair $ decode-map-as (:children element)
                        List $ List Dynamic
                      let[] (k child) pair $ handle-event kind child event dispatch!
                  _ _ $ js/console.log "|unknown tree for handling event:" tree
                js/console.log "|unknown tree for handling event:" tree
            , &unit
          :examples $ []
          :schema $ quote $ Fn Tag Dynamic (Map Tag Dynamic) Dynamic (-> Unit) (:features :js-ffi)
          :tests $ [] $ %{} 'TestEntry (:name |struct-tree-parent-child-keyboard-dispatch)
            :code $ quote $ let
                calls $ ref $ [] :start
                event $ {} (:key |Enter) (:key-code 13)
                dispatch! $ fn (op) &unit
                child $ phlox.schema/PhloxElement :name :text :props
                  {} $ :on-keyboard $ {}
                    :down $ fn (e d!) (assert= event e)
                      reset! calls $ append @calls :child
                  , :children $ []
                root $ phlox.schema/PhloxElement :name :group :props
                  {} $ :on-keyboard $ {}
                    :down $ fn (e d!) (assert= event e)
                      reset! calls $ append @calls :root
                  , :children $ [] ([] :child child)
              assert= &unit $ handle-event :down root event dispatch!
              assert= ([] :start :root :child) @calls
            :tags $ #{} :unit
        'handle-keyboard-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-keyboard-events (*tree-element dispatch!)
            let
                target $ js-cast js/window 'phlox.core/EventTargetHost
                handle! $ fn (kind event)
                  hint-fn $ Fn Tag phlox.core/DomEventHost $ -> Unit
                  match @*tree-element
                    (:none) &unit
                    (:some tree)
                      handle-event kind tree (wrap-event event) dispatch!
              phlox.core/ffi-add-event-listener target |keydown $ fn (event) (handle! :down event)
              phlox.core/ffi-add-event-listener target |keyup $ fn (event) (handle! :up event)
              phlox.core/ffi-add-event-listener target |keypress $ fn (event) (handle! :press event)
          :examples $ []
          :schema $ quote $ Fn
            Ref $ Option phlox.schema/PhloxElement
            , Dynamic (-> Unit) (:features :js-ffi :state)
        'wrap-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-event (event)
            {} (:event event)
              :key $ phlox.core/ffi-event-key event
              :key-code $ phlox.core/ffi-event-key-code event
              :ctrl? $ phlox.core/ffi-event-ctrl? event
              :meta? $ phlox.core/ffi-event-meta? event
              :shift? $ phlox.core/ffi-event-shift? event
          :examples $ []
          :schema $ quote $ Fn phlox.core/DomEventHost
            -> $ Map Tag Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.keyboard
          :require $ phlox.util :refer $ element?
    'phlox.math $ %{} 'FileEntry
      :defs $ {}
        'angle->radian $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn angle->radian (x) (* x radian-ratio)
          :examples $ []
          :schema $ quote $ Fn Number (-> Number)
        'bound-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn bound-x (x lower higher)
            js-ffi.contract/expect-number |Math.min $ js/Math.min
              .unwrap-or higher $ / 1 0
              js/Math.max
                .unwrap-or lower $ / -1 0
                , x
          :examples $ []
          :schema $ quote $ Fn Number (Option Dynamic) (Option Dynamic) (-> Number) (:features :js-ffi)
        'ffi-pi $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def ffi-pi 3.141592653589793
          :examples $ []
          :schema $ quote Number
        'radian-ratio $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def radian-ratio (/ ffi-pi 180)
          :examples $ []
          :schema $ quote Number
        'vec-length $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn vec-length (point)
            let[] (x y) point $ js-ffi.contract/expect-number |Math.sqrt $ js/Math.sqrt
              &+ (&* x x) (&* y y)
          :examples $ []
          :schema $ quote $ Fn (List Number) (-> Number) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.math
    'phlox.render $ %{} 'FileEntry
      :defs $ {}
        'first-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn first-value (items)
            .unwrap $ first items
          :examples $ []
          :schema $ quote $ Fn (List T) (-> T) (:generics T)
        'init-box-size $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-box-size (target size-option)
            match size-option
              (:some size0)
                let
                    size $ decode-map-as size0 $ List Number
                  set! (.-width target)
                    .unwrap $ nth size 0
                  set! (.-height target)
                    .unwrap $ nth size 1
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'init-fill $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-fill (target color-option) (.!endFill target)
            match color-option
              (:some color) (.!beginFill target color)
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'init-filters $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-filters (target filters-option)
            let
                filters $ match filters-option
                  (:some value) value
                  (:none) ([])
              if
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
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'init-geometry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-geometry (data)
            let
                geo $ new PIXI/Geometry
              &doseq
                attr $ phlox.util/prop-or data :attributes $ []
                phlox.core/ffi-geometry-add-attribute! geo (phlox.util/require-prop attr :id)
                  to-js-data $ phlox.util/require-prop attr :buffer
                  phlox.util/require-prop attr :size
              phlox.core/ffi-geometry-add-index! geo $ to-js-data $ phlox.util/require-prop data :index
              , geo
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic) (:features :js-ffi)
        'init-scale $ %{} 'CodeEntry
          :doc "|Apply an optional `:scale` prop; none leaves the PIXI default."
          :code $ quote $ defn init-scale (target scale-option)
            match scale-option
              (:some scale) (set-scale! target scale)
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (-> Unit) (:features :js-ffi)
        'init-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-shader (data uniforms-option)
            .!from PIXI/Shader
              .unwrap-or (get data :vertex-source) nil
              .unwrap-or (get data :fragment-source) nil
              match uniforms-option
                (:some uniforms) uniforms
                (:none) js/undefined
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Dynamic) (:features :js-ffi)
        'last-value $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn last-value (items)
            .unwrap $ last items
          :examples $ []
          :schema $ quote $ Fn (List T) (-> T) (:generics T)
        'read-draw-mode-alias $ %{} 'CodeEntry
          :doc "|Read a mesh `:draw-mode` prop: a tag alias or a PIXI draw mode number."
          :code $ quote $ defn read-draw-mode-alias (draw-mode)
            match (try-decode-map-as draw-mode phlox.schema/DrawMode)
              (:ok mode)
                match mode
                  (Tag alias)
                    match alias
                      :line-loop $ Some 0
                      :line-strip $ Some 1
                      :lines $ Some 2
                      :points $ Some 3
                      :triangle-fan $ Some 4
                      :triangle-strip $ Some 5
                      :triangles $ Some 6
                      _ $ do (js/console.warn "|Unknown draw mode:" draw-mode) None
                  (Number n) (Some n)
              (:err message)
                do (js/console.warn "|Unknown draw mode:" draw-mode message) None
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ Option Number
            :features :js-ffi
        'render-children $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-children (target children dispatch!)
            &doseq (child-pair children)
              if (non-nil? child-pair)
                .!addChild target $ render-element
                  .unwrap $ last child-pair
                  , dispatch!
                js/console.log "|nil child:" child-pair
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic (-> Unit) (:features :io :js-ffi)
        'render-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-circle (element dispatch!)
            let
                target $ js-cast (new PIXI/Graphics) 'phlox.core/PixiDisplayHost
                props $ :props element
                line-style $ phlox.util/prop props :line-style
                position $ phlox.util/prop props :position
                events $ phlox.util/prop props :on
              init-fill target $ phlox.util/prop props :fill
              init-line-style target line-style
              draw-circle target $ phlox.util/prop props :radius
              init-events target events dispatch!
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-rotation target $ phlox.util/prop props :rotation
              init-pivot target $ phlox.util/prop props :pivot
              init-angle target $ phlox.util/prop props :angle
              init-alpha target $ phlox.util/prop props :alpha
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-container (element dispatch!)
            let
                target $ js-cast (new PIXI/Container) 'phlox.core/PixiDisplayHost
                props $ :props element
              render-children target (:children element) dispatch!
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-rotation target $ phlox.util/prop props :rotation
              init-angle target $ phlox.util/prop props :angle
              init-pivot target $ phlox.util/prop props :pivot
              init-alpha target $ phlox.util/prop props :alpha
              init-filters target $ phlox.util/prop props :filters
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-element (element dispatch!)
            if
              and (struct? element) (&struct:matches? element phlox.schema/PhloxElement)
              let
                  node $ assert-type element phlox.schema/PhloxElement
                match (:name node)
                  :container $ render-container node dispatch!
                  :graphics $ render-graphics node dispatch!
                  :circle $ render-circle node dispatch!
                  :rect $ render-rect node dispatch!
                  :text $ render-text node dispatch!
                  :mesh $ render-mesh node dispatch!
                  :image $ render-image node dispatch!
                  _ $ do
                    println "|unknown tag:" $ phlox.util/prop element :tag
                    {}
              js/console.error "|Unknown element:" element
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic (-> Dynamic) (:features :io :js-ffi)
        'render-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-graphics (element dispatch!)
            let
                target $ js-cast (new PIXI/Graphics) 'phlox.core/PixiDisplayHost
                props $ :props element
                ops $ phlox.util/prop props :ops
                events $ phlox.util/prop props :on
              ; dev-check props lilac-graphics
              call-graphics-ops target $ .unwrap-or ops $ []
              init-rotation target $ phlox.util/prop props :rotation
              init-angle target $ phlox.util/prop props :angle
              init-pivot target $ phlox.util/prop props :pivot
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-alpha target $ phlox.util/prop props :alpha
              init-events target events dispatch!
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-image (element dispatch!)
            let
                props $ :props element
                target $ js-cast
                  .!from PIXI/Sprite $ phlox.util/require-prop props :url
                  , 'phlox.core/PixiDisplayHost
                events $ phlox.util/prop props :on
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-pivot target $ phlox.util/prop props :pivot
              init-rotation target $ phlox.util/prop props :rotation
              init-angle target $ phlox.util/prop props :angle
              init-alpha target $ phlox.util/prop props :alpha
              init-box-size target $ phlox.util/prop props :size
              init-events target events dispatch!
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-mesh (element dispatch!)
            let
                props $ :props element
                geo $ init-geometry $ phlox.util/require-prop props :geometry
                shader $ init-shader (phlox.util/require-prop props :shader) (phlox.util/prop props :uniforms)
                draw-mode $ match (phlox.util/prop props :draw-mode)
                  (:some mode)
                    match (read-draw-mode-alias mode)
                      (:some n) n
                      (:none) js/undefined
                  (:none) js/undefined
                target $ js-cast (new PIXI/Mesh geo shader nil draw-mode) 'phlox.core/PixiDisplayHost
                events $ phlox.util/prop props :on
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-pivot target $ phlox.util/prop props :pivot
              init-angle target $ phlox.util/prop props :angle
              init-rotation target $ phlox.util/prop props :rotation
              init-alpha target $ phlox.util/prop props :alpha
              init-events target events dispatch!
              if
                = :center $ .unwrap-or (get props :align) :left
                phlox.core/ffi-set-anchor!
                  phlox.core/ffi-anchor $ js-cast target 'phlox.core/PixiAnchoredHost
                  , 0.5
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              ; js/console.log target
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-rect (element dispatch!)
            let
                target $ js-cast (new PIXI/Graphics) 'phlox.core/PixiDisplayHost
                props $ :props element
                events $ phlox.util/prop props :on
              init-fill target $ phlox.util/prop props :fill
              init-line-style target $ phlox.util/prop props :line-style
              draw-rect target (phlox.util/prop props :size) (phlox.util/prop props :radius)
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-pivot target $ phlox.util/prop props :pivot
              init-rotation target $ phlox.util/prop props :rotation
              init-angle target $ phlox.util/prop props :angle
              init-alpha target $ phlox.util/prop props :alpha
              init-events target events dispatch!
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'render-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-text (element dispatch!)
            let
                props $ :props element
                style $ phlox.util/prop-or props :style $ {}
                text-style $ new PIXI/TextStyle $ convert-line-style style
                target $ js-cast
                  new PIXI/Text (phlox.util/prop-or props :text |) text-style
                  , 'phlox.core/PixiDisplayHost
              init-position target $ phlox.util/prop props :position
              init-scale target $ phlox.util/prop props :scale
              init-pivot target $ phlox.util/prop props :pivot
              init-angle target $ phlox.util/prop props :angle
              init-rotation target $ phlox.util/prop props :rotation
              init-alpha target $ phlox.util/prop props :alpha
              if
                = :center $ .unwrap-or (get props :align) :left
                phlox.core/ffi-set-anchor!
                  phlox.core/ffi-anchor $ js-cast target 'phlox.core/PixiAnchoredHost
                  , 0.5
              init-filters target $ phlox.util/prop props :filters
              render-children target (:children element) dispatch!
              , target
          :examples $ []
          :schema $ quote $ Fn phlox.schema/PhloxElement Dynamic (-> phlox.core/PixiDisplayHost) (:features :io :js-ffi)
        'set-scale! $ %{} 'CodeEntry
          :doc "|Set a PIXI scale from a `:scale` prop: one factor for both axes, or `[] x y`."
          :code $ quote $ defn set-scale! (target raw)
            match (try-decode-map-as raw phlox.schema/Scale)
              (:ok scale)
                let[] (x y)
                  match scale
                    (Number n) ([] n n)
                    (List xs)
                      []
                        .unwrap-or (first xs) 1
                        .unwrap-or (last xs) 1
                  phlox.core/ffi-set-x! (phlox.core/ffi-scale target) x
                  phlox.core/ffi-set-y! (phlox.core/ffi-scale target) y
              (:err message) (js/console.error "|unknown scale:" raw message)
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'update-angle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-angle (target value-option value-option0)
            when (not= value-option value-option0)
              set! (.-angle target)
                match value-option
                  (:some value) value
                  (:none) 0
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-box-size $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-box-size (target size-option size-option0)
            if (not= size-option size-option0)
              match size-option
                (:some size0)
                  let
                      size $ decode-map-as size0 $ List Number
                    set! (.-width target)
                      .unwrap $ nth size 0
                    set! (.-height target)
                      .unwrap $ nth size 1
                (:none)
                  do
                    set! (.-width target) js/undefined
                    set! (.-height target) js/undefined
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-children $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-children (raw-children raw-old-children parent-container dispatch! options)
            let
                children-dict $ decode-map-as raw-children $ List (List Dynamic)
                old-children-dict $ decode-map-as raw-old-children $ List (List Dynamic)
              when dev? $ assert "|children should not contain nil element" $ and
                every? (map children-dict last-value) non-nil?
                every? (map old-children-dict last-value) non-nil?
              let
                  list-ops $ find-minimal-ops (lcs-state-0) (map old-children-dict first-value) (map children-dict first-value)
                loop
                    idx 0
                    ops $ :acc list-ops
                    xs children-dict
                    ys old-children-dict
                  when-not (empty? ops)
                    let
                        op $ first-value ops
                      match (:kind op)
                        :remains $ do
                          when dev? $ assert
                            = (:key op)
                              first-value $ first-value xs
                              first-value $ first-value ys
                            , "|check key"
                          update-element
                            last-value $ first-value xs
                            last-value $ first-value ys
                            , parent-container idx dispatch! options
                          recur (inc idx) (rest ops) (rest xs) (rest ys)
                        :add $ do
                          when dev? $ assert "|check key" $ = (:key op)
                            first-value $ first-value xs
                          .!addChildAt parent-container
                            render-element
                              last-value $ first-value xs
                              , dispatch!
                            , idx
                          recur (inc idx) (rest ops) (rest xs) ys
                        :remove $ do
                          when dev? $ assert "|check key" $ = (:key op)
                            first-value $ first-value ys
                          .!removeChildAt parent-container idx
                          recur idx (rest ops) xs $ rest ys
                        _ $ println "|Unknown op:" op
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic Dynamic (Map Tag Dynamic) (-> Unit) (:features :io :js-ffi)
        'update-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-circle (element old-element target dispatch!)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                position $ phlox.util/prop props :position
                position' $ phlox.util/prop props' :position
                radius $ phlox.util/prop props :radius
                radius' $ phlox.util/prop props' :radius
                line-style $ phlox.util/prop props :line-style
                line-style' $ phlox.util/prop props' :line-style
              when
                or (not= position position') (not= radius radius') (not= line-style line-style')
                  not= (phlox.util/prop props :fill) (phlox.util/prop props' :fill)
                .!clear target
                init-fill target $ phlox.util/prop props :fill
                init-line-style target line-style
                draw-circle target $ phlox.util/prop props :radius
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-events target (phlox.util/prop props :on) (phlox.util/prop props' :on) dispatch!
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :io :js-ffi)
        'update-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-container (element old-element target)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost (-> Unit) (:features :js-ffi)
        'update-draw-mode $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-draw-mode (target draw-mode-option draw-mode-option0)
            when (not= draw-mode-option draw-mode-option0)
              match draw-mode-option
                (:some draw-mode)
                  set! (.-drawMode target)
                    match (read-draw-mode-alias draw-mode)
                      (:some n) n
                      (:none) js/undefined
                (:none) (eprintln "|updating draw-mode to nil")
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (Option Dynamic) (-> Unit) (:features :io :js-ffi)
        'update-element $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-element (element old-element parent-element idx dispatch! options)
            cond
                or (nil? element) (nil? element)
                js/console.error "|Not supposed to be empty"
              (and (element? element) (element? old-element) (= (phlox.util/prop-or element :name :unknown) (phlox.util/prop-or old-element :name :unknown)))
                do
                  let
                      target $ js-cast (.!getChildAt parent-element idx) 'phlox.core/PixiDisplayHost
                    match (phlox.util/prop-or element :name :unknown)
                      :container $ update-container element old-element target
                      :circle $ update-circle element old-element target dispatch!
                      :rect $ update-rect element old-element target dispatch!
                      :text $ update-text element old-element target
                      :graphics $ update-graphics element old-element target dispatch!
                      :mesh $ update-mesh element old-element target dispatch!
                      :image $ update-image element old-element target dispatch!
                      _ $ eprintln "|not implement yet for updating:" $ phlox.util/prop-or element :name :unknown
                  update-children
                    phlox.util/prop-or element :children $ []
                    phlox.util/prop-or old-element :children $ []
                    .!getChildAt parent-element idx
                    , dispatch! options
              (not= (phlox.util/prop-or element :name :unknown) (phlox.util/prop-or old-element :name :unknown))
                do (.!removeChildAt parent-element idx)
                  .!addChildAt parent-element (render-element element dispatch!) idx
              true $ js/console.warn "|Unknown case:" element old-element
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic Number Dynamic (Map Tag Dynamic) (-> Unit) (:features :io :js-ffi)
        'update-filters $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-filters (target filters-option filters-option0)
            let
                next-filters $ decode-map-as
                  match filters-option
                    (:some value) value
                    (:none) ([])
                  List $ List Dynamic
                prev-filters $ decode-map-as
                  match filters-option0
                    (:some value) value
                    (:none) ([])
                  List $ List Dynamic
              if
                not= (map next-filters last) (map prev-filters last)
                if (empty? next-filters)
                  set! (.-filters target) nil
                  init-filters target $ Some next-filters
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-geometry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-geometry (target geo-option geo-option0)
            when (not= geo-option geo-option0)
              match geo-option
                (:some geo)
                  -> target .-geometry $ set! $ init-geometry geo
                (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-graphics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-graphics (element old-element target dispatch!)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                ops $ phlox.util/prop props :ops
                ops' $ phlox.util/prop props' :ops
              when (not= ops ops') (.!clear target)
                call-graphics-ops target $ .unwrap-or ops $ []
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-events target (phlox.util/prop props :on) (phlox.util/prop props' :on) dispatch!
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :io :js-ffi)
        'update-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-image (element old-element target dispatch!)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                position $ phlox.util/prop props :position
                position' $ phlox.util/prop props' :position
                size $ phlox.util/prop props :size
                size' $ phlox.util/prop props' :size
              when
                not= (phlox.util/prop props :url) (phlox.util/prop props' :url)
                js/console.warn "|image url changes are not handling in updates"
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-box-size target (phlox.util/prop props :size) (phlox.util/prop props' :size)
              update-events target (phlox.util/prop props :on) (phlox.util/prop props' :on) dispatch!
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'update-mesh $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-mesh (element old-element target dispatch!)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                ops $ phlox.util/prop props :ops
                ops' $ phlox.util/prop props' :ops
              update-geometry target (phlox.util/prop props :geometry) (phlox.util/prop props' :geometry)
              update-shader target (phlox.util/prop props :shader) (phlox.util/prop props' :shader) (phlox.util/prop props :uniforms)
              update-draw-mode target (phlox.util/prop props :draw-mode) (phlox.util/prop props' :draw-mode)
              let
                  pointer $ -> (js-cast target 'phlox.core/PixiMeshHost) phlox.core/ffi-shader phlox.core/ffi-uniforms
                  entries $ js-cast
                    js/Object.entries $ phlox.util/prop-or props :uniforms $ js-object
                    , 'phlox.core/JsEntriesHost
                .forEach entries $ fn (entry & args)
                  let
                      key $ phlox.core/ffi-entry-key entry
                      value $ phlox.core/ffi-entry-value entry
                    if
                      not $ identical? value $ aget pointer key
                      aset pointer key value
                  , &unit
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-events target (phlox.util/prop props :on) (phlox.util/prop props' :on) dispatch!
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :io :js-ffi)
        'update-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-rect (element old-element target dispatch!)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                position $ phlox.util/prop props :position
                position' $ phlox.util/prop props' :position
                size $ phlox.util/prop props :size
                size' $ phlox.util/prop props' :size
                radius $ phlox.util/prop props :radius
                radius' $ phlox.util/prop props' :radius
                line-style $ phlox.util/prop props :line-style
                line-style' $ phlox.util/prop props' :line-style
              when
                or (not= size size') (not= radius radius') (not= line-style line-style')
                  not= (phlox.util/prop props :fill) (phlox.util/prop props' :fill)
                .!clear target
                init-fill target $ phlox.util/prop props :fill
                init-line-style target line-style
                draw-rect target size $ phlox.util/prop props :radius
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              update-events target (phlox.util/prop props :on) (phlox.util/prop props' :on) dispatch!
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :io :js-ffi)
        'update-scale $ %{} 'CodeEntry
          :doc "|Apply a changed `:scale` prop; a removed prop resets the scale to 1."
          :code $ quote $ defn update-scale (target scale-option scale-option0)
            when (not= scale-option scale-option0)
              set-scale! target $ match scale-option
                (:some value) value
                (:none) 1
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (Option Dynamic) (-> Unit) (:features :js-ffi)
        'update-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-shader (target shader-option shader-option0 uniforms-option)
            when (not= shader-option shader-option0)
              match shader-option
                (:some shader)
                  -> target .-shader $ set! $ init-shader shader uniforms-option
                (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-text $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-text (element old-element target)
            let
                props $ phlox.util/prop-or element :props $ {}
                props' $ phlox.util/prop-or old-element :props $ {}
                text-style $ phlox.util/prop props :style
                text-style' $ phlox.util/prop props' :style
              when
                not= (phlox.util/prop props :text) (phlox.util/prop props' :text)
                set! (.-text target) (phlox.util/prop-or props :text |)
              when (not= text-style text-style')
                let
                    new-style $ new PIXI/TextStyle $ convert-line-style
                      .unwrap-or text-style $ {}
                  set! (.-style target) new-style
              update-position target (phlox.util/prop props :position) (phlox.util/prop props' :position)
              update-scale target (phlox.util/prop props :scale) (phlox.util/prop props' :scale)
              update-rotation target (phlox.util/prop props :rotation) (phlox.util/prop props' :rotation)
              update-angle target (phlox.util/prop props :angle) (phlox.util/prop props' :angle)
              update-pivot target (phlox.util/prop props :pivot) (phlox.util/prop props' :pivot)
              update-alpha target (phlox.util/prop props :alpha) (phlox.util/prop props' :alpha)
              if
                not= (phlox.util/prop-or props :align :left) (phlox.util/prop-or props' :align :left)
                if
                  = :center $ .unwrap-or (get props :align) :left
                  phlox.core/ffi-set-anchor!
                    phlox.core/ffi-anchor $ js-cast target 'phlox.core/PixiAnchoredHost
                    , 0.5
                  phlox.core/ffi-set-anchor!
                    phlox.core/ffi-anchor $ js-cast target 'phlox.core/PixiAnchoredHost
                    , nil
              update-filters target (phlox.util/prop props :filters) (phlox.util/prop props' :filters)
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic phlox.core/PixiDisplayHost (-> Unit) (:features :io :js-ffi)
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
                let
                    command $ decode-map-as pair $ List Dynamic
                    op $ .unwrap $ first command
                  match op
                    :end-fill $ .!endFill target
                    :close-path $ .!closePath target
                    :begin-hole $ .!beginHole target
                    :end-hole $ .!endHole target
                    _ $ let
                        data $ .unwrap $ .get command 1
                      match op
                        :move-to $ .!moveTo target
                          .unwrap $ first data
                          .unwrap $ last data
                        :line-to $ .!lineTo target
                          .unwrap $ first data
                          .unwrap $ last data
                        :line-style $ init-line-style target $ phlox.util/as-option data
                        :begin-fill $ .!beginFill target
                          .unwrap-or (get data :color) nil
                          .unwrap-or (get data :alpha) 1
                        :arc $ let
                            center $ phlox.util/require-prop data :center
                            radian $ cond
                                .some? $ phlox.util/prop data :radian
                                phlox.util/require-prop data :radian
                              (.some? (phlox.util/prop data :angle))
                                map
                                  decode-map-as
                                    .unwrap-or (get data :angle) ([])
                                    List Number
                                  , angle->radian
                              true $ do (js/console.warn "|Unknown arc" data) ([] 0 0)
                          .!arc target
                            .unwrap $ first center
                            .unwrap $ last center
                            .unwrap-or (get data :radius) nil
                            .unwrap $ first radian
                            .unwrap $ last radian
                            .unwrap-or (get data :anticlockwise?) nil
                        :arc-to $ let
                            p1 $ phlox.util/require-prop data :p1
                            p2 $ phlox.util/require-prop data :p2
                          .!arcTo target
                            .unwrap $ first p1
                            .unwrap $ last p1
                            .unwrap $ first p2
                            .unwrap $ last p2
                            .unwrap-or (get data :radius) nil
                        :bezier-to $ let
                            p1 $ phlox.util/require-prop data :p1
                            p2 $ phlox.util/require-prop data :p2
                            to-p $ phlox.util/require-prop data :to-p
                          .!bezierCurveTo target
                            .unwrap $ first p1
                            .unwrap $ last p1
                            .unwrap $ first p2
                            .unwrap $ last p2
                            .unwrap $ first to-p
                            .unwrap $ last to-p
                        :quadratic-to $ let
                            p1 $ phlox.util/require-prop data :p1
                            to-p $ phlox.util/require-prop data :to-p
                          .!quadraticCurveTo target
                            .unwrap $ first p1
                            .unwrap $ last p1
                            .unwrap $ first to-p
                            .unwrap $ last to-p
                        _ $ js/console.warn "|not supported op:" op data
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :io :js-ffi)
        'draw-circle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn draw-circle (target radius-option)
            match radius-option
              (:some radius)
                if (number? radius)
                  .!drawCircle target 0 0 $ use-number radius
                  js/console.warn "|Unknown radius" radius
              (:none) (js/console.warn "|Unknown radius" radius-option)
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (-> Unit) (:features :js-ffi)
        'draw-rect $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn draw-rect (target size-option radius-option)
            match size-option
              (:some size)
                if (list? size)
                  match radius-option
                    (:some radius)
                      .!drawRoundedRect target 0 0
                        use-number $ .unwrap $ first size
                        use-number $ .unwrap $ last size
                        , radius
                    (:none)
                      .!drawRect target 0 0
                        use-number $ .unwrap $ first size
                        use-number $ .unwrap $ last size
                  js/console.warn "|Unknown size" size
              (:none) (js/console.warn "|Unknown size" size-option)
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (Option Dynamic) (-> Unit) (:features :js-ffi)
        'init-alpha $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-alpha (target value-option)
            match value-option
              (:some value)
                set! (.-alpha target) value
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'init-angle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-angle (target value-option)
            match value-option
              (:some value)
                set! (.-angle target) value
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'init-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-events (target events-option dispatch!)
            match events-option
              (:some events)
                let
                    checked-events $ decode-map-as events $ Map Tag Dynamic
                  set! (.-eventMode target) |dynamic
                  set! (.-buttonMode target) true
                  &doseq
                    k $ keys checked-events
                    let
                        listener $ .unwrap $ get checked-events k
                      .!on target (to-string k)
                        fn (event)
                          when (fn? listener) (listener event dispatch!)
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic (Option Dynamic) Dynamic (-> Unit) (:features :js-ffi)
        'init-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-line-style (target line-style-option)
            match line-style-option
              (:some line-style)
                .!lineStyle target $ js-object
                  :width $ use-number $ phlox.util/prop-or line-style :width 0
                  :color $ use-number $ phlox.util/prop-or line-style :color 0
                  :alpha $ phlox.util/prop-or line-style :alpha 1
                  :join $ read-line-join $ phlox.util/prop-or line-style :join :miter
                  :cap $ read-line-cap $ phlox.util/prop-or line-style :cap :butt
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost (Option Dynamic) (-> Unit) (:features :io :js-ffi)
        'init-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-pivot (target point-option)
            match point-option
              (:some point)
                do
                  phlox.core/ffi-set-x! (phlox.core/ffi-pivot target)
                    if (list? point)
                      decode-map-as
                        .unwrap-or (first point) 0
                        , Number
                      , 0
                  phlox.core/ffi-set-y! (phlox.core/ffi-pivot target)
                    if (list? point)
                      decode-map-as
                        .unwrap-or (last point) 0
                        , Number
                      , 0
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'init-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-position (target point-option)
            match point-option
              (:some point)
                do
                  phlox.core/ffi-set-x! (phlox.core/ffi-position target)
                    if (list? point)
                      decode-map-as
                        .unwrap-or (first point) 0
                        , Number
                      , 0
                  phlox.core/ffi-set-y! (phlox.core/ffi-position target)
                    if (list? point)
                      decode-map-as
                        .unwrap-or (last point) 0
                        , Number
                      , 0
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'init-rotation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn init-rotation (target value-option)
            match value-option
              (:some value)
                set! (.-rotation target) value
              (:none) &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic (-> Unit) (:features :js-ffi)
        'read-line-cap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-line-cap (x)
            match x
              nil $ .-BUTT PIXI/LINE_CAP
              :butt $ .-BUTT PIXI/LINE_CAP
              :round $ .-ROUND PIXI/LINE_CAP
              :square $ .-SQUARE PIXI/LINE_CAP
              _ $ println "|unknown line-cap:" x
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic) (:features :io :js-ffi)
        'read-line-join $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-line-join (x)
            match x
              nil $ .-MITER PIXI/LINE_JOIN
              :bevel $ .-BEVEL PIXI/LINE_JOIN
              :miter $ .-MITER PIXI/LINE_JOIN
              :round $ .-ROUND PIXI/LINE_JOIN
              _ $ println "|unknown line-join value:" x
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic) (:features :io :js-ffi)
        'update-alpha $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-alpha (target value-option value-option0)
            when (not= value-option value-option0)
              set! (.-alpha target)
                match value-option
                  (:some value) value
                  (:none) 1
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-events $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-events (target events-option old-events-option dispatch!)
            match old-events-option
              (:some old-events)
                let
                    checked-events $ decode-map-as old-events $ Map Tag Dynamic
                  &doseq
                    k $ keys checked-events
                    .!off target $ to-string k
              (:none) &unit
            match events-option
              (:some events)
                let
                    checked-events $ decode-map-as events $ Map Tag Dynamic
                  &doseq
                    k $ keys checked-events
                    let
                        listener $ .unwrap $ get checked-events k
                      .!on target (to-string k)
                        fn (event)
                          when (fn? listener) (listener event dispatch!)
                  set! (.-buttonMode target) true
                  set! (.-eventMode target) |dynamic
              (:none)
                do
                  set! (.-buttonMode target) false
                  set! (.-eventMode target) |none
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic (Option Dynamic) (Option Dynamic) Dynamic (-> Unit) (:features :js-ffi)
        'update-pivot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-pivot (target point-option point-option0)
            when (not= point-option point-option0)
              let
                  point $ match point-option
                    (:some value) value
                    (:none) ([] 0 0)
                phlox.core/ffi-set-x! (phlox.core/ffi-pivot target)
                  if (list? point)
                    decode-map-as
                      .unwrap-or (first point) 0
                      , Number
                    , 0
                phlox.core/ffi-set-y! (phlox.core/ffi-pivot target)
                  if (list? point)
                    decode-map-as
                      .unwrap-or (last point) 0
                      , Number
                    , 0
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-position (target point-option point-option0)
            when (not= point-option point-option0)
              let
                  point $ match point-option
                    (:some value) value
                    (:none) ([] 0 0)
                phlox.core/ffi-set-x! (phlox.core/ffi-position target)
                  if (list? point)
                    decode-map-as
                      .unwrap-or (first point) 0
                      , Number
                    , 0
                phlox.core/ffi-set-y! (phlox.core/ffi-position target)
                  if (list? point)
                    decode-map-as
                      .unwrap-or (last point) 0
                      , Number
                    , 0
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic Dynamic (-> Unit) (:features :js-ffi)
        'update-rotation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-rotation (target value-option value-option0)
            when (not= value-option value-option0)
              set! (.-rotation target)
                match value-option
                  (:some value) value
                  (:none) 0
            , &unit
          :examples $ []
          :schema $ quote $ Fn phlox.core/PixiDisplayHost Dynamic Dynamic (-> Unit) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.render.draw
          :require
            phlox.util :refer $ use-number
            phlox.check :refer $ dev-check dev-check-message lilac-point lilac-line-style lilac-color
            phlox.math :refer $ angle->radian
            phlox.render.draw :refer $ init-line-style
            |pixi.js :as PIXI
    'phlox.schema $ %{} 'FileEntry
      :defs $ {}
        'DrawMode $ %{} 'CodeEntry
          :doc "|A mesh `:draw-mode` prop: a tag alias such as :triangles, or a PIXI draw mode number."
          :code $ quote $ defunion DrawMode Tag Number
          :examples $ []
          :schema $ quote UnionDef
        'PathOp $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum PathOp
            :move-to $ List Number
            :line-to $ List Number
            :arc (List Number) Number $ List Number
            :close-path
            :line-style Number Number Number
          :examples $ []
          :schema $ quote EnumDef
        'PhloxElement $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct PhloxElement (:name Tag)
            :props $ Map Tag Dynamic
            :children $ List $ List Dynamic
          :examples $ []
          :schema $ quote StructDef
        'Scale $ %{} 'CodeEntry
          :doc "|A `:scale` prop: one factor for both axes, or `[] x y`."
          :code $ quote $ defunion Scale Number (List Number)
          :examples $ []
          :schema $ quote UnionDef
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.schema
    'phlox.util $ %{} 'FileEntry
      :defs $ {}
        '*ctx-instance $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *ctx-instance None
          :examples $ []
          :schema $ quote $ Ref (Option phlox.core/CanvasContextHost)
        'as-option $ %{} 'CodeEntry
          :doc "|A value as an Option: an Option stays as it is, nil becomes none, anything else is present."
          :code $ quote $ defn as-option (value)
            cond
                nil? value
                , None
              (and (enum? value) (= (&enum:definition value) (Some Option)))
                if
                  = :some $ &enum:nth value 0
                  Some $ &enum:nth value 1
                  , None
              true $ Some value
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ Option Dynamic
        'camel-case $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn camel-case (x)
            js-ffi.contract/expect-string |String.replace $ .!replace x (new js/RegExp |-[a-z])
              fn (matched idx full-text)
                js-ffi.contract/expect-string |String.toUpperCase $ .!toUpperCase $ .unwrap-or
                  nth (js-ffi.contract/expect-string |String.replace-match matched) 1
                  , |
          :examples $ []
          :schema $ quote $ Fn String (-> String) (:features :js-ffi)
        'canvas-center! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn canvas-center! ()
            []
              &* 0.5 $ phlox.core/ffi-number js/window.innerWidth
              &* 0.5 $ phlox.core/ffi-number js/window.innerHeight
          :examples $ []
          :schema $ quote $ Fn
            -> $ List Number
            :features :js-ffi
        'convert-line-style $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn convert-line-style (props)
            ->
              decode-map-as props $ Map Dynamic Dynamic
              to-pairs
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
          :schema $ quote $ Fn T (-> Dynamic) (:generics T) (:features :io :js-ffi)
        'detect-func-in-map? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn detect-func-in-map? (params)
            if (empty? params) false $ let
                p0 $ .unwrap $ first params
              if
                and (map? p0)
                  any? (to-pairs p0)
                    fn (pair)
                      fn? $ .unwrap $ last pair
                , true $ recur $ rest params
          :examples $ []
          :schema $ quote $ Fn (List T) (-> Bool) (:generics T)
        'element? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn element? (x)
            and (struct? x)
              match (struct-definition x)
                (:some definition) (= definition schema/PhloxElement)
                (:none) false
          :examples $ []
          :schema $ quote $ Fn T (-> Bool) (:generics T)
        'index-items $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn index-items (xs)
            -> xs $ map-indexed $ fn (idx x) ([] idx x)
          :examples $ []
          :schema $ quote $ Fn (List T)
            -> $ List $ List Dynamic
            :generics T
        'measure-text-width! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn measure-text-width! (text size font-family)
            let
                ctx $ match @*ctx-instance
                  (:some ctx) ctx
                  (:none)
                    let
                        document $ js-cast js/document 'phlox.core/DocumentHost
                        el $ js-cast (phlox.core/ffi-create-element document |canvas) 'phlox.core/CanvasHost
                        created $ js-cast (phlox.core/ffi-get-context el |2d) 'phlox.core/CanvasContextHost
                      reset! *ctx-instance $ Some created
                      , created
              phlox.core/ffi-set-font! ctx $ str size "|px " font-family
              phlox.core/ffi-text-width $ phlox.core/ffi-measure-text ctx text
          :examples $ []
          :schema $ quote $ Fn String Number String (-> Number) (:features :js-ffi :state)
        'prop $ %{} 'CodeEntry
          :doc "|Read a prop of an untyped map as an Option: a nil map, a missing key, a nil value and a none value are all none; an Option value is used as it is."
          :code $ quote $ defn prop (props key)
            if (nil? props) None $ match (get props key)
              (:some value) (as-option value)
              (:none) None
          :examples $ []
          :schema $ quote $ Fn M Tag
            -> $ Option Dynamic
            :generics M
        'prop-or $ %{} 'CodeEntry
          :doc "|Read a prop of an untyped map, or default when it is absent or nil."
          :code $ quote $ defn prop-or (props key default)
            match (prop props key)
              (:some value) value
              (:none) default
          :examples $ []
          :schema $ quote $ Fn M Tag Dynamic (-> Dynamic) (:generics M)
        'rand-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-color ()
            floor $ * (random) 0xffffff
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'remove-nil-values $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn remove-nil-values (dict)
            -> dict $ filter $ fn (pair)
              non-nil? $ .unwrap $ last pair
          :examples $ []
          :schema $ quote $ Fn
            List $ List Dynamic
            -> $ List $ List Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |nil-filter-keeps-false-and-keys)
            :code $ quote $ assert=
              [] ([] 1 false) ([] 2 |a)
              remove-nil-values $ index-items $ [] nil false |a
        'require-prop $ %{} 'CodeEntry
          :doc "|Read a prop that must be present; raises with the key when it is absent or nil."
          :code $ quote $ defn require-prop (props key)
            match (prop props key)
              (:some value) value
              (:none)
                raise $ str "|[phlox] missing " key
          :examples $ []
          :schema $ quote $ Fn M Tag (-> Dynamic) (:generics M)
        'use-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn use-number (x)
            if
              and (number? x)
                not $ js/isNaN x
              , x $ do (js/console.error "|Invalid number:" x) nil
          :examples $ []
          :schema $ quote $ Fn T (-> Dynamic) (:generics T) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util
          :require
            js-ffi.browser :refer $ random
            |pixi.js :as PIXI
            phlox.schema :as schema
    'phlox.util.lcs $ %{} 'FileEntry
      :defs $ {}
        'ChildChange $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct ChildChange (:generics K) (:kind Tag) (:key K)
          :examples $ []
          :schema $ quote StructDef
        'LcsState $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct LcsState (:generics K) (:step Number)
            :acc $ List $ ChildChange K
          :examples $ []
          :schema $ quote StructDef
        'append-op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn append-op (state kind key cost)
            LcsState :step
              + (:step state) cost
              , :acc $ append (:acc state) (ChildChange :kind kind :key key)
          :examples $ []
          :schema $ quote $ Fn (LcsState K) Tag K Number
            -> $ LcsState K
            :generics K
        'find-minimal-ops $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn find-minimal-ops (state xs ys)
            cond
                and (empty? xs) (empty? ys)
                , state
              (empty? xs)
                recur
                  append-op state :add
                    .unwrap $ first ys
                    , 1
                  , xs $ rest ys
              (empty? ys)
                recur
                  append-op state :remove
                    .unwrap $ first xs
                    , 1
                  rest xs
                  , ys
              true $ let
                  x0 $ .unwrap $ first xs
                  y0 $ .unwrap $ first ys
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
                      <= (:step solution-a) (:step solution-b)
                      , solution-a solution-b
          :examples $ []
          :schema $ quote $ Fn (LcsState K) (List K) (List K)
            -> $ LcsState K
            :generics K
          :tests $ [] $ %{} 'TestEntry (:name |legacy-simple-changes)
            :code $ quote $ do
              assert=
                LcsState :step 2 :acc $ [] (ChildChange :kind :remove :key |a) (ChildChange :kind :add :key |b)
                find-minimal-ops (lcs-state-0) ([] |a) ([] |b)
              assert=
                LcsState :step 0 :acc $ [] $ ChildChange :kind :remains :key |a
                find-minimal-ops (lcs-state-0) ([] |a) ([] |a)
              assert=
                LcsState :step 1 :acc $ [] $ ChildChange :kind :add :key |a
                find-minimal-ops (lcs-state-0) ([]) ([] |a)
              assert=
                LcsState :step 1 :acc $ [] (ChildChange :kind :remains :key |a) (ChildChange :kind :remove :key |b) (ChildChange :kind :remains :key |c)
                find-minimal-ops (lcs-state-0) ([] |a |b |c) ([] |a |c)
              assert=
                LcsState :step 2 :acc $ [] (ChildChange :kind :remains :key |a) (ChildChange :kind :remove :key |b) (ChildChange :kind :remains :key |c) (ChildChange :kind :add :key |c)
                find-minimal-ops (lcs-state-0) ([] |a |b |c) ([] |a |c |c)
              assert=
                LcsState :step 3 :acc $ [] (ChildChange :kind :remains :key |a) (ChildChange :kind :add :key |b1) (ChildChange :kind :add :key |b2) (ChildChange :kind :add :key |b3) (ChildChange :kind :remains :key |c)
                find-minimal-ops (lcs-state-0) ([] |a |c) ([] |a |b1 |b2 |b3 |c)
            :tags $ #{} :unit
        'lcs-state-0 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn lcs-state-0 ()
            LcsState :step 0 :acc $ []
          :examples $ []
          :schema $ quote $ Fn
            -> $ LcsState K
            :generics K
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util.lcs
    'phlox.util.styles $ %{} 'FileEntry
      :defs $ {}
        'LayoutValue $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defunion LayoutValue Number Tag
          :examples $ []
          :schema $ quote UnionDef
        'font-code $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def font-code "|Source Code Pro, Menlo, Ubuntu Mono, Consolas, monospace"
          :examples $ []
          :schema $ quote String
        'font-normal $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def font-normal "|Hind, Helvetica, Arial, sans-serif"
          :examples $ []
          :schema $ quote String
        'layout-column $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-column
            {} (:display |flex) (:align-items |stretch) (:flex-direction |column)
          :examples $ []
          :schema $ quote $ Map Tag String
        'layout-expand $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-expand
            {} (:flex 1) (:overflow :auto)
          :examples $ []
          :schema $ quote $ Map Tag LayoutValue
        'layout-row $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def layout-row
            {} (:display |flex) (:align-items |stretch) (:flex-direction |row)
          :examples $ []
          :schema $ quote $ Map Tag String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns phlox.util.styles

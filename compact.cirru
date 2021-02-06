
{} (:package |phlox)
  :configs $ {} (:init-fn |phlox.app.main/main!) (:reload-fn |phlox.app.main/reload!) (:modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/) (:version |0.4.0)
  :files $ {}
    |phlox.check $ {}
      :ns $ quote
        ns phlox.check $ :require ([] lilac.core :refer $ [] validate-lilac record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+)
      :defs $ {}
        |lilac-text-style $ quote
          def lilac-text-style $ record+
            {}
              :align $ enum+ (#{} :left :center :right)
              :break-words $ boolean+
              :drop-shadow $ boolean+
              :drop-shadow-alpha $ number+
                {} (:min 0) (:max 1)
              :drop-shadow-angle $ number+
              :drop-shadow-blur $ number+
              :drop-shadow-color lilac-color
              :drop-shadow-distance $ number+
              :fill $ or+ ([] lilac-color $ list+ lilac-color)
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
              :trim $ boolean+
              :text-baseline $ enum+ (#{} :alphabetic)
              :white-space $ enum+ (#{} :normal :pre :pre-line)
              :word-wrap $ boolean+
              :word-wrap-width $ number+
            {} (:check-keys? true) (:all-optional? true)
        |lilac-circle $ quote
          def lilac-circle $ record+
            {} (:line-style $ optional+ lilac-line-style) (:on $ optional+ lilac-event-map) (:position lilac-point) (:radius $ number+)
              :fill $ optional+ (number+)
              :alpha $ optional+ (number+)
              :rotation $ optional+ (number+)
              :angle $ optional+ (number+)
              :pivot $ optional+ lilac-point
              :fill $ optional+ (number+)
              :on-keyboard $ optional+ lilac-event-map
            {} $ :check-keys? true
        |lilac-point $ quote
          def lilac-point $ tuple+
            [] (number+) (number+)
            {} $ :check-size? true
        |lilac-color $ quote
          def lilac-color $ or+
            [] (number+) (string+)
        |lilac-line-style $ quote
          def lilac-line-style $ record+
            {} (:width $ number+) (:color $ number+)
              :alpha $ optional+ (number+)
        |dev-check-message $ quote
          defmacro dev-check-message (message data rule)
            if (= "\"true" $ get-env "\"dev")
              &let (result $ gensym "\"result")
                quote-replace $ &let (~result $ validate-lilac ~data ~rule)
                  when-not (:ok? ~result)
                    js/console.error (:formatted-message ~result) &newline (str ~message "\", when props is:") (to-js-data ~data)
              quote-replace $ do
        |lilac-graphics $ quote
          def lilac-graphics $ record+
            {} (:on $ optional+ lilac-event-map) (:position $ optional+ lilac-point) (:pivot $ optional+ lilac-point)
              :alpha $ optional+ (number+)
              :rotation $ optional+ (number+)
              :angle $ optional+ (number+)
              :ops $ list+
                optional+ $ tuple+
                  [] (keyword+) (any+)
                {} $ :allow-seq? true
              :on-keyboard $ optional+ lilac-event-map
            {} $ :check-keys? true
        |lilac-rect $ quote
          def lilac-rect $ record+
            {} (:line-style $ optional+ lilac-line-style) (:on $ optional+ lilac-event-map) (:position $ optional+ lilac-point) (:size lilac-point) (:pivot $ optional+ lilac-point)
              :alpha $ optional+ (number+)
              :rotation $ optional+ (number+)
              :angle $ optional+ (number+)
              :fill $ optional+ lilac-color
              :radius $ optional+ (number+)
              :on-keyboard $ optional+ lilac-event-map
            {} $ :check-keys? true
        |in-dev? $ quote (def in-dev? $ do ^boolean js/goog.DEBUG)
        |dev-check $ quote
          defmacro dev-check (data rule)
            if (= "\"true" $ get-env "\"dev")
              &let (result $ gensym "\"result")
                quote-replace $ &let (~result $ validate-lilac ~data ~rule)
                  when-not (:ok? ~result)
                    js/console.error (:formatted-message ~result) &newline
                      str "\"(dev-check " (quote ~data) "\" " (quote ~rule) "\") where props is:"
                      to-js-data ~data
              quote-replace $ do
        |lilac-event-map $ quote
          def lilac-event-map $ map+ (keyword+) (fn+)
        |lilac-text $ quote
          def lilac-text $ record+
            {} (:text $ string+) (:style lilac-text-style) (:position $ optional+ lilac-point)
              :pivot $ optional+ (number+)
              :rotation $ optional+ (number+)
              :angle $ optional+ (number+)
              :alpha $ optional+ (number+)
              :on-keyboard $ optional+ lilac-event-map
            {} $ :check-keys? true
        |lilac-container $ quote
          def lilac-container $ record+
            {} (:position lilac-point) (:rotation $ number+) (:pivot lilac-point) (:alpha $ number+) (:angle $ number+) (:on-keyboard $ optional+ lilac-event-map)
            {} (:check-keys? true) (:all-optional? true)
      :proc $ quote ()
    |phlox.render.draw $ {}
      :ns $ quote
        ns phlox.render.draw $ :require ([] phlox.util :refer $ [] use-number) ([] lilac.core :refer $ [] record+ number+ string+ optional+ boolean+ tuple+ map+ fn+ keyword+ list+ or+) ([] phlox.check :refer $ [] dev-check dev-check-message lilac-point lilac-line-style lilac-color) ([] phlox.math :refer $ [] angle->radian)
      :defs $ {}
        |draw-circle $ quote
          defn draw-circle (target radius)
            if (number? radius) (.drawCircle target 0 0 $ use-number radius) (js/console.warn "\"Unknown radius"  radius)
        |init-alpha $ quote
          defn init-alpha (target alpha)
            when (some? alpha)
              set! (-> target .-alpha) alpha
        |update-position $ quote
          defn update-position (target point point0)
            when (not= point point0)
              set! (-> target .-position .-x)
                if (list? point) (first point) (, nil)
              set! (-> target .-position .-y)
                if (list? point) (last point) (, nil)
        |update-pivot $ quote
          defn update-pivot (target pivot pivot0)
            when (not= pivot pivot0)
              set! (-> target .-pivot .-x)
                if (list? pivot) (first pivot) (, nil)
              set! (-> target .-pivot .-y)
                if (list? pivot) (last pivot) (, nil)
        |update-events $ quote
          defn update-events (target events old-events dispatch!)
            when (some? old-events)
              &doseq (pair $ to-pairs old-events)
                let[] (k listener) pair $ .off target (turn-string k)
            when (some? events)
              &doseq (pair $ to-pairs events)
                let[] (k listener) pair $ .on target (turn-string k)
                  fn (event) (listener event dispatch!)
            if (some? events)
              do
                set! (.-buttonMode target) true
                set! (.-interactive target) true
              do
                set! (.-buttonMode target) false
                set! (.-interactive target) false
        |init-events $ quote
          defn init-events (target events dispatch!)
            when (some? events) (aset target "\"interactive" true) (aset target "\"buttonMode" true)
              &doseq (pair $ to-pairs events)
                let[] (k listener) pair $ .on target (turn-string k)
                  fn (event) (listener event dispatch!)
        |init-pivot $ quote
          defn init-pivot (target pivot)
            when (some? pivot)
              aset (-> target .-pivot) "\"x" $ first pivot
              aset (-> target .-pivot) "\"y" $ last pivot
        |init-angle $ quote
          defn init-angle (target v)
            when (some? v)
              set! (.-angle target) v
        |update-alpha $ quote
          defn update-alpha (target alpha alpha0)
            when (not= alpha alpha0)
              set! (-> target .-alpha) alpha
        |call-graphics-ops $ quote
          defn call-graphics-ops (target ops)
            &doseq (pair ops)
              when (some? pair)
                let[] (op data) pair $ case op
                  :move-to $ .moveTo target (first data) (last data)
                  :line-to $ .lineTo target (first data) (last data)
                  :line-style $ .lineStyle target (use-number $ :width data) (use-number $ :color data) (:alpha data)
                  :begin-fill $ .beginFill target (:color data)
                    either (:alpha data) 1
                  :end-fill $ .endFill target
                  :close-path $ .closePath target
                  :arc $ let
                      center $ :center data
                      radian $ cond
                          some? $ :radian data
                          :radian data
                        (some? $ :angle data)
                          map angle->radian $ :angle data
                        :else $ do (js/console.warn "\"Unknown arc" data) ([] 0 0)
                    .arc target (first center) (last center) (:radius data) (first radian) (last radian) (:anticlockwise? data)
                  :arc-to $ let
                      p1 $ :p1 data
                      p2 $ :p2 data
                    .arcTo target (first p1) (last p1) (first p2) (last p2) (:radius data)
                  :bezier-to $ let
                      p1 $ :p1 data
                      p2 $ :p2 data
                      to-p $ :to-p data
                    .bezierCurveTo target (first p1) (last p1) (first p2) (last p2) (first to-p) (last to-p)
                  :quadratic-to $ let
                      p1 $ :p1 data
                      to-p $ :to-p data
                    .quadraticCurveTo target (first p1) (last p1) (first to-p) (last to-p)
                  :begin-hole $ .beginHole target
                  :end-hole $ .endHole target
                  op $ js/console.warn "\"not supported op:" op data
        |init-position $ quote
          defn init-position (target point)
            when (some? point)
              aset (-> target .-position) "\"x" $ if (list? point) (first point) (, 0)
              aset (-> target .-position) "\"y" $ if (list? point) (last point) (, 0)
        |init-rotation $ quote
          defn init-rotation (target v)
            when (some? v) (aset target "\"rotation" v)
        |init-line-style $ quote
          defn init-line-style (target line-style)
            when (some? line-style)
              .lineStyle target (use-number $ :width line-style) (use-number $ :color line-style) (:alpha line-style)
        |update-rotation $ quote
          defn update-rotation (target v v0)
            when (not= v v0)
              set! (.-rotation target) v
        |draw-rect $ quote
          defn draw-rect (target size radius)
            if (list? size)
              if (some? radius)
                .drawRoundedRect target 0 0 (use-number $ first size) (use-number $ last size) (, radius)
                .drawRect target 0 0 (use-number $ first size) (use-number $ last size)
              js/console.warn "\"Unknown size" size
      :proc $ quote ()
    |phlox.comp.messages $ {}
      :ns $ quote
        ns phlox.comp.messages $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list) ([] phlox.check :refer $ [] lilac-event-map dev-check lilac-point) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+) ([] phlox.comp.button :refer $ [] comp-button)
      :defs $ {}
        |comp-messages $ quote
          defcomp comp-messages (options) (dev-check options lilac-messages)
            let
                messages $ :messages options
                bottom? $ :bottom? options
                base-position $ either (:position options)
                  if bottom?
                    [] (- js/window.innerWidth 16) (- js/window.innerHeight 16)
                    [] (- js/window.innerWidth 16) 16
                on-pointertap $ either (:on-pointertap options)
                  fn (x d!) (println "\"missing message handler:" x)
              create-list :container ({} $ :position base-position)
                ->> messages $ map-indexed
                  fn (idx message)
                    [] (:id message)
                      comp-button $ {} (:text $ :text message)
                        :position $ if bottom?
                          [] 0 $ - 8
                            * 40 $ - (count messages) idx
                          [] 0 $ * 40 idx
                        :color $ :color options
                        :fill $ :fill options
                        :align-right? true
                        :on-pointertap $ fn (e d!) (on-pointertap message d!)
        |lilac-messages $ quote
          def lilac-messages $ record+
            {} (:messages lilac-message-list) (:color $ number+) (:fill $ number+) (:position lilac-point) (:bottom? $ boolean+) (:on-pointertap $ fn+)
            {} (:check-keys? true) (:all-optional? true)
        |lilac-message-list $ quote
          def lilac-message-list $ list+
            record+
              {} (:id $ string+) (:text $ string+)
              {} $ :exact-keys? true
            {} $ :allow-seq? true
      :proc $ quote ()
    |phlox.util $ {}
      :ns $ quote
        ns phlox.util $ :require ([] "\"pixi.js" :as PIXI)
      :defs $ {}
        |convert-line-style $ quote
          defn convert-line-style (props)
            ->> props (to-pairs)
              map $ fn (pair)
                let-sugar
                      [] k v
                      , pair
                    key-name $ camel-case
                      cond
                          keyword? k
                          turn-string k
                        (string? k)
                          , k
                        true $ str k
                  [] key-name $ case k
                    :fill-gradient-type $ case v (:h $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL) (:horizontal $ -> PIXI/TEXT_GRADIENT .-LINEAR_HORIZONTAL) (:v $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL) (:vertical $ -> PIXI/TEXT_GRADIENT .-LINEAR_VERTICAL)
                      v $ do (println "\"unknown gradient type:") v
                    k $ cond
                        keyword? v
                        turn-string v
                      (string? v)
                        , v
                      (number? v)
                        , v
                      (bool? v)
                        , v
                      (list? v)
                        , v
                      true $ do (println "\"Unknown style value:" v) v
              pairs-map
              to-js-data
        |measure-text-width! $ quote
          defn measure-text-width! (text size font-family)
            when (nil? @*ctx-instance)
              let
                  el $ js/document.createElement "\"canvas"
                reset! *ctx-instance $ .getContext el "\"2d"
            set! (.-font @*ctx-instance) (str size "\"px " font-family)
            .-width $ .measureText @*ctx-instance text
        |element? $ quote
          defn element? (x) (= :element $ :phlox-node x)
        |camel-case $ quote
          defn camel-case (x)
            .replace x (new js/RegExp "\"-[a-z]")
              fn (x idx full-text) (.toUpperCase $ get x 1)
        |component? $ quote
          defn component? (x) (= :component $ :phlox-node x)
        |use-number $ quote
          defn use-number (x)
            if
              and (number? x) (not $ js/isNaN x)
              , x
              do (js/console.error "\"Invalid number:" x) 0
        |detect-func-in-map? $ quote
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
                , true
                recur $ rest params
        |index-items $ quote
          defn index-items (xs)
            ->> xs $ map-indexed
              fn (idx x) ([] idx x)
        |remove-nil-values $ quote
          defn remove-nil-values (dict)
            ->> dict $ filter
              fn (pair) (some? $ last pair)
        |rand-color $ quote
          defn rand-color () (rand-int 0xffffff)
        |*ctx-instance $ quote (defatom *ctx-instance nil)
      :proc $ quote ()
    |phlox.complex $ {}
      :ns $ quote (ns phlox.complex)
      :defs $ {}
        |rand-point $ quote
          defn$ rand-point
              n
              rand-point n n
            (n m)
              []
                - n $ rand-int (* 2 n)
                - m $ rand-int (* 2 m)
        |add $ quote
          defn add (p1 p2)
            let-sugar
                  [] a b
                  , p1
                ([] x y)
                  , p2
              [] (+ a x) (+ b y)
        |rebase $ quote
          defn rebase
              [] x y
              [] a b
            , "\"complex number division, renamed since naming collision"
            let
                inverted $ / 1
                  + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
        |divide-by $ quote
          defn divide-by (point x)
            []
              / (first point) x
              / (last point) x
        |minus $ quote
          defn minus
              [] a b
              [] x y
            [] (- a x) (- b y)
        |times $ quote
          defn times
              [] a b
              [] x y
            []
              - (* a x) (* b y)
              + (* a y) (* b x)
      :proc $ quote ()
    |phlox.app.config $ {}
      :ns $ quote (ns phlox.app.config)
      :defs $ {}
        |cdn? $ quote
          def cdn? $ cond
              exists? js/window
              , false
            (exists? js/process)
              = "\"true" js/process.env.cdn
            :else false
        |dev? $ quote (def dev? true)
        |site $ quote
          def site $ {} (:dev-ui "\"http://localhost:8100/main.css") (:release-ui "\"http://cdn.tiye.me/favored-fonts/main.css") (:cdn-url "\"http://cdn.tiye.me/phlox/") (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox")
      :proc $ quote ()
    |phlox.app.container $ {}
      :ns $ quote
        ns phlox.app.container $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list >>) ([] phlox.app.comp.drafts :refer $ [] comp-drafts) ([] phlox.app.comp.keyboard :refer $ [] comp-keyboard) ([] phlox.comp.button :refer $ [] comp-button) ([] phlox.comp.drag-point :refer $ [] comp-drag-point) ([] phlox.comp.switch :refer $ [] comp-switch) ([] phlox.app.comp.slider-demo :refer $ [] comp-slider-demo comp-slider-point-demo) ([] phlox.input :refer $ [] request-text!) ([] phlox.comp.messages :refer $ [] comp-messages) ([] "\"shortid" :as shortid) ([] respo-ui.core :as ui)
      :defs $ {}
        |comp-grids $ quote
          defcomp comp-grids ()
            container ({})
              create-list :container
                {} $ :position ([] 200 20)
                ->> (range 60)
                  mapcat $ fn (x)
                    ->> (range 40)
                      map $ fn (y) ([] x y)
                  map $ fn (pair)
                    let[] (x y) pair $ [] (str x "\"+" y)
                      rect $ {}
                        :position $ [] (* x 14) (* y 14)
                        :size $ [] 10 10
                        :fill $ hslx 200 80 80
                        :on $ {}
                          :pointerover $ fn (e d!) (println "\"hover:" x y)
        |comp-points-demo $ quote
          defcomp comp-points-demo (states)
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:p1 $ [] 0 0) (:p2 $ [] 0 20) (:p3 $ [] 0 40) (:p4 $ [] 0 60) (:p5 $ [] 0 80)
              container
                {} $ :position ([] 300 200)
                comp-drag-point (>> states :p1)
                  {} (:position $ :p1 state)
                    :on-change $ fn (position d!) (d! cursor $ assoc state :p1 position)
                comp-drag-point (>> states :p2)
                  {} (:position $ :p2 state) (:unit 2)
                    :on-change $ fn (position d!) (d! cursor $ assoc state :p2 position)
                comp-drag-point (>> states :p3)
                  {} (:position $ :p3 state) (:unit 0.4) (:radius 6) (:fill $ hslx 0 90 60) (:color $ hslx 0 0 50)
                    :on-change $ fn (position d!) (d! cursor $ assoc state :p3 position)
                comp-drag-point (>> states :p4)
                  {} (:position $ :p4 state) (:title "\"base")
                    :on-change $ fn (position d!) (d! cursor $ assoc state :p4 position)
                comp-drag-point (>> states :p5)
                  {} (:position $ :p5 state) (:hide-text? true)
                    :on-change $ fn (position d!) (d! cursor $ assoc state :p5 position)
        |comp-text-input $ quote
          defcomp comp-text-input (states)
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:text "\"initial text") (:long-text "\"long..")
              container ({})
                rect
                  {} (:position $ [] 240 110) (:size $ [] 80 24) (:fill $ hslx 0 0 20)
                    :on $ {}
                      :pointertap $ fn (e d!)
                        request-text! e
                          {} (:initial $ :text state)
                            :style $ {} (:color "\"blue")
                          fn (result) (d! cursor $ assoc state :text result)
                  text $ {} (:text $ :text state) (:position $ [] 6 4)
                    :style $ {} (:font-size 14) (:fill $ hslx 0 0 80)
                rect
                  {} (:position $ [] 240 180) (:size $ [] 200 100) (:fill $ hslx 0 0 20)
                    :on $ {}
                      :pointertap $ fn (e d!)
                        request-text! e
                          {} (:initial $ :long-text state)
                            :style $ {} (:font-family ui/font-code)
                            :textarea? true
                          fn (result) (d! cursor $ assoc state :long-text result)
                  text $ {} (:text $ :long-text state) (:position $ [] 6 4)
                    :style $ {} (:font-size 14) (:fill $ hslx 0 0 80)
        |comp-buttons $ quote
          defcomp comp-buttons ()
            container
              {} $ :position ([] 300 100)
              comp-button $ {} (:text "\"DEMO BUTTON") (:position $ [] 100 0)
                :on $ {}
                  :pointertap $ fn (e d!) (js/console.log "\"clicked" e d!)
              comp-button $ {} (:text "\"Blue") (:position $ [] 100 60) (:color $ hslx 0 80 70) (:fill $ hslx 200 80 40)
              comp-button $ {} (:text "\"Short hand pointertap") (:position $ [] 100 120)
                :on-pointertap $ fn (e d!) (println "\"clicked")
        |comp-messages-demo $ quote
          defcomp comp-messages-demo (states)
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:messages $ []) (:bottom? false)
              container ({})
                comp-button $ {} (:text "\"Add message") (:position $ [] 400 200)
                  :on-pointertap $ fn (e d!)
                    d! cursor $ update state :messages
                      fn (xs)
                        conj xs $ {} (:id $ shortid/generate)
                          :text $ str "\"Messages of. " (shortid/generate)
                comp-switch $ {} (:value $ :bottom? state) (:title "\"At bottom") (:position $ [] 400 280)
                  :on-change $ fn (e d!) (d! cursor $ update state :bottom? not)
                comp-messages $ {} (:messages $ :messages state) (:bottom? $ :bottom? state)
                  :on-pointertap $ fn (message d!)
                    d! cursor $ update state :messages
                      fn (xs)
                        ->> xs $ filter-not
                          fn (x)
                            = (:id x) (:id message)
        |comp-tab-entry $ quote
          defcomp comp-tab-entry (tab-value tab-title idx selected?)
            container
              {} $ :position
                [] 10 $ + 50 (* idx 40)
              rect $ {} (:position $ [] 0 0) (:size $ [] 160 32)
                :fill $ if selected? (hslx 180 50 50) (hslx 180 50 30)
                :on $ {}
                  :pointertap $ fn (event dispatch!) (dispatch! :tab tab-value)
              text $ {} (:text tab-title)
                :style $ {} (:fill $ hslx 200 90 100) (:font-size 20) (:font-family "\"Josefin Sans")
                :position $ [] 10 3
        |tabs $ quote
          def tabs $ [] ([] :drafts "\"Drafts") ([] :grids "\"Grids") ([] :curves "\"Curves") ([] :gradients "\"Gradients") ([] :keyboard "\"Keyboard") ([] :slider "\"Slider") ([] :buttons "\"Buttons") ([] :points "\"Points") ([] :switch "\"Switch") ([] :input "\"Input") ([] :messages "\"Messages") ([] :slider-point "\"Slider Point")
        |comp-gradients $ quote
          defcomp comp-gradients ()
            container ({})
              text $ {} (:text "\"long long text") (:position $ [] 200 160)
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :v
              text $ {} (:text "\"long long text") (:position $ [] 200 200)
                :style $ {}
                  :fill $ [] (hslx 0 0 100) (hslx 0 0 40)
                  :fill-gradient-type :h
              text $ {} (:text "\"long long text") (:position $ [] 200 120)
                :style $ {} (:fill $ hslx 20 90 60)
        |comp-container $ quote
          defcomp comp-container (store) (; println "\"Store" store $ :tab store)
            let
                cursor $ []
                states $ :states store
              container ({})
                create-list :container ({})
                  ->> tabs $ map-indexed
                    fn (idx info)
                      let-sugar
                            [] tab title
                            , info
                        [] idx $ comp-tab-entry tab title idx (= tab $ :tab store)
                case (:tab store)
                  :drafts $ comp-drafts (:x store)
                  :grids $ comp-grids
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
                  (:tab store)
                    text $ {} (:text "\"Unknown")
                      :style $ {} (:fill $ hslx 0 100 80) (:font-size 12) (:font-family "\"Helvetica")
        |comp-switch-demo $ quote
          defcomp comp-switch-demo (states)
            let
                cursor $ :cursor states
                state $ either (:data states) ({} $ :value false)
              container
                {} $ :position ([] 300 300)
                comp-switch $ {} (:value $ :value state) (:position $ [] 0 0)
                  :on-change $ fn (value d!) (d! cursor $ assoc state :value value)
                comp-switch $ {} (:value $ :value state) (:position $ [] 100 20) (:title "\"Custom title")
                  :on-change $ fn (value d!) (d! cursor $ assoc state :value value)
        |comp-curves $ quote
          defcomp comp-curves ()
            graphics $ {}
              :ops $ []
                g :line-style $ {} (:width 2) (:color $ hslx 200 80 80) (:alpha 1)
                g :move-to $ [] 0 0
                g :line-to $ [] 100 200
                g :arc-to $ {} (:p1 $ [] 200 200) (:p2 $ [] 240 180) (:radius 90)
                g :line-style $ {} (:width 2) (:color $ hslx 0 80 80) (:alpha 1)
                g :arc $ {} (:center $ [] 260 120) (:radius 40) (:angle $ [] 90 270) (:anticlockwise? false)
                g :line-style $ {} (:width 2) (:color $ hslx 20 80 40) (:alpha 1)
                g :arc $ {} (:center $ [] 260 120) (:radius 40) (:angle $ [] 270 30) (:anticlockwise? false)
                g :line-style $ {} (:width 2) (:color $ hslx 200 80 80) (:alpha 1)
                g :quadratic-to $ {} (:p1 $ [] 400 100) (:to-p $ [] 500 400)
                g :bezier-to $ {} (:p1 $ [] 400 500) (:p2 $ [] 300 200) (:to-p $ [] 600 300)
                g :begin-fill $ {} (:color $ hslx 200 80 80) (:alpha 1)
                g :arc $ {} (:center $ [] 600 300) (:radius 20) (:angle $ [] 0 300) (:anticlockwise? false)
                g :end-fill nil
                ; g :line-to $ [] 400 400
      :proc $ quote ()
    |phlox.util.lcs $ {}
      :ns $ quote (ns phlox.util.lcs)
      :defs $ {}
        |find-minimal-ops $ quote
          defn find-minimal-ops (state xs ys)
            ; println "\"find ops" state (count xs) (count ys)
            cond
                and (empty? xs) (empty? ys)
                , state
              (and (empty? xs) (not $ empty? ys))
                recur
                  -> state
                    update :acc $ fn (acc)
                      conj acc $ [] :add (first ys)
                    update :step inc
                  []
                  rest ys
              (and (empty? ys) (not $ empty? xs))
                recur
                  -> state
                    update :acc $ fn (acc)
                      conj acc $ [] :remove (first xs)
                    update :step inc
                  rest xs
                  []
              :else $ let
                  x0 $ first xs
                  y0 $ first ys
                cond
                    = x0 y0
                    recur
                      -> state
                        update :acc $ fn (acc) (conj acc $ [] :remains x0)
                        update :step inc
                      rest xs
                      rest ys
                  (any? (fn (y) (= x0 y)) (, ys))
                    recur
                      -> state
                        update :acc $ fn (acc) (conj acc $ [] :remove x0)
                        update :step inc
                      rest xs
                      , ys
                  (any? (fn (x) (= y0 x)) (, xs))
                    recur
                      -> state
                        update :acc $ fn (acc) (conj acc $ [] :add y0)
                        update :step inc
                      , xs
                      rest ys
                  :else $ let
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
                        , xs
                        rest ys
                    if
                      <= (:step solution-a) (:step solution-b)
                      , solution-a solution-b
        |lcs-state-0 $ quote
          def lcs-state-0 $ {} (:acc $ []) (:step 0)
      :proc $ quote ()
    |phlox.comp.switch $ {}
      :ns $ quote
        ns phlox.comp.switch $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list) ([] phlox.check :refer $ [] lilac-event-map dev-check lilac-point) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+)
      :defs $ {}
        |comp-switch $ quote
          defcomp comp-switch (props) (dev-check props lilac-switch)
            let
                value $ :value props
                on-change $ :on-change props
              container
                {} $ :position
                  either (:position props) ([] 0 0)
                rect $ {} (:size $ [] 56 20)
                  :fill $ if value (hslx 0 0 92) (hslx 0 0 50)
                  :position $ [] 0 0
                  :radius 3
                  :on $ {}
                    :pointertap $ fn (e d!)
                      when (fn? on-change)
                        on-change (not value) d!
                text $ {} (:text $ if value "\"On" "\"Off")
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
                  :style $ {} (:fill $ hslx 0 0 80) (:font-size 13) (:font-family "\"Arial, sans-serif")
                  :alpha 1
        |lilac-switch $ quote
          def lilac-switch $ record+
            {} (:value $ boolean+) (:position $ optional+ lilac-point) (:on-change $ fn+)
              :title $ optional+ (string+)
            {} $ :check-keys? true
      :proc $ quote ()
    |phlox.app.schema $ {}
      :ns $ quote (ns phlox.app.schema)
      :defs $ {}
        |store $ quote
          def store $ {} (:tab :drafts) (:x 0) (:keyboard-on? false) (:counted 0) (:states $ {}) (:cursor $ [])
      :proc $ quote ()
    |phlox.app.main $ {}
      :ns $ quote
        ns phlox.app.main $ :require ([] "\"pixi.js" :as PIXI) ([] phlox.core :refer $ [] render! clear-phlox-caches!) ([] phlox.app.container :refer $ [] comp-container) ([] phlox.app.schema :as schema) ([] phlox.app.config :refer $ [] dev?) ([] "\"shortid" :as shortid) ([] phlox.app.updater :refer $ [] updater) ([] "\"fontfaceobserver-es" :as FontFaceObserver)
      :defs $ {}
        |*store $ quote (defatom *store schema/store)
        |dispatch! $ quote
          defn dispatch! (op op-data)
            when (and dev? $ not= op :states) (println "\"dispatch!" op op-data)
            let
                op-id $ shortid/generate
                op-time $ .now js/Date
              reset! *store $ updater @*store op op-data op-id op-time
        |main! $ quote
          defn main! () (; js/console.log PIXI)
            -> (new FontFaceObserver/default "\"Josefin Sans") (.load)
              .then $ fn (event) (render-app!)
            add-watch *store :change $ fn (store prev) (render-app!)
            println "\"App Started"
        |reload! $ quote
          defn reload! () (println "\"Code updated.") (clear-phlox-caches!) (remove-watch *store :change)
            add-watch *store :change $ fn (store prev) (render-app!)
            render-app! true
        |render-app! $ quote
          defn render-app! (& args)
            render! (comp-container @*store) dispatch! $ either (first args) ({})
      :proc $ quote ()
    |phlox.cursor $ {}
      :ns $ quote (ns phlox.cursor)
      :defs $ {}
        |update-states $ quote
          defn update-states (store op-data)
            let-sugar
                  [] cursor data
                  , op-data
              assoc-in store
                concat ([] :states) cursor $ [] :data
                , data
      :proc $ quote ()
    |phlox.comp.slider $ {}
      :ns $ quote
        ns phlox.comp.slider $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list) ([] phlox.check :refer $ [] lilac-event-map dev-check) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+)
      :defs $ {}
        |comp-slider $ quote
          defcomp comp-slider (states props)
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
                round? $ :round? props
              container
                {} $ :position (:position props)
                rect
                  {} (:size $ [] 120 24) (:fill fill)
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x1 $ -> e .-data .-global .-x
                          d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                      :pointermove $ fn (e d!)
                        when (:dragging? state)
                          let
                              x2 $ -> e .-data .-global .-x
                            if (fn? on-change)
                              on-change
                                ->
                                  + (:v0 state)
                                    * unit $ - x2 (:x0 state)
                                  (fn (v) (if round? (js/Math.round v) v))
                                  (fn (v) (if (some? $ :max props) (min (:max props) v) (, v)))
                                  (fn (v) (if (some? $ :min props) (max (:min props) v) (, v)))
                                , d!
                              js/console.log "\"[slider] missing :on-change listener"
                      :pointerup $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                      :pointerupoutside $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                  text $ {}
                    :text $ str "\"◀ "
                      if (number? value) (.toFixed value $ if round? 0 4) (, "\"nil")
                      , "\" ▶"
                    :position $ [] 4 4
                    :style $ {} (:fill color) (:font-size 12) (:font-family "\"Menlo, monospace")
                  text $ {}
                    :text $ str
                      if (string? title) (str title "\" ") (, "\"")
                      , "\"◈ " unit
                    :position $ [] 0 -18
                    :style $ {} (:fill $ hslx 0 0 80) (:font-size 13) (:font-family "\"Arial, sans-serif")
        |lilac-slider $ quote
          def lilac-slider $ record+
            {} (:value $ number+) (:on-change $ fn+)
              :unit $ optional+ (number+)
              :fill $ optional+ (number+)
              :color $ optional+ (number+)
              :title $ optional+ (string+)
              :round? $ optional+ (boolean+)
              :max $ optional+ (number+)
              :min $ optional+ (number+)
              :position $ optional+
                tuple+ $ [] (number+) (number+)
            {} $ :check-keys? true
        |lilac-cursor $ quote
          def lilac-cursor $ list+
            any+ $ {} (:some? true)
        |comp-slider-point $ quote
          defcomp comp-slider-point (states props)
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
                round? $ :round? props
              container
                {} $ :position (:position props)
                rect
                  {} (:size $ [] 12 12) (:fill fill) (:radius 4)
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x1 $ -> e .-data .-global .-x
                          d! cursor $ {} (:dragging? true) (:v0 value) (:x0 x1)
                      :pointermove $ fn (e d!)
                        when (:dragging? state)
                          let
                              x2 $ -> e .-data .-global .-x
                            if (fn? on-change)
                              on-change
                                ->
                                  + (:v0 state)
                                    * unit $ - x2 (:x0 state)
                                  (fn (v) (if round? (js/Math.round v) v))
                                  (fn (v) (if (some? $ :max props) (min (:max props) v) (, v)))
                                  (fn (v) (if (some? $ :min props) (max (:min props) v) (, v)))
                                , d!
                              js/console.log "\"[slider] missing :on-change listener"
                      :pointerup $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                      :pointerupoutside $ fn (e d!)
                        d! cursor $ {} (:v0 value) (:x0 0) (:dragging? false)
                  text $ {}
                    :text $ str
                      if (number? value) (.toFixed value $ if round? 0 4) (, "\"nil")
                    :position $ [] 16 1
                    :style $ {} (:fill color) (:font-size 10) (:font-family "\"Menlo, monospace")
        |lilac-slider-point $ quote
          def lilac-slider-point $ record+
            {} (:value $ number+) (:on-change $ fn+)
              :unit $ optional+ (number+)
              :fill $ optional+ (number+)
              :color $ optional+ (number+)
              :round? $ optional+ (boolean+)
              :max $ optional+ (number+)
              :min $ optional+ (number+)
              :position $ optional+
                tuple+ $ [] (number+) (number+)
            {} $ :check-keys? true
      :proc $ quote ()
    |phlox.comp.button $ {}
      :ns $ quote
        ns phlox.comp.button $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list) ([] phlox.util :refer $ [] measure-text-width!) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+) ([] phlox.check :refer $ [] lilac-event-map dev-check)
      :defs $ {}
        |comp-button $ quote
          defcomp comp-button (props) (dev-check props lilac-button)
            let
                button-text $ either (:text props) "\"BUTTON"
                size $ either (:font-size props) 14
                font-family $ either (:font-family props) "\"Josefin Sans"
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
                rect $ {} (:fill fill) (:size $ [] width 32)
                  :on $ cond
                      some? $ :on props
                      :on props
                    (some? $ :on-pointertap props)
                      {} $ :pointertap (:on-pointertap props)
                    :else $ do
                text $ {} (:text button-text) (:position $ [] 8 8)
                  :style $ {} (:fill color) (:font-size size) (:font-family font-family)
        |lilac-button $ quote
          def lilac-button $ record+
            {} (:color $ number+) (:fill $ number+) (:text $ string+) (:size $ number+) (:font-family $ string+)
              :position $ tuple+
                [] (number+) (number+)
              :on lilac-event-map
              :on-pointertap $ fn+
              :align-right? $ boolean+
            {} (:all-optional? true) (:check-keys? true)
      :proc $ quote ()
    |phlox.app.updater $ {}
      :ns $ quote
        ns phlox.app.updater $ :require ([] phlox.cursor :refer $ [] update-states)
      :defs $ {}
        |updater $ quote
          defn updater (store op op-data op-id op-time)
            case op
              :add-x $ update store :x
                fn (x)
                  if (> x 10) 0 $ + x 1
              :tab $ assoc store :tab op-data
              :toggle-keyboard $ update store :keyboard-on? not
              :counted $ update store :counted inc
              :states $ update-states store op-data
              :hydrate-storage op-data
              op $ do (println "\"unknown op" op op-data) store
      :proc $ quote ()
    |phlox.app.comp.drafts $ {}
      :ns $ quote
        ns phlox.app.comp.drafts $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list)
      :defs $ {}
        |comp-drafts $ quote
          defcomp comp-drafts (x)
            container
              {} (:position $ [] 400 100) (:rotation 0)
              circle $ {} (:position $ [] 200 100) (:radius 40)
                :line-style $ {} (:width 4) (:color $ hslx 0 80 50) (:alpha 1)
                :fill $ hslx 160 80 70
                :on $ {}
                  :pointertap $ fn (event dispatch!) (dispatch! :add-x nil)
              rect
                {} (:position $ [] 40 40) (:size $ [] 50 50)
                  :line-style $ {} (:width 4) (:color $ hslx 0 80 50) (:alpha 1)
                  :fill $ hslx 200 80 80
                  :on $ {}
                    :pointertap $ fn (e dispatch!) (dispatch! :add-x nil)
                  :rotation $ + 1 (* 0.1 x)
                  :pivot $ [] 0 0
                text $ {}
                  :text $ str "\"Text demo:" (+ 1 $ * 0.1 x) (, &newline "\"pivot")
                    pr-str $ {} (:x 100) (:y 100)
                  :style $ {} (:font-family "\"Menlo") (:font-size 12) (:fill $ hslx 200 80 90) (:align :center)
              text $ {} (:text $ str "\"Text demo:" x)
                :style $ {} (:font-family "\"Menlo") (:font-size 12)
                  :fill $ hslx 200 80
                    + 80 $ * 20 (js/Math.random)
                  :align :center
                :alpha 1
              create-list :container ({})
                ->> (range 20)
                  map $ fn (idx)
                    [] idx $ text
                      {} (:text $ str idx)
                        :style $ {} (:font-family "\"Helvetica Neue") (:font-weight 300) (:font-size 14)
                          :fill $ hslx 200 10 (+ 40 $ * 4 idx)
                        :position $ [] (+ 200 $ * idx 20) (+ 140 $ * idx 10)
                        :rotation $ * 0.1 (+ idx x)
              graphics $ {}
                :ops $ []
                  [] :line-style $ {} (:width 4) (:color $ hslx 200 80 80) (:alpha 1)
                  [] :begin-fill $ {} (:color $ hslx 0 80 20)
                  [] :move-to $ []
                    + (* 20 x) 100
                    , 200
                  [] :line-to $ []
                    + (* 20 x) 400
                    , 400
                  [] :line-to $ [] (- 500 $ * 20 x) (, 300)
                  [] :close-path
                :rotation 0.1
                :pivot $ [] 0 100
                :alpha 0.5
                :on $ {}
                  :pointertap $ fn (e dispatch!) (println "\"clicked")
      :proc $ quote ()
    |phlox.keyboard $ {}
      :ns $ quote (ns phlox.keyboard)
      :defs $ {}
        |handle-keyboard-events $ quote
          defn handle-keyboard-events (*tree-element dispatch!)
            .addEventListener js/window "\"keydown" $ fn (event)
              handle-event :down (get-value *tree-element) (wrap-event event) (, dispatch!)
            .addEventListener js/window "\"keyup" $ fn (event)
              handle-event :up (get-value *tree-element) (wrap-event event) (, dispatch!)
            .addEventListener js/window "\"keypress" $ fn (event)
              handle-event :press (get-value *tree-element) (wrap-event event) (, dispatch!)
        |handle-event $ quote
          defn handle-event (kind tree event dispatch!)
            when (some? tree)
              case (:phlox-node tree)
                :component $ recur kind (:tree tree) event dispatch!
                :element $ do
                  let
                      listener $ get-in tree ([] :props :on-keyboard kind)
                    when (fn? listener) (listener event dispatch!)
                  ->> (:children tree)
                    map $ fn (pair)
                      let[] (k child) pair $ handle-event kind child event dispatch!
                do $ js/console.log "\"unknown tree for handling event:" tree
        |wrap-event $ quote
          defn wrap-event (event)
            {} (:event event) (:key $ .-key event) (:key-code $ .-keyCode event) (:ctrl? $ .-ctrlKey event) (:meta? $ .-metaKey event) (:shift? $ .-shiftKey event)
        |get-value $ quote
          defn get-value (*x) @*x
      :proc $ quote ()
    |phlox.input $ {}
      :ns $ quote
        ns phlox.input $ :require ([] respo.render.html :refer $ [] style->string) ([] respo.util.format :refer $ [] hsl) ([] respo-ui.core :as ui) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+) ([] phlox.check :refer $ [] dev-check)
      :defs $ {}
        |request-text! $ quote
          defn request-text! (e options cb) (dev-check options lilac-input)
            let
                root $ js/document.createElement "\"div"
                control $ js/document.createElement "\"div"
                textarea? $ :textarea? options
                input $ js/document.createElement (if textarea? "\"textarea" "\"input")
                submit $ js/document.createElement "\"a"
                x $ -> e .-data .-global .-x
                y $ -> e .-data .-global .-y
                close $ js/document.createElement "\"span"
              .appendChild root input
              .appendChild root control
              .appendChild control close
              when textarea? (.appendChild control submit)
                set! (.-innerText submit) "\"Ok"
                .appendChild root control
              set! (.-style root)
                style->string $ to-pairs
                  merge ui/row style-container
                    {} (:top y) (:left x)
                    if textarea? $ {} (:width 320)
                    if
                      < (- js/window.innerWidth x) 240
                      {} (:left nil) (:right 8)
                    if
                      < (- js/window.innerHeight y) 70
                      {} (:top nil) (:bottom 8)
              set! (.-style input)
                style->string $ to-pairs
                  merge ui/expand style-input
                    if textarea? $ {} (:height 80)
                    :style options
              set! (.-style control)
                style->string $ to-pairs
                  merge ui/column $ {} (:justify-content :space-evenly)
              set! (.-style close) (style->string $ to-pairs style-close)
              set! (.-placeholder input)
                either (:placeholder options) "\"text..."
              set! (.-value input)
                either (:initial options) "\""
              set! (.-innerText close) "\"×"
              .addEventListener input "\"keydown" $ fn (event)
                when
                  and (= "\"Enter" $ .-key event)
                    if textarea? (.-metaKey event) true
                  cb $ .-value input
                  .remove root
              .addEventListener close "\"click" $ fn (event) (.remove root)
              when textarea?
                set! (.-style submit) (style->string $ to-pairs style-submit)
                .addEventListener submit "\"click" $ fn (event) (cb $ .-value input) (.remove root)
              .appendChild js/document.body root
              .select input
        |lilac-input $ quote
          def lilac-input $ record+
            {} (:placeholder $ string+) (:initial $ string+)
              :style $ map+ (keyword+) (any+)
              :textarea? $ boolean+
            {} (:all-optional? true) (:check-keys? true)
        |style-container $ quote
          def style-container $ {} (:position :absolute) (:padding "\"10px 12px") (:background-color $ hsl 0 0 30 0.9)
            :border $ str "\"1px solid " (hsl 0 0 30)
            :width 240
            :border-radius "\"2px"
        |style-input $ quote
          def style-input $ {} (:outline :none) (:font-family ui/font-normal) (:line-height "\"20px") (:font-size 14) (:padding "\"6px 8px") (:width "\"100%") (:border-radius "\"2px") (:border :none) (:height 28)
        |style-close $ quote
          def style-close $ {} (:margin-left 8) (:font-family "\"Helvetica, sans-serif") (:font-size 24) (:font-weight 100) (:color $ hsl 0 80 80) (:cursor :pointer)
        |style-submit $ quote
          def style-submit $ {} (:margin-left 8) (:color $ hsl 200 80 80) (:cursor :pointer)
      :proc $ quote ()
    |phlox.comp.drag-point $ {}
      :ns $ quote
        ns phlox.comp.drag-point $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list) ([] phlox.check :refer $ [] lilac-event-map dev-check) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ enum+ map+ fn+ any+ keyword+ boolean+ list+ or+ is+) ([] phlox.complex :as complex)
      :defs $ {}
        |comp-drag-point $ quote
          defn comp-drag-point (states props)
            dev-check (:cursor states) lilac-cursor
            dev-check props lilac-drag-point
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:dragging? false) (:x0 $ [] 0 0)
                unit $ either (:unit props) 1
                radius $ either (:radius props) 3
                color $ either (:color props) (hslx 0 0 100)
                fill $ either (:fill props) (hslx 0 0 60)
                on-change $ :on-change props
                hide-text? $ either (:hide-text? props) false
              let
                  position $ :position props
                container ({} $ :position position)
                  circle $ {} (:radius radius) (:position $ [] 0 0) (:fill fill)
                    :on $ {}
                      :pointerdown $ fn (e d!)
                        let
                            x $ -> e .-data .-global .-x
                            y $ -> e .-data .-global .-y
                          d! cursor $ merge state
                            {} (:dragging? true) (:x0 $ [] x y) (:p0 position)
                      :pointermove $ fn (e d!)
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
                      :pointerup $ fn (e d!) (d! cursor $ assoc state :dragging? false)
                      :pointerupoutside $ fn (e d!) (d! cursor $ assoc state :dragging? false)
                  if-not hide-text? $ text
                    {}
                      :text $ str "\"("
                        .toFixed
                          either (first position) 0
                          , 1
                        , "\", "
                        .toFixed
                          either (last position) 0
                          , 1
                        , "\")➤"
                        str unit
                      :alpha 0.3
                      :position $ [] -20 -16
                      :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "\"Menlo, monospace")
                  if
                    and (not hide-text?) (some? $ :title props)
                    text $ {} (:text $ :title props) (:alpha 0.3) (:position $ [] -12 6)
                      :style $ {} (:fill color) (:font-size 10) (:line-height 10) (:font-family "\"Menlo, monospace") (:align :center)
        |lilac-drag-point $ quote
          def lilac-drag-point $ record+
            {}
              :unit $ optional+ (number+)
              :title $ optional+ (string+)
              :radius $ optional+ (number+)
              :fill $ optional+ (number+)
              :color $ optional+ (number+)
              :position $ tuple+
                [] (number+) (number+)
              :hide-text? $ optional+ (boolean+)
              :on-change $ fn+
            {} $ :check-keys? true
        |lilac-cursor $ quote
          def lilac-cursor $ list+
            any+ $ {} (:some? true)
      :proc $ quote ()
    |phlox.app.comp.slider-demo $ {}
      :ns $ quote
        ns phlox.app.comp.slider-demo $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list >>) ([] phlox.comp.slider :refer $ [] comp-slider comp-slider-point)
      :defs $ {}
        |comp-slider-demo $ quote
          defcomp comp-slider-demo (states)
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position ([] 300 100)
                comp-slider (>> states :a)
                  {} (:value $ :a state) (:unit 1) (:position $ [] 20 0)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :a value)
                comp-slider (>> states :b)
                  {} (:value $ :b state) (:title "\"Refine") (:unit 0.1) (:position $ [] 20 60)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :b value)
                comp-slider (>> states :c)
                  {} (:value $ :c state) (:unit 10) (:position $ [] 20 120) (:fill $ hslx 50 90 70) (:color $ hslx 200 90 30)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :c value)
                comp-slider (>> states :d)
                  {} (:value $ :d state) (:position $ [] 20 180)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :d value)
                    :title "\"Round"
                    :round? true
                comp-slider (>> states :e)
                  {} (:value $ :e state) (:position $ [] 20 240)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :e value)
                    :title "\"min 10"
                    :min 10
                comp-slider (>> states :f)
                  {} (:value $ :f state) (:position $ [] 20 300)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :f value)
                    :title "\"max 10"
                    :max 10
        |comp-slider-point-demo $ quote
          defn comp-slider-point-demo (states)
            let
                cursor $ :cursor states
                state $ either (:data states)
                  {} (:a 40) (:b 20) (:c 10) (:d 10) (:e 10) (:f 10)
              container
                {} $ :position ([] 300 100)
                comp-slider-point (>> states :a)
                  {} (:value $ :a state) (:unit 1) (:position $ [] 20 0)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :a value)
                comp-slider-point (>> states :b)
                  {} (:value $ :b state) (:unit 0.1) (:position $ [] 20 60)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :b value)
                comp-slider-point (>> states :c)
                  {} (:value $ :c state) (:unit 10) (:position $ [] 20 120) (:fill $ hslx 50 90 70) (:color $ hslx 200 90 30)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :c value)
                comp-slider-point (>> states :d)
                  {} (:value $ :d state) (:position $ [] 20 180)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :d value)
                    :round? true
                comp-slider-point (>> states :e)
                  {} (:value $ :e state) (:position $ [] 20 240)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :e value)
                    :min 10
                comp-slider-point (>> states :f)
                  {} (:value $ :f state) (:position $ [] 20 300)
                    :on-change $ fn (value d!) (d! cursor $ assoc state :f value)
                    :max 10
      :proc $ quote ()
    |phlox.core $ {}
      :ns $ quote
        ns phlox.core $ :require ([] "\"pixi.js" :as PIXI) ([] phlox.render :refer $ [] render-element update-element update-children) ([] phlox.util :refer $ [] index-items remove-nil-values detect-func-in-map?) ([] "\"./hue-to-rgb" :refer $ [] hslToRgb) ([] phlox.check :refer $ [] dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-point lilac-circle dev-check-message lilac-line-style) ([] lilac.core :refer $ [] record+ number+ string+ optional+ tuple+ map+ fn+ keyword+ boolean+ list+ or+) ([] phlox.keyboard :refer $ [] handle-keyboard-events) ([] memof.core :as memof)
      :defs $ {}
        |>> $ quote
          defn >> (states k)
            let
                parent-cursor $ either (:cursor states) ([])
                branch $ either (get states k) ({})
              assoc branch :cursor $ conj parent-cursor k
        |lilac-begin-fill $ quote
          def lilac-begin-fill $ record+
            {} (:color lilac-color)
              :alpha $ optional+ (number+)
            {} $ :check-keys? true
        |hslx $ quote
          defn hslx (h s l)
            let-sugar
                  [] r g b
                  to-calcit-data $ hslToRgb (/ h 360) (* 0.01 s) (* 0.01 l)
                r0 $ .rgb2hex PIXI/utils (to-js-data $ [] r g b)
              , r0
        |create-element $ quote
          defn create-element (tag props children)
            {} (:name tag) (:phlox-node :element) (:props props)
              :children $ remove-nil-values (index-items children)
        |render! $ quote
          defn render! (expanded-app dispatch! options)
            when (nil? @*app)
              let
                  pixi-app $ new PIXI/Application
                    to-js-data $ {} (:backgroundColor $ hslx 0 0 0) (:antialias true) (:autoDensity true) (:resolution 2) (:width js/window.innerWidth) (:height js/window.innerHeight) (:interactive true)
                reset! *app pixi-app
                -> js/document .-body $ .appendChild (.-view pixi-app)
                .addEventListener js/window "\"resize" $ fn (event) (-> pixi-app .-renderer $ .resize js/window.innerWidth js/window.innerHeight)
              aset js/window "\"_phloxTree" @*app
            let
                wrap-dispatch $ fn (op data)
                  if (list? op) (dispatch! :states $ [] op data) (dispatch! op data)
              ; js/console.log "\"render!" expanded-app
              if (nil? @*tree-element)
                do (mount-app! expanded-app wrap-dispatch) (handle-keyboard-events *tree-element wrap-dispatch)
                rerender-app! expanded-app wrap-dispatch options
              reset! *tree-element expanded-app
            memof/new-loop! *phlox-caches
        |create-list $ quote
          defn create-list (tag props children)
            {} (:name tag) (:phlox-node :element) (:props props) (:children $ remove-nil-values children)
        |*phlox-caches $ quote
          defatom *phlox-caches $ memof/new-states
            {} (:trigger-loop 200) (:elapse-loop 600)
        |graphics $ quote
          defn graphics (props & children) (dev-check props lilac-graphics) (create-element :graphics props children)
        |mount-app! $ quote
          defn mount-app! (app dispatch!)
            let
                element-tree $ render-element app dispatch!
              .addChild (.-stage @*app) element-tree
        |*app $ quote (defatom *app nil)
        |*renderer $ quote (defatom *renderer nil)
        |lilac-arc-to $ quote
          def lilac-arc-to $ record+
            {} (:p1 lilac-point) (:p2 lilac-point) (:radius $ number+)
            {} $ :exact-keys? true
        |text $ quote
          defn text (props & children) (dev-check props lilac-text) (create-element :text props children)
        |lilac-arc $ quote
          def lilac-arc $ record+
            {} (:center lilac-point)
              :angle $ optional+
                tuple+ $ [] (number+) (number+)
              :radian $ optional+
                tuple+ $ [] (number+) (number+)
              :radius $ number+
              :anticlockwise? $ optional+ (boolean+)
            {} $ :check-keys? true
        |rerender-app! $ quote
          defn rerender-app! (app dispatch! options) (; js/console.log "\"rerender tree" app @*tree-element)
            update-children ([] $ [] 0 app) ([] $ [] 0 @*tree-element) (.-stage @*app) (, dispatch! options)
        |lilac-quodratic-to $ quote
          def lilac-quodratic-to $ record+
            {} (:p1 lilac-point) (:to-p lilac-point)
            {} $ :exact-keys? true
        |g $ quote
          defn g (op data)
            case op (:move-to $ dev-check-message "\"check :move-to" data lilac-point) (:line-to $ dev-check-message "\"check :line-to" data lilac-point) (:line-style $ dev-check-message "\"check :line-style" data lilac-line-style) (:begin-fill $ dev-check-message "\"check :fill" data lilac-begin-fill) (:end-fill $ do) (:close-path $ do) (:arc $ dev-check-message "\"check :arc" data lilac-arc) (:arc-to $ dev-check-message "\"check :arc-to" data lilac-arc-to) (:bezier-to $ dev-check-message "\"check :bezier-to" data lilac-bezier-to) (:quadratic-to $ dev-check-message "\"check :quadratic-to" data lilac-quodratic-to) (:begin-hole $ do) (:end-hole $ do) (op $ js/console.warn "\"not supported:" op)
            [] op data
        |*tree-element $ quote (defatom *tree-element nil)
        |rect $ quote
          defn rect (props & children) (dev-check props lilac-rect) (create-element :rect props children)
        |circle $ quote
          defn circle (props & children) (dev-check props lilac-circle) (create-element :circle props children)
        |*events-element $ quote (defatom *events-element nil)
        |lilac-bezier-to $ quote
          def lilac-bezier-to $ record+
            {} (:p1 lilac-point) (:p2 lilac-point) (:to-p lilac-point)
            {} $ :exact-keys? true
        |defcomp $ quote
          defmacro defcomp (name params & body) (quote-replace $ defn ~name ~params ~@body)
        |container $ quote
          defn container (props & children) (dev-check props lilac-container) (create-element :container props children)
        |clear-phlox-caches! $ quote
          defn clear-phlox-caches! () (memof/reset-entries! *phlox-caches)
      :proc $ quote ()
    |phlox.render $ {}
      :ns $ quote
        ns phlox.render $ :require ([] "\"pixi.js" :as PIXI) ([] phlox.util :refer $ [] use-number component? element? remove-nil-values index-items convert-line-style) ([] phlox.util.lcs :refer $ [] find-minimal-ops lcs-state-0) ([] phlox.render.draw :refer $ [] call-graphics-ops update-position update-pivot update-rotation update-alpha update-events draw-circle draw-rect init-events init-position init-pivot init-angle init-rotation init-alpha init-line-style) ([] phlox.check :refer $ [] dev-check lilac-color lilac-rect lilac-text lilac-container lilac-graphics lilac-circle)
      :defs $ {}
        |render-children $ quote
          defn render-children (target children dispatch!)
            &doseq (child-pair children)
              if (some? child-pair)
                .addChild target $ render-element (last child-pair) dispatch!
                js/console.log "\"nil child:" child-pair
        |render-element $ quote
          defn render-element (element dispatch!)
            case (:phlox-node element)
              :element $ case (:name element) (nil nil) (:container $ render-container element dispatch!) (:graphics $ render-graphics element dispatch!) (:circle $ render-circle element dispatch!) (:rect $ render-rect element dispatch!) (:text $ render-text element dispatch!)
                  :name element
                  do (println "\"unknown tag:" $ :tag element) ({})
              :component $ render-element (:tree element) dispatch!
              (:phlox-node element)
                do $ js/console.error "\"Unknown element:" element
        |update-circle $ quote
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
                .clear target
                init-fill target $ :fill props
                init-line-style target line-style
                draw-circle target $ :radius props
              update-position target (:position props) (:position props')
              update-alpha target (:alpha props) (:alpha props')
              update-angle target (:angle props) (:angle props')
              update-rotation target (:rotation props) (:rotation props')
              update-pivot target (:pivot props) (:pivot props')
              update-events target (-> element :props :on) (-> old-element :props :on) (, dispatch!)
        |render-rect $ quote
          defn render-rect (element dispatch!)
            let
                target $ new PIXI/Graphics
                props $ :props element
                events $ :on props
              init-fill target $ :fill props
              init-line-style target $ :line-style props
              draw-rect target (:size props) (:radius props)
              init-position target $ :position props
              init-pivot target $ :pivot props
              init-rotation target $ :rotation props
              init-angle target $ :angle props
              init-alpha target $ :alpha props
              init-events target events dispatch!
              render-children target (:children element) dispatch!
              , target
        |render-container $ quote
          defn render-container (element dispatch!)
            let
                target $ new PIXI/Container
                props $ :props element
              render-children target (:children element) dispatch!
              init-position target $ :position props
              init-rotation target $ :rotation props
              init-angle target $ :angle props
              init-pivot target $ :pivot props
              init-alpha target $ :alpha props
              , target
        |update-angle $ quote
          defn update-angle (target v v0)
            when (not= v v0)
              set! (.-angle target) v
        |render-graphics $ quote
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
              init-alpha target $ :alpha props
              init-events target events dispatch!
              render-children target (:children element) dispatch!
              , target
        |render-circle $ quote
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
              init-rotation target $ :rotation props
              init-pivot target $ :pivot props
              init-angle target $ :angle props
              init-alpha target $ :alpha props
              render-children target (:children element) dispatch!
              , target
        |update-graphics $ quote
          defn update-graphics (element old-element target dispatch!)
            let
                props $ :props element
                props' $ :props old-element
                ops $ :ops props
                ops' $ :ops props'
              when (not= ops ops') (.clear target) (call-graphics-ops target ops)
              update-position target (:position props) (:position props')
              update-rotation target (:rotation props) (:rotation props')
              update-angle target (:angle props) (:angle props')
              update-pivot target (:pivot props) (:pivot props')
              update-alpha target (:alpha props) (:alpha props')
              update-events target (-> element :props :on) (-> old-element :props :on) (, dispatch!)
        |update-rect $ quote
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
                .clear target
                init-fill target $ :fill props
                init-line-style target line-style
                draw-rect target size $ :radius props
              update-position target (:position props) (:position props')
              update-rotation target (:rotation props) (:rotation props')
              update-angle target (:angle props) (:angle props')
              update-pivot target (:pivot props) (:pivot props')
              update-alpha target (:alpha props) (:alpha props')
              update-events target (-> element :props :on) (-> old-element :props :on) (, dispatch!)
        |update-container $ quote
          defn update-container (element old-element target)
            let
                props $ :props element
                props' $ :props old-element
              update-position target (:position props) (:position props')
              update-pivot target (:pivot props) (:pivot props')
              update-angle target (:angle props) (:angle props')
              update-rotation target (:rotation props) (:rotation props')
              update-alpha target (:alpha props) (:alpha props')
        |init-fill $ quote
          defn init-fill (target color) (.endFill target)
            if (some? color) (.beginFill target color)
        |in-dev? $ quote (def in-dev? false)
        |render-text $ quote
          defn render-text (element dispatch!)
            let
                style $ :style (:props element)
                text-style $ new PIXI/TextStyle (convert-line-style style)
                target $ new PIXI/Text (:text $ :props element) (, text-style)
                props $ :props element
              init-position target $ :position props
              init-pivot target $ :pivot props
              init-angle target $ :angle props
              init-rotation target $ :rotation props
              init-alpha target $ :alpha props
              render-children target (:children element) dispatch!
              , target
        |update-text $ quote
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
              update-rotation target (:rotation props) (:rotation props')
              update-angle target (:angle props) (:angle props')
              update-pivot target (:pivot props) (:pivot props')
              update-alpha target (:alpha props) (:alpha props')
        |update-element $ quote
          defn update-element (element old-element parent-element idx dispatch! options)
            cond
                or (nil? element) (nil? element)
                js/console.error "\"Not supposed to be empty"
              (and (component? element) (component? old-element) (= (:name element) (:name old-element)))
                if
                  and
                    = (:args element) (:args old-element)
                    not $ :swap? options
                  ; do (js/console.log "\"Same, no changes" $ :name element)
                    js/console.log (:args element) (:args old-element)
                  recur (:tree element) (:tree old-element) (, parent-element idx dispatch! options)
              (and (component? element) (element? old-element))
                recur (:tree element) old-element parent-element idx dispatch! options
              (and (element? element) (component? old-element))
                recur element (:tree old-element) parent-element idx dispatch! options
              (and (element? element) (element? old-element) (= (:name element) (:name old-element)))
                do
                  let
                      target $ .getChildAt parent-element idx
                    case (:name element) (:container $ update-container element old-element target) (:circle $ update-circle element old-element target dispatch!) (:rect $ update-rect element old-element target dispatch!) (:text $ update-text element old-element target) (:graphics $ update-graphics element old-element target dispatch!)
                      do $ println "\"not implement yet for updating:" (:name element)
                  update-children (:children element) (:children old-element) (.getChildAt parent-element idx) (, dispatch! options)
              (not= (:name element) (:name old-element))
                do (.removeChildAt parent-element idx)
                  .addChildAt parent-element (render-element element dispatch!) idx
              :else $ js/console.warn "\"Unknown case:" element old-element
        |update-children $ quote
          defn update-children (children-dict old-children-dict parent-container dispatch! options)
            when in-dev? $ assert "\"children should not contain nil element"
              and (every? some? $ map last children-dict) (every? some? $ map last old-children-dict)
            let
                list-ops $ find-minimal-ops lcs-state-0 (map first old-children-dict) (map first children-dict)
              ; js/console.log "\"ops" $ :total list-ops
              loop
                  idx 0
                  ops $ :acc list-ops
                  xs children-dict
                  ys old-children-dict
                when-not (empty? ops)
                  let
                      op $ first ops
                    case (first op)
                      :remains $ do
                        when in-dev? $ assert
                          = (last op) (first $ first xs) (first $ first ys)
                          , "\"check key"
                        update-element (last $ first xs) (last $ first ys) (, parent-container idx dispatch! options)
                        recur (inc idx) (rest ops) (rest xs) (rest ys)
                      :add $ do
                        when in-dev? $ assert "\"check key"
                          = (last op) (first $ first xs)
                        .addChildAt parent-container
                          render-element (last $ first xs) (, dispatch!)
                          , idx
                        recur (inc idx) (rest ops) (rest xs) (, ys)
                      :remove $ do
                        when in-dev? $ assert "\"check key"
                          = (last op) (first $ first ys)
                        .removeChildAt parent-container idx
                        recur idx (rest ops) xs $ rest ys
                      (first op)
                        do $ println "\"Unknown op:" op
      :proc $ quote ()
    |phlox.math $ {}
      :ns $ quote (ns phlox.math)
      :defs $ {}
        |angle->radian $ quote
          defn angle->radian (x) (* x radian-ratio)
        |radian-ratio $ quote (def radian-ratio $ / js/Math.PI 180)
      :proc $ quote ()
    |phlox.test $ {}
      :ns $ quote
        ns phlox.test $ :require ([] cljs.test :refer $ [] deftest is testing run-tests) ([] phlox.util.lcs :refer $ [] find-minimal-ops lcs-state-0)
      :defs $ {}
        |test-lcs $ quote
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
      :proc $ quote ()
    |phlox.app.comp.keyboard $ {}
      :ns $ quote
        ns phlox.app.comp.keyboard $ :require ([] phlox.core :refer $ [] defcomp g hslx rect circle text container graphics create-list)
      :defs $ {}
        |comp-keyboard $ quote
          defcomp comp-keyboard (on? counted)
            container
              {} $ :position ([] 400 200)
              container
                {} $ :position ([] 0 0)
                rect $ {} (:position $ [] 0 0) (:size $ [] 160 40) (:fill $ hslx 0 0 50)
                  :on $ {}
                    :pointertap $ fn (e d!) (d! :toggle-keyboard nil)
                text $ {} (:text $ str "\"Toggle: " on?) (:position $ [] 4 8)
                  :style $ {} (:font-size 16) (:fill $ hslx 0 0 100)
              text $ {} (:text $ str "\"Counted: " counted) (:position $ [] 20 60)
                :style $ {} (:font-size 16) (:fill $ hslx 0 0 100)
                :on-keyboard $ if on?
                  {}
                    :down $ fn (e d!) (d! :counted nil)
                    :up $ fn (e d!) (println :up)
                  {}
      :proc $ quote ()

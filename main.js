
import { main_BANG_ } from "./js-out/phlox.app.main.js"

main_BANG_()

if (import.meta.hot) {
  import.meta.hot.accept('./js-out/phlox.app.main.js', (main) => {
    main.reload_BANG_()
  })
}

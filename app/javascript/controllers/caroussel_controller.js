import { Controller } from "stimulus"
import Glide from '@glidejs/glide'

export default class extends Controller {
  static targets = [ "glide" ]


  connect() {
    let config = {
      type: "carousel",
      perView: 2.3
    };
    new Glide('.glide', config).mount()
  }
}

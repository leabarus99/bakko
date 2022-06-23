import { Controller } from "stimulus"
import Glide from '@glidejs/glide'

export default class extends Controller {
  static targets = [ "glide"]


  connect() {
    console.log(this.glideDashboardTarget)
    const conf = {
      type: "carousel",
      perView: 2.3
    };
    this.glideTargets.forEach(item => {
      new Glide(item, conf).mount()
    })
  }
}

import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["destination"]


  connect() {
    console.log('hello')
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region"
    });
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

    // search-bar
    #setInputValue(event) {
      this.destinationTarget.value = event.result["place_name"]
    }

    #clearInputValue() {
      this.destinationTarget.value = ""
    }
};

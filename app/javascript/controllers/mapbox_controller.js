import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["destination"]

  connect() {
    this.khbjhbkjhb = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region"
    });
    this.khbjhbkjhb.addTo(this.element)
    this.khbjhbkjhb.on("result", event => this.#setInputValue(event))
    this.khbjhbkjhb.on("clear", () => this.#clearInputValue())
  }
    #setInputValue(event) {
      this.destinationTarget.value = event.result["place_name"]
      console.log("coucou")
    }

    #clearInputValue() {
      this.destinationTarget.value = ""
      console.log("hello")
    }
}

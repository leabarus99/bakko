import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    // map
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/leabrs99/cl4r2bvua001415owf6ww7nr9"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()


    }

    //mapbox-marker
    #addMarkersToMap() {
        const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
        new mapboxgl.Marker()
        .setLngLat([this.markerValue.lng, this.markerValue.lat])
        .setPopup(popup)
        .addTo(this.map)
    }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
      this.map.fitBounds(bounds, { padding: 40, maxZoom: 7, duration: 0 })
    }
};

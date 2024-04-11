import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-autocomplete"
export default class extends Controller {
  connect() {
    this.autocomplete = new google.maps.places.Autocomplete(this.element)
  }

  disconnect() {
    google.maps.event.clearInstanceListeners(this.element)
  }
}

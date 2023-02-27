import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-button"
export default class extends Controller {
  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  change() {
    console.log(this.element.classList);
  }
}

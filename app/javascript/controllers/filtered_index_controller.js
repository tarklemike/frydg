import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtered-index"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
}

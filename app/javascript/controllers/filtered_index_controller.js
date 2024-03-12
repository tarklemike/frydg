import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtered-index"
export default class extends Controller {
  connect() {
    console.log("hello");
  }

  // for allergens
  gluten() {
    console.log("gluten");
  }

  dairy() {
    console.log("dairy");
  }

  vegitarian() {
    console.log("vegitarian");
  }

  vegan() {
    console.log("vegan");
  }

  // For cuisine

  // For difficulty
  easy() {
    console.log("easy");
  }

  medium() {
    console.log("medium");
  }

  hard() {
    console.log("hard");
  }
}

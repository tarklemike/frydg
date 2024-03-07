import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["ingredient", ""]

  connect() {
    console.log("Hello from Ingredients controller")
    console.log(this.ingredientTargets)
  }

  add() {
    console.log("add button clicked!")
    console.log(this.ingredientTargets.length)

  }
}

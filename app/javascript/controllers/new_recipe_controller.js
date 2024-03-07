import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["recipeId", "ingredient", "measurement", "amount", "reload"]

  connect() {

  }

  submit(event){
    event.preventDefault()
    fetch(`/recipes/${this.recipeIdTarget.value}/recipe_ingredients`, {
      method: 'POST',
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "x-csrf-token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({
        recipe_id: this.recipeIdTarget.value,
        ingredient_id: this.ingredientTarget.value,
        measurement: this.measurementTarget.value,
        amount: this.amountTarget.value
      })
    });
    this.reloadTarget.click()
  }

}

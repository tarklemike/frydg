import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "ingredientsList", "form", "recipeId"]

  connect() {
    console.log("testing connection")
    console.log(this.formTarget)
  }

  submit(event){
    console.log(event)
    console.log("submitting form")
    event.preventDefault()
    console.log(this.ingredientsListTarget)
    fetch(`/recipes/${this.recipeIdTarget}/recipe_ingredients`)
    .then(response => response.json())
    .then((data) => {
        console.log(data)
      })
  }

  displayForm() {
    this.infosTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}

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
    fetch(`/recipes/${this.recipeIdTarget.value}/recipe_ingredients`, {
      method: 'POST',
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "x-csrf-token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
      body: new FormData(this.formTarget)
    });
    fetch(`/recipes/${this.recipeIdTarget.value}/recipe_ingredient_list`)
    .then(response => response.text())
    .then((html) => {
        // console.log(data)
        this.ingredientsListTarget.innerHTML = html
      });
  }

  displayForm() {
    this.infosTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["ingredient", "ingredientsWrapper", "template"]

  connect() {
    console.log("Hello from Ingredients controller")
    // console.log(this.ingredientTargets)
    this.add()
  }

  add() {
    // console.log("add button clicked!")
    // console.log(this.ingredientTargets.length)
    // console.log(this.templateTarget)
    let newId = this.ingredientTargets.length
    let copy = this.templateTarget.content.cloneNode(true)
    // console.log(copy)
    copy.querySelector("label").for = `recipe_recipe_ingredients_attributes_${newId}_ingredient_id`
    copy.querySelector("select").id = `recipe_recipe_ingredients_attributes_${newId}_ingredient_id`
    copy.querySelector("select").name = `recipe[recipe_ingredients_attributes][${newId}][ingredient_id]`
    // console.log(copy)
    // copy = copy.replaceAll("_0_", `_${newId}_`)
    // copy = copy.replaceAll("[0]", `[${newId}]`)

    this.ingredientsWrapperTarget.appendChild(copy)
  }
}

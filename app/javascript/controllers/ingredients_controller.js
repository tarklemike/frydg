import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["ingredientsWrapper", "template", "ingredient"]

  add() {
    let copy = this.templateTarget.content.cloneNode(true)
    this.ingredientsWrapperTarget.appendChild(copy)
    let newId = this.ingredientTargets.length
    console.log(this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[1].querySelector("label"));
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[1].querySelector("input").id = `recipe_recipe_ingredients_attributes_${newId}_ingredient_name`
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[1].querySelector("input").name = `recipe[recipe_ingredients_attributes][${newId}][ingredient_name]`
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[3].querySelector("input").id = `recipe_recipe_ingredients_attributes_${newId}_amount`
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[3].querySelector("input").name = `recipe[recipe_ingredients_attributes][${newId}][amount]`
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[5].querySelector("input").id = `recipe_recipe_ingredients_attributes_${newId}_measurement_type`
    this.ingredientTargets[(this.ingredientTargets.length - 1)].childNodes[5].querySelector("input").name = `recipe[recipe_ingredients_attributes][${newId}][measurement_type]`
  }
}

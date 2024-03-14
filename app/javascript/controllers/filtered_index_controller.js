import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtered-index"
export default class extends Controller {
  static targets = ["checkbox", 'container', "search", "content"]
  connect() {
    console.log( this.contentTarget
      );

      this.searchArray = []  }

  delete(event) {
    this.searchArray.splice(this.searchArray.indexOf(event.currentTarget.innerText), 1);
    event.currentTarget.remove()
    this.search(event)
  }

  search(event) {
event.preventDefault();
if (this.searchTarget.value !== "") {
  this.searchArray.push(this.searchTarget.value)
  console.log(this.searchTarget.value);
  const button = `<button data-action="click->filtered-index#delete" class="button_default search">${this.searchTarget.value} x</button>`
  this.contentTarget.insertAdjacentHTML("beforeend", button)
}
//add value to query params at bottom
this.searchTarget.value = ""
this.sendRequest()
  }

  sendRequest(event) {

    // console.log(this.searchArray)
    // clear the value
    // add it to a div






    let glutenFree = null
    let dairyFree = null
    let vegetarian = null
    let vegan = null
    let eggFree = null
    let nutFree = null
    // DIFFICULTY LEVEL
    let easy = null
    let medium = null
    let hard = null
    // CUISINE
    let british = null
    let chinese = null
    let french = null
    let indian = null
    let italian = null
    let japanese = null
    let mexican = null
    let spanish = null
    let thai = null

    this.checkboxTargets.forEach((checkbox)=>{
      if (checkbox.checked && checkbox.id === "gluten_free") glutenFree = true;
      if (checkbox.checked && checkbox.id === "dairy_free") dairyFree = true;
      if (checkbox.checked && checkbox.id === "nut_free") nutFree = true;
      if (checkbox.checked && checkbox.id === "egg_free") eggFree = true;
      if (checkbox.checked && checkbox.id === "vegetarian") vegetarian = true;
      if (checkbox.checked && checkbox.id === "vegan") vegan = true;
      // this.dairyFree = (checkbox.checked && checkbox.id === "dairy_free") ? true : false;

      // DIFFICULTY LEVEL
      if (checkbox.checked && checkbox.id === "easy") easy = true;
      if (checkbox.checked && checkbox.id === "medium") medium = true;
      if (checkbox.checked && checkbox.id === "hard") hard = true;

      // CUISINE
      if (checkbox.checked && checkbox.id === "british") british = true;
      if (checkbox.checked && checkbox.id === "chinese") chinese = true;
      if (checkbox.checked && checkbox.id === "french") french = true;
      if (checkbox.checked && checkbox.id === "indian") indian = true;
      if (checkbox.checked && checkbox.id === "italian") italian = true;
      if (checkbox.checked && checkbox.id === "japanese") japanese = true;
      if (checkbox.checked && checkbox.id === "mexican") mexican = true;
      if (checkbox.checked && checkbox.id === "spanish") spanish = true;
      if (checkbox.checked && checkbox.id === "thai") thai = true;



    })
    let ingredient1 = null
    let ingredient2 = null
    if (this.searchArray.length > 1) {
      ingredient1 = this.searchArray[0]
      ingredient2 = this.searchArray[1]
    } else if (this.searchArray.length > 0) {
      ingredient1 = this.searchArray[0]
    }
    const url = `/recipes/?query=true&ingredient1=${ingredient1}&ingredient2=${ingredient2}&gluten_free=${glutenFree}&dairy_free=${dairyFree}&nut_free=${nutFree}&egg_free=${eggFree}&vegetarian=${vegetarian}&vegan=${vegan}&easy=${easy}&medium=${medium}&hard=${hard}&british=${british}&chinese=${chinese}&french=${french}&indian=${indian}&italian=${italian}&japanese=${japanese}&mexican=${mexican}&spanish=${spanish}&thai=${thai}`
    localStorage.setItem("filteredUrl", url)
    console.log(url);
    fetch(url, {headers: {'Accept': 'text/plain'}})
    .then(response => response.text())
    .then((data) => {
      this.containerTarget.innerHTML = data
    })

  }
}

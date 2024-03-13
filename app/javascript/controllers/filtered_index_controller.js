import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtered-index"
export default class extends Controller {
  static targets = ["checkbox", 'container']
  connect() {
    console.log("hello");
  }

  sendRequest(event) {
    console.log(this.checkboxTargets);
    let glutenFree = null
    let dairyF = null
    let vegetarian = null
    let vegan = null
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
      if (checkbox.checked && checkbox.id === "dairy_f") dairyF = true;
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
    const url = `/recipes/?query=true&gluten_free=${glutenFree}&dairy_f=${dairyF}&vegetarian=${vegetarian}&vegan=${vegan}&easy=${easy}&medium=${medium}&hard=${hard}&british=${british}&chinese=${chinese}&french=${french}&indian=${indian}&italian=${italian}&japanese=${japanese}&mexican=${mexican}&spanish=${spanish}&thai=${thai}`
    localStorage.setItem("filteredUrl", url)
    console.log(url);
    fetch(url, {headers: {'Accept': 'text/plain'}})
    .then(response => response.text())
    .then((data) => {
      this.containerTarget.innerHTML = data
    })

  }
}

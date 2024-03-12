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
    console.log(glutenFree)
    this.checkboxTargets.forEach((checkbox)=>{
      if (checkbox.checked && checkbox.id === "gluten_free") glutenFree = true;
      if (checkbox.checked && checkbox.id === "dairy_f") dairyF = true;
      if (checkbox.checked && checkbox.id === "vegetarian") vegetarian = true;
      if (checkbox.checked && checkbox.id === "vegan") vegan = true;
      // this.dairyFree = (checkbox.checked && checkbox.id === "dairy_free") ? true : false;

    })
    console.log(glutenFree);
    const url = `/recipes/?query=true&gluten_free=${glutenFree}&dairy_f=${dairyF}&vegetarian=${vegetarian}&vegan=${vegan}`
    localStorage.setItem("filteredUrl", url)
    fetch(url, {headers: {'Accept': 'text/plain'}})
    .then(response => response.text())
    .then((data) => {
      this.containerTarget.innerHTML = data
    })

  }
}

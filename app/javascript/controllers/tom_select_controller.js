import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    console.log("connected to tomseelct!")
    //new TomSelect(this.element)
    new TomSelect(this.element,{
      // create: true,

      maxItems: 5
      // createFilter: function(input) {
      //   input = input.toLowerCase();
      //   return !(input in this.options);
      // }
    });
  }


}

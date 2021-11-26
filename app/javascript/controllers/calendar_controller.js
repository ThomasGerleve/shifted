import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello")
  }
  disable(event) {
    console.log(event);
  }
}

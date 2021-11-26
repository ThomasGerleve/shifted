import { Controller } from "stimulus"

export default class extends CalendarController {
  connect() {
    console.log("Hello")
  }
  disable(event) {
    console.log(event);
  }
}

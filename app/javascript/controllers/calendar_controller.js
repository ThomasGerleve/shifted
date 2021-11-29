import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container"]

  navigate(event) {
    event.preventDefault();
    console.log(event.currentTarget.href)

    fetch(event.currentTarget.href, {
      method: 'GET',
      headers: { 'Accept': "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        console.log(this.targets)
        this.containerTarget.outerHTML = data.calendar;
      });
  };
}

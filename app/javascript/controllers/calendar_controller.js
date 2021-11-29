import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container"]

  navigate(event) {
    event.preventDefault();

    fetch(event.currentTarget.href, {
      method: 'GET',
      headers: { 'Accept': "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        this.containerTarget.outerHTML = data.calendar;
      });
  };
}

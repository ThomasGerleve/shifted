import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userShiftId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "UserShiftChannel", id: this.userShiftIdValue },
      { received: data => this.element.insertAdjacentHTML("afterbegin", data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.userShiftIdValue}.`);
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}

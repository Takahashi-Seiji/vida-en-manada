import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    console.log(`Connected to chatroom subscription controller" ${this.chatroomIdValue}`);
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          this.#insertMessageAndScrollDown(data);
        }
      }
    )
    console.log(`Subscribed to chatroom channel ${this.chatroomIdValue}`);
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  disconnect() {
    console.log(`Disconnected from chatroom subscription controller" ${this.chatroomIdValue}`);
    this.subscription.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }
}

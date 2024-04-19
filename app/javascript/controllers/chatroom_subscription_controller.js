import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number}
  static targets = ["messages", "form"]

  connect() {
    console.log(`Connected to chatroom subscription controller" ${this.chatroomIdValue}`);
    console.log(`Current user id: ${this.currentUserIdValue}`);
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => {
          console.log("Received data from chatroom channel", data);
          const parser = new DOMParser();
          const htmlDocument = parser.parseFromString(data, "text/html");
          const messageElement = htmlDocument.querySelector(".message");
          const userId = messageElement ? messageElement.dataset.userId : undefined;
          this.#insertMessageAndScrollDown(userId, data);
          this.resetForm();
          this.scrollToBottom();
        }
      }
    )
    console.log(`Subscribed to chatroom channel ${this.chatroomIdValue}`);
    this.scrollToBottom();
  }

  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
  }

  #insertMessageAndScrollDown(user_id, message) {
    if (this.currentUserIdValue === undefined) {
      console.error('currentUserIdValue is undefined');
      return;
    }

    const currentUser = this.currentUserIdValue;
    const messageClass = user_id == currentUser ? 'message-right' : 'message-left';
    const messageHTML = `<div class="${messageClass}">${message}</div>`;
    this.messagesTarget.insertAdjacentHTML("beforeend", messageHTML)
    console.log("Scrolled to the bottom of the chatroom", this.messagesTarget.scrollHeight);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  disconnect() {
    console.log(`Disconnected from chatroom subscription controller" ${this.chatroomIdValue}`);
    this.subscription.unsubscribe()
  }

  resetForm(event) {
    console.log("Resetting form");
    this.formTarget.reset()
  }
}

const MessageStore = require("./message_store");

module.exports = {
  render() {
    let container = document.createElement("ul");
    container.className = "messages";
    let allMessages = MessageStore.getSentMessages();
    allMessages.forEach( message => {
      container.appendChild(this.renderMessage(message));
    });
    return container;
  },

  renderMessage(msg) {
    let liNode = document.createElement("li");
    liNode.className = "message";
    liNode.innerHTML = `
      <span class="to">To: ${msg.to}</span>
      <span class="subject">${msg.subject}</span>
      <span class="body">${msg.body}</span>
    `;
    return liNode;
  }
};

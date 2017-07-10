const MessageStore = require("./message_store");

module.exports = {
  render() {
    let ulContainer = document.createElement("ul");
    ulContainer.className = "messages";
    let allMessages = MessageStore.getInboxMessages();
    allMessages.forEach( message => {
      ulContainer.appendChild(this.renderMessage(message));
    });
    return ulContainer;
  },

  renderMessage(msg) {
    let liNode = document.createElement("li");
    liNode.className = "message";
    liNode.innerHTML = `
    <span class="from">${msg.from}</span>
    <span class="subject">${msg.subject}</span>
    <span class="body">${msg.body}</span>
    `;
    return liNode;
  }
};

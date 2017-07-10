const MessageStore= require("./message_store");

module.exports = {
  render() {
    let divEl = document.createElement("div");
    divEl.className = "new-message";
    divEl.innerHTML = this.renderForm();
    return divEl;
  },

  renderForm() {
    let currentMessage = MessageStore.getMessageDraft();
    let html = `
      <p class="new-message-header">New Message</p>
      <form class="compose-form">
        <input type="text" name="to" value=${currentMessage.to} placeholder="Recipient">
        <input type="text" name="subject" value=${currentMessage.subject} placeholder="Subject">
        <textarea name="body" rows="20">${currentMessage.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>
    `;
    return html;
  }
};

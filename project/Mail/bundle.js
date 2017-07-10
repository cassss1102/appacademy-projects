/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Router = __webpack_require__(1);
const Inbox = __webpack_require__(2);
const Sent = __webpack_require__(4);
const Compose = __webpack_require__(5);


let routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
};

document.addEventListener("DOMContentLoaded", () => {
  let content = document.querySelector(".content");
  new Router(content, routes).start();
  let sideBarNav = [...document.querySelectorAll(".sidebar-nav li")];
  sideBarNav.forEach( navItem => {
    navItem.addEventListener("click", () => {
      let name = navItem.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  activeRoute() {
    let component = window.location.hash.slice(1);
    return this.routes[component];
  }

  render() {
    this.node.innerHTML = "";
    let component = this.activeRoute();
    if (component) {
      this.node.innerHTML = "";
      this.node.appendChild(component.render());
    } else {
      this.node.innerHTML = "";
    }
    let paragraphEl = document.createElement("p");
    paragraphEl.innerHTML = name;
    this.node.appendChild(paragraphEl);
  }
}

module.exports = Router;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports) {

class Message {
  constructor(from, to, subject, body) {
    this.from = from;
    this.to = to;
    this.subject = subject;
    this.body = body;
  }
}

let messageDraft = new Message();

let messages = {
  sent: [{
    to: "friend@mail.com",
    subject: "Check this out",
    body: "it's so cool"
  },
  {
    to: "person@mail.com",
    subject: "zzz",
    body: "so boring"
  }],
  inbox: [{
    from: "grandma@mail.com",
    subject: "Fwd: Fwd: Fwd: Check this out",
    body: "Stay at home mom discovers cure for leg cramps. Doctors hate her"
  },
  {
    from: "person@mail.com",
    subject: "Questionaire",
    body: "Take this free quiz win $1000 dollars"
  }]
};

let MessageStore = {
  getInboxMessages() {
    return messages.inbox;
  },

  getSentMessages() {
    return messages.sent;
  },

  updateDraftField(field, value) {
    messageDraft[field] = value;
  },

  sendDraft() {
    messages.sent.push(messageDraft);
    messageDraft = new Message();
  },

  getMessageDraft() {
    return messageDraft;
  }

};

module.exports = MessageStore;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

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


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore= __webpack_require__(3);

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


/***/ })
/******/ ]);
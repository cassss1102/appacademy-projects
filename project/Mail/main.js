const Router = require("./router");
const Inbox = require("./inbox");
const Sent = require("./sent");
const Compose = require("./compose");


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

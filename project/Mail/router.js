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

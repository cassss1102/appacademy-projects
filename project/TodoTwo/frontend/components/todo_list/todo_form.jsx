import React, { Component } from 'react';
import { uniqueId } from '../../utils/idGenerator';

export default class TodoForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  linkState(key) {
    return (event => this.setState({[key]: event.target.value}));
  }

  handleSubmit(event) {
    event.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            value={this.state.title}
            onChange={this.linkState('title')}/>
        </label>
        <label>Body:
          <input
            value={this.state.body}
            onChange={this.linkState('body')}/>
        </label>
        <button className="btn">
          Create Todo!
        </button>
      </form>
    );
  }
}

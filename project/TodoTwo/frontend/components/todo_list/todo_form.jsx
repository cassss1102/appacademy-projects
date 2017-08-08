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
      <div className="todo-form">
        <form onSubmit={this.handleSubmit}>
          <div className="form">
            <label>Title:</label>
              <input
                value={this.state.title}
                onChange={this.linkState('title')}/>

          </div>
          <div className="form">
            <label>Body:</label>
              <textarea
                value={this.state.body}
                onChange={this.linkState('body')}>
              </textarea>

          </div>
          <button className="btn">
            Create Todo!
          </button>
        </form>
      </div>
    );
  }
}

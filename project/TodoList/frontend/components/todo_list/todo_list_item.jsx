import React, { Component } from 'react';
import merge from 'lodash/merge';
import TodoDetailView from './todo_detail_view';

export default class TodoListItem extends Component {
  constructor(props) {
    super(props);
    console.log(props);
    this.state = { detail: false };
    this.toggleTodo = this.toggleTodo.bind(this);
    this.handleRemove = this.handleRemove.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
  }

  handleRemove() {
    this.props.removeTodo(this.props.todo);
  }

  toggleDetail() {

    this.setState({ detail: !this.state.detail });
  }

  toggleTodo(e) {
    e.preventDefault();
    const toggledTodo = merge({}, this.props.todo, {done: !this.props.todo.done });
    this.props.receiveTodo(toggledTodo);
  }

  render() {
    const { todo, removeTodo } = this.props;
    const { title, done } = todo;
    let detail;
    if (this.state.detail) {
      detail = <TodoDetailView todo={todo} />;
    }
    return (
      <div>
        <li>
          <a onClick={this.toggleDetail}>{title}</a>
          <button onClick={this.toggleTodo}>{done ? "undo" : "done" }</button>
          <button onClick={this.handleRemove}>Delete Todo</button>
          {detail}
        </li>
      </div>
    );
  }
}

import React, { Component } from 'react';

export default class TodoListItem extends Component {
  render() {
    const { todo } = this.props;
    
    return (
      <li>{todo.title} {todo.body}</li>
    );
  }
}

import React, { Component } from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export default class TodoList extends Component {
  render() {
    const { todos, receiveTodo, removeTodo } = this.props;
    let list = todos.map( todo =>
      <TodoListItem
        key={ todo.id }
        todo={ todo }
        receiveTodo={ receiveTodo }
        removeTodo={ removeTodo } />
    );

    return (
      <div className="todo-list">
        <ul>
          { list }
        </ul>

        <TodoForm receiveTodo={ receiveTodo } />
      </div>
    );
  }
}

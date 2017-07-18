import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';
import configureStore from './store/store';
import Root from './components/root';
import { allTodos } from './reducers/selectors';
import { receiveTodos, receiveTodo } from './actions/todo_actions';

window.store = configureStore();
window.allTodos = allTodos;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');
  const store = configureStore();
  ReactDOM.render(<Root store={ store } />, root);
});

import {
  RECEIVE_TODOS,
  RECEIVE_TODO} from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach(todo => (newState[todo.id] = todo));
      return newState;
    case RECEIVE_TODO:
      const newTodo = {[action.todo.id]: action.todo};
      console.log(state);
      console.log(newTodo);
      const boo = merge({}, state, newTodo);
      console.log(boo);
      return boo;
    default:
      return state;
  }
};

export default todosReducer;

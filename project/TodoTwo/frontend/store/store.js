import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import applyMiddleware from 'redux';
import { middleware } from '../middleware/thunk';

const configureStore = (preloadedState = {}) => {
  let store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(middleware)
  );

  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;

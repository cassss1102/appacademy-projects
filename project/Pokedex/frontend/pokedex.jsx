import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom';
// test
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util';
import { selectAllPokemon } from './reducers/selectors';
// import PokemonIndex from './components/pokemon/pokemon_index';

window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.selectAllPokemon = selectAllPokemon;
// window.PokemonIndex = PokemonIndex;
// const store = configureStore();
// window.getState = store.getState;
// window.dispatch = store.dispatch;

const Root = ({ store }) => (
  <Provider store={ store }>
    <HashRouter>
      <Route path="/" component={ PokemonIndexContainer } />
    </HashRouter>
  </Provider>
);

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={ store } />, rootEl);
});

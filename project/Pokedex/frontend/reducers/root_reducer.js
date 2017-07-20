import { combineReducer } from 'redux';
import pokemonReducer from './pokemon_reducer';

const rootReducer = combineReducer({
  pokemon: pokemonReducer()
});

export default rootReducer;

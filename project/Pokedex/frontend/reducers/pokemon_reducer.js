import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_POKEMON
  } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const defaultState = () => ({
  entities: {},
  currentPoke: null,
});

const pokemonReducer = (state = defaultState(), action) => {
  let newState;
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge( {}, state, { entities: action.pokemon } );
      return newState;
    case RECEIVE_POKEMON:
    const poke = action.payload.pokemon;
      newState = merge(
        {},
        state,
        {
          entities: { [poke.id]: poke },
          currentPoke: poke.id
        }
      );
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;

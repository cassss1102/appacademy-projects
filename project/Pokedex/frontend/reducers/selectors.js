import _ from 'lodash';

export const selectAllPokemon = state => (
  _.values(state.pokemon.entities)
);

export const selectPokemonItem = (state, itemId) => (
  state.entities.items[itemId]
);

export const selectPokemonItems = (state, pokemon) => (
  pokemon ? pokemon.itemId.map( id => state.entites.items[id]) : []
);

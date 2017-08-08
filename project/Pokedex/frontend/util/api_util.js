export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  })
);

export const fetchPokemon = pokeId => (
  $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokeId}`
  })
);

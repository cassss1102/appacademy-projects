import { connect } from 'react-redux';
import requestPokemon from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectPokemonItems } from '../../reducers/selectors';


const mapStateToProps = state => ({
  pokemon: state.entities.pokemon[state.ui.pokeDisplay],
  items: selectPokemonItems(state, state.entities.pokemon)
});

const mapDispatchToProps = dispatch => ({
  requestPokemon: (pokeId) => dispatch(requestPokemon(pokeId))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);

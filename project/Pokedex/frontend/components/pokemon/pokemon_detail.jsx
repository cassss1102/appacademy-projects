import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import ItemDetailContainer from '../item/item_detail_container';

export default class PokemonDetail extends Component {
  componentDidMount() {
    this.props.requestPokemon(
      this.props.match.params.pokemonId
    );
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestPokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const {pokemon, items } = this.props;
    console.log(pokemon);
    return(
      <section className="pokemon-detail">
        <figure>
          <img src={pokemon.image_url} alt={pokemon.name} />
        </figure>
        <Route path="/pokemon/:pokemonId/item/:itemId" component={ ItemDetailContainer }/>
      </section>
    );
  }
}

import React, { Component } from 'react';
import PokemonIndexContainer from './pokemon_index_container';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

export default class PokemonIndex extends Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }
  render() {
    const {pokemon, loading} = this.props;
    let pokemonItem;
    if (pokemon) {
      pokemonItem = pokemon.map( poke =>
        <PokemonIndexItem
          key={poke.id}
          pokemon ={poke} />
      );
    }
    return (
      <section className="pokedex">
        <ul>
          {pokemonItem}
        </ul>
        <Route path="/pokemon/:pokemonId" component={ PokemonDetailContainer } />
      </section>
    );
  }
}

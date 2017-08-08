import React, { Component } from 'react';

const ItemDetail = ({item}) => (
  <ul>
    <li><h3>{item.name}</h3></li>
    <li>Happiness: {item.Happiness}</li>
    <li>Price: {item.price}</li>
  </ul>

);

export default ItemDetail;

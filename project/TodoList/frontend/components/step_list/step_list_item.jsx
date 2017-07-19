import React, { Component } from 'react';

export default class StepListItem extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    // console.log(this.props.step.body);
    return (
      <div>
        <li>
          <h3>{this.props.step.title}</h3>
          {this.props.step.body}
          <button>Remove Step</button>
        </li>
      </div>
    );
  }
}

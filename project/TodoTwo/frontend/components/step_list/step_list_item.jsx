import React, { Component } from 'react';
import merge from 'lodash/merge';

export default class StepListItem extends Component {
  constructor(props) {
    super(props);
    // console.log(this.props);
    this.toggleStep = this.toggleStep.bind(this);
    // this.handleRemove = this.handleRemove.bind(this);
  }

  // handleRemove() {
  //   this.props.removeStep(this.props.step);
  // }

  toggleStep(e) {
    const toggledStep = merge({}, this.props.step, {done: !this.props.step.done});
    // console.log(toggledStep);
    this.props.receiveStep(toggledStep);
  }

  render() {
    return (
      <div>
        <li>
          <h4>{this.props.step.title}</h4>
          <p>{this.props.step.body}</p>
          <button
            onClick={this.toggleStep}>
            {this.props.step.done ? 'Undo' : 'Done'}
          </button>
          <button onClick={this.props.removeStep}>Delete</button>
        </li>
      </div>
    );
  }
}

import React, {Component} from 'react';
import StepListContainer from '../step_list/step_list_container';

export default class TodoDetailView extends Component {
  render() {
    const { todo } = this.props;
    return (
      <div>
        {todo.body}
        <StepListContainer todo_id={ todo.id} />
      </div>
    );
  }
}

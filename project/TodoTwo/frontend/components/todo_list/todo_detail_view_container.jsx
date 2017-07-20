import React from 'react';
import { connect } from 'react-redux';
import { removeTodo } from '../../actions/todos_actions';
import { receiveSteps } from '../../actions/steps_actions';
import TodoDetailView from './todo_detail_view';

const MapDispatchToProps = ( dispatch, {todo} ) => ({
  removeTodo: () => dispatch(removeTodo(todo)),
  receiveSteps: () => dispatch(receiveSteps())
});

export default connect(
  null,
  MapDispatchToProps
)(TodoDetailView);
// Export connect(null, mapDispatchToProps)(TodoDetailView);
// null because the first argument to connect must always
// be mapStateToProps

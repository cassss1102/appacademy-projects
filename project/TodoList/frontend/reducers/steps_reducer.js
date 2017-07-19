import { RECEIVE_STEPS,
          RECEIVE_STEP,
          REMOVE_STEP
        } from '../actions/step_actions';
import merge from 'lodash/merge';

const InitialState = {
    1: { // this is the step with id = 1
      id: 1,
      title: "walk to store",
      done: false,
      todo_id: 1
    },
    2: { // this is the step with id = 2
      id: 2,
      title: "buy soap",
      done: false,
      todo_id: 1
    }
  };

const stepsReducer = (state = InitialState, action) => {
  let newState;
  switch (action.type) {
    case RECEIVE_STEPS:
      newState = merge({}, state);
      action.steps.forEach( step => (newState[step.id] = step) );
      return newState;
    case RECEIVE_STEP:
      let newStep = {[action.step.id]: action.step};
      return merge( {}, state, newStep);
    case REMOVE_STEP:
      newState = merge( {}, state );
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;

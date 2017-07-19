import { connect } from 'react-redux';
import { removeStep, receiveStep } from '../../actions/step_actions';
import StepListItem from './step_list_item';


const mapDispatchToProps = (dispatch, { step }) => ({
  receiveStep: () => dispatch(receiveStep(step)),
  removeStep: () => dispatch(removeStep(step))
});

export default connect(
  null,
  mapDispatchToProps
)(StepListItem);

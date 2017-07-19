import React from 'react';
import StepListItemContainer from './step_list_item_container';

import StepForm from './step_form';

const StepList = ({ steps, todo_id, receiveStep }) => {
  const stepItems = steps.map( step =>
    <StepListItemContainer
      key={step.id}
      step={step} />
    );
    console.log(stepItems);
  return (
    <div>
      <ul>
        { stepItems }
      </ul>
      <StepForm receiveStep={receiveStep} />
    </div>
  );
};

export default StepList;

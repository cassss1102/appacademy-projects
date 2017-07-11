import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
  }

  setNum1(e) {
    const num1 = e.taget.value ? parseInt(e.target.value) : "";
    this.setState({num1});
  }

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num2});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>

        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
      </div>
    );
  }
 }

module.exports = Calculator;

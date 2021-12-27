import { LightningElement } from 'lwc';
import TEST from './test.html';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  //a = 2;
  //test = TEST;
  /* test = render();
  render() {
    return TEST;
  } */
  /* get test() { return TEST;
    
  } */
  changeHandler(event) {
    this.greeting = event.target.value;
    ///console.log(TEST);
    console.log("cng2");
  }
}
//= require d3
var Chartie = React.createClass({
  getInitialState(){
    return {
      datum: [
        {
          "values": [],
          "key": "Average",
          "color": '#ff7f0e'
        }
      ]
    }
  },
  componentWillUnmount(){
    App.votesSubcription = {};
  },

  componentWillMount(){
    var component = this;
    App.votesSubcription = App.cable.subscriptions.create("VotesChannel", {
      received(data) {
        component.setState({datum: data});
      }
    });

  },
  render(){
    return <div>
      <h2>Chart</h2>
      <NVD3Chart type='lineChart' datum={this.state.datum} ></NVD3Chart>
    </div>
  }
});

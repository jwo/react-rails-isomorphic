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
  fetchNumbers(){
    var component = this;
    $.getJSON("/api/current").done(function(json){
      component.setState({datum: json})
    });
  },
  componentWillUnmount(){
    clearInterval(this.updateInteval);
  },
  componentWillMount(){
    this.fetchNumbers();
    this.updateInterval = setInterval(this.fetchNumbers, 1000);
  },
  render(){
    return <div>
      <h2>Chart</h2>
      <NVD3Chart type='lineChart' datum={this.state.datum} ></NVD3Chart>
    </div>
  }
});

var Votie = React.createClass({

  getInitialState(){
    return {
      vote: "abstain"
    }
  },

  castVote(){
    var theJson = {
      vote: {
        direction: (this.state.vote === "up")
      }
    }
    if (this.state.vote !== "abstain"){
      App.electNotification.vote(theJson);
    }
  },

  componentWillMount(){

    App.electNotification = App.cable.subscriptions.create("ElectChannel", {
      vote(data) {
        return this.perform('vote', data);
      }
    });

    this.votingInterval = setInterval(this.castVote, 1000);
  },

  componentWillUnmount(){
    clearInterval(this.votingInterval);
  },

  elect(direction) {
    var voteToChangeTo = (this.state.vote === direction) ? "abstain" : direction;
    this.setState({vote: voteToChangeTo});
  },

  vote(direction){

    var classes = "fa fa-3x fa-border fa-thumbs-" + direction;

    if (this.state.vote === direction){
      classes = classes.concat(" current");
    }

    let clickVote = this.elect.bind(this, direction);


    return <div className="vote">
      <a onClick={clickVote}>
        <i className={classes}></i>
      </a>
    </div>
  },

  render() {
    return <div className="voting">
      <p>Current Vote: {this.state.vote}</p>
      {this.vote("down")}
      {this.vote("up")}
    </div>;
  }
});

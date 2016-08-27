var Stat = React.createClass({

  render: function() {
    return (
      <div className="card">
        <div className="list-details">
        <ul>
          <li key={this.props.list.id} className="collection-item">
            <p>{"Difficulty: " + this.props.list.difficulty}</p>
            <p>{"Energy: " + this.props.list.energy}</p>
            <p>{"Due Date: " + this.props.list.due_date}</p>
            <p>{"Reward: " + this.props.list.reward}</p>
          </li>
        </ul>
      </div>
      
    </div>
    );
  }
});

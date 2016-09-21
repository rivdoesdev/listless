var Stat = React.createClass({

  render: function() {
    return (
      <div className="card">
        <div className="list-details">
        <ul>
          <li key={this.props.list.id} className="collection-item">
            <p>{"Difficulty: "}
            <span className="difficulty-stars">
              {(Array(this.props.list.difficulty) + 1).split(',').map(function (elem, index) {
                return (<span key={index}>⭐️</span>);
              })}
            </span></p>
          <p>{"Energy: "}
            <span className="energy-stars">
              {(Array(this.props.list.energy) + 1).split(',').map(function (elem, index) {
                return (<span key={index}>⭐️</span>);
              })}
            </span></p>
            <p>{"Due Date: " + this.props.list.due_date}</p>
              {(() => {
        switch (this.props.list.due_date) {
          case "null":   return "No due date";
          default:      return this.props.list.due_date;
        }
      })()}
            <p>{"Reward: " + this.props.list.reward}</p>
          </li>
        </ul>
      </div>

    </div>
    );
  }
});

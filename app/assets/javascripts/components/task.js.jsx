var Task = React.createClass({

  getInitialState: function () {
    return {
       completed: "false"
    };
  },

  render: function() {
    return (
      <div className="card">
        <div className="list-show">
          <div className="list-tasks">
            <li key={this.props.task.id} className="collection-item">{this.props.task.title + '\n' + this.props.task.description}</li>
          </div>
        </div>
      </div>
    )
  }
});

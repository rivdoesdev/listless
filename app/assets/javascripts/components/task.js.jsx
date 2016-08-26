var Task = React.createClass({

  getInitialState: function () {
    return {
       completed: "false",
       description: "closed"
    };
  },

  viewDescription: function () {
    if (this.state.tasks.children === "opened") {
        var descriptionState = "closed";
    } else {
        var descriptionState = "opened";
    }
    this.setState({
       description: descriptionState
    });
  },

  render: function() {
    return (
      <div className="card">
        <div className="list-show">
          <div className="list-tasks">
            <li key={this.props.task.id} className="collection-item">
              <p><strong>{this.props.task.title} </strong>
              <a a className="" href={"/tasks/" + this.props.task.id + "/edit"}>
              <i className="tiny material-icons"> mode_edit</i></a>
              </p>
              <p>{this.props.task.description}</p>
              <ul>
                {this.props.task.children.map(function (child) {
                  return (<li key={child.id}>{child.title}
                    <a onClick={child.viewDescription}>
                      <i className="material-icons right">expand_less</i>
                    </a>
                  </li>);
                })}
              </ul>
            </li>
          </div>
        </div>
      </div>
    )
  }
});

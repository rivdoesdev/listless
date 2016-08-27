var ChildStrikethrough = React.createClass({

  getInitialState: function () {
    return {
       className: "isStrikeThrough"
    };
  },

  onHandleClick: function () {
    if (this.state.isStrikeThrough === null) {
      this.setState({isStrikeThrough: "isStrikeThrough"});
    } else {
      this.setState({isStrikeThrough: null});
    }
  },

  handleClear: function (taskID, event) {
    console.log(taskID);
    $.ajax({
      method: "DELETE",
      url: "/tasks/" + taskID,
      success: function () {
        // I run after the delete request is finished.
      }
    });
  },

  render: function() {
    return (
      <li>
        <span className={this.state.isStrikeThrough} onClick={this.onHandleClick}>{this.props.child.title}</span>

          <a className="react-clear" onClick={this.handleClear.bind(this, this.props.child.id)}>
          <i className="tiny material-icons">clear</i></a>
      </li>
    )
  }
});

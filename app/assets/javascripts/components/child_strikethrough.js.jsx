var ChildStrikethrough = React.createClass({

  getInitialState: function () {
    return {
       className: "isStrikeThrough",
       show: true
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
        this.setState({show: false})
      }.bind(this)
    });
  },

  render: function() {
    if (this.state.show === true) {
      return (
        <li>
          <span className={this.state.isStrikeThrough} onClick={this.onHandleClick}>{this.props.child.title}</span>
          <a className="react-clear" onClick={this.handleClear.bind(this, this.props.child.id)}>
            <span className="red-x">
              <i className="tiny material-icons">clear</i>
            </span>
          </a>
        </li>
      )
    } else {
      return (<div/>);
    }
  }
});

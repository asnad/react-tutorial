var HelloMessage = React.createClass({
  render: function() {
    return (
      <h1>Hello {this.props.name}!</h1>
    )
  }
});
var ShowMessage = React.createClass({
	render: function(){
		return (
			<h1>{this.props.message}</h1>

		)
	}
})
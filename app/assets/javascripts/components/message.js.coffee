@Message = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.message.text
			React.DOM.td null, @props.message.important.toString()
			React.DOM.td null, @props.message.created_at
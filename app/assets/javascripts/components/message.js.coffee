@Message = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.message.text
			React.DOM.td null, @props.message.important
			React.DOM.td null, @props.message.created_at
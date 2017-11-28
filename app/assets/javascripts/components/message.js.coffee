@Message = React.createClass
	deleteMessage: (e) ->
		$.ajax
			method: "DELETE"
			url: "/messages/#{@props.message.id}"
			dataType: "JSON"
			success: () =>
				@props.handleDeleteMessage @props.message
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.message.text
			React.DOM.td null, @props.message.important.toString()
			React.DOM.td null, @props.message.created_at
			React.DOM.td null,
				React.DOM.a
					className: "btn btn-danger"
					onClick: @deleteMessage
					"Delete"

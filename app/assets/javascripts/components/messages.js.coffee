@Messages = React.createClass
	getInitialState: ->
		messages: @props.messages
	getDefaultProps: ->
		messages: []
	render: ->
		React.DOM.div
			className: 'lifts'
			React.DOM.h1
				className: "lifts"
				"Lifts"
			React.DOM.table
				className: "table table-bordered"
				React.DOM.thead null,
					React.DOM.th null, "Text"
					React.DOM.th null, "Is Important"
					React.DOM.th null, "DateTime"
				React.DOM.tbody null,
					for message in @state.messages
						React.createElement Message, key: message.id, message: message
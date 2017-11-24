@LiftForm = React.createClass
	getInitialState: ->
		date: ''
		liftname: ''
		ismetric: ''
		weightlifted: ''
		repsperformed: ''
		onerm: ''
	handleValueChange: (e) ->
		valueName = e.target.name
		@setState "#{ valueName }": e.target.value
	valid: ->
		@state.date && @state.liftname && @state.ismetric && @state.weightlifted && @state.repsperformed && @state.onerm
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '',{lift: @state},(data)=>
			@props.handleNewLift data
			@setState @getInitialState()
		,	'JSON'
	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					className: 'form-control'
					type: 'date'
					placeholder: 'date'
					name: 'date'
					value: @state.date
					onChange: @handleValueChange
				React.DOM.input
					className: 'form-control'
					type: 'text'
					placeholder: 'liftname'
					name: 'liftname'
					value: @state.liftname
					onChange: @handleValueChange
				React.DOM.input
					className: 'form-control'
					type: 'boolean'
					placeholder: 'ismetric'
					name: 'ismetric'
					value: @state.ismetric
					onChange: @handleValueChange
				React.DOM.input
					className: 'form-control'
					type: 'number'
					placeholder: 'weightlifted'
					name: 'weightlifted'
					value: @state.weightlifted
					onChange: @handleValueChange
				React.DOM.input
					className: 'form-control'
					type: 'number'
					placeholder: 'repsperformed'
					name: 'repsperformed'
					value: @state.repsperformed
					onChange: @handleValueChange
				React.DOM.input
					className: 'form-control'
					type: 'number'
					placeholder: 'onerm'
					name: 'onerm'
					value: @state.onerm
					onChange: @handleValueChange
				React.DOM.button
					className: "btn btn-primary"
					type: "submit"
					disabled: !@valid()
					'Create Lift'
coefficents = {1: 1, 2: .943, 3: .906, 4: .881, 5: .851, 6: .831, 7: .807, 8: .786, 9: .765, 10: .744}
@LiftForm = React.createClass
	getInitialState: ->
		date: ''
		liftname: ''
		ismetric: false
		weightlifted: ''
		repsperformed: ''
		onerm: ''
	calculatedOneRm: ->
		if @state.weightlifted and @state.repsperformed
			@state.onerm = @state.weightlifted/coefficents[@state.repsperformed]
		else
			0
	handleValueChange: (e) ->
		valueName = e.target.name
		@setState "#{ valueName }": e.target.value
	handleValueChangeOnerm: (e) ->
		valueName = e.target.name
		@setState "#{ valueName }": e.target.value
	toggleUnit: (e) ->
		e.preventDefault()
		@setState ismetric: !@state.ismetric
	valid: ->
		@state.date && @state.liftname && @state.weightlifted && @state.repsperformed && @state.onerm
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '',{lift: @state},(data)=>
			@props.handleNewLift data
			@setState @getInitialState()
		,	'JSON'
	render: ->
		React.DOM.div
			className: "Container"
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
				React.DOM.div
					className: 'form-group'
					React.DOM.input
						className: 'form-control'
						type: 'text'
						placeholder: 'liftname'
						name: 'liftname'
						value: @state.liftname
						onChange: @handleValueChange
				React.DOM.div
					className: 'form-group'
					React.DOM.input
						className: 'form-control'
						type: 'number'
						placeholder: 'weightlifted'
						name: 'weightlifted'
						value: @state.weightlifted
						onChange: @handleValueChange
				React.DOM.div
					className: 'form-group'
					React.DOM.input
						className: 'form-control'
						min: 1
						max: 10
						type: 'number'
						placeholder: 'repsperformed'
						name: 'repsperformed'
						value: @state.repsperformed
						onChange: @handleValueChange
				React.DOM.div
					className: 'form-group'
					React.DOM.a
						className: 'btn btn-primary'
						onClick: @toggleUnit
						'Metric = ' + @state.ismetric.toString()	
				React.DOM.div
					className: 'form-group'
					React.DOM.button
						className: "btn btn-primary"
						type: "submit"
						disabled: !@valid()
						'Create Lift'
			React.createElement OneRmBox, onerm: @calculatedOneRm()
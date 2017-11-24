@MessageForm = React.createClass
  getInitialState: ->
    text: ''
    important: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.text
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '',{message: @state},(data)=>
      @props.handleNewMessage data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          className: 'form-control'
          type: 'text'
          paceholder: 'date'
          name: 'text'
          value: @state.text
          onChange: @handleValueChange
      React.DOM.input
        className: 'form-control'
        type: 'boolean'
        paceholder: 'date'
        name: 'important'
        value: @state.important
        onChange: @handleValueChange
      React.DOM.button
        type: "submit"
        className: "btn btn-primary"
        disabled: !@valid()
        'Create Message'

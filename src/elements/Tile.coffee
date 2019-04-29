class Tile extends PIXI.Graphics
  interactive : true
  active : false
  way: -2
  constructor: (data, app) ->
    super()
    @data = data
    @app = app
    @drawTile()
    @on 'mouseover', @onHover
  drawTile:=>
    @beginFill(@data.color)
    @lineStyle(1, '0x84B1AA')
    @drawRect(0, 0, @data.width, @data.height)
    @endFill()
    @x = @data.x
    @y = @data.y
    @app.stage.addChild @
    @app.addAnimationNodes @
  
  onHover:=>
    @active = true    
    null
  animate:=>
    if @active
      @width += @way * 2
      @x += @way * -1
      if @width <= @way * 2 && @way < 0
        @way *= -1
        @width = 0
      if @width >= @data.width - @way * 2
        @active = false
        @way *= -1
        @width = @data.width
        @x = @data.x
module.exports = Tile
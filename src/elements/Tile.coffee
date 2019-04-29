class Tile extends PIXI.Graphics
  interactive : true
  constructor: (data, app) ->
    super()
    @data = data
    @app = app
    @drawTile()

  drawTile:=>
    @beginFill(@data.color)
    @drawRect(0, 0, @data.width, @data.height)
    @endFill()
    @x = @data.x
    @y = @data.y
    @app.stage.addChild @
  
  onHover:=>
    null
module.exports = Tile
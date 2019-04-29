random = require '../utils/random'

class bgTile extends PIXI.Graphics

  constructor: (data, app) ->
    super()
    @data = data
    @app = app
    @drawTile()
    @on 'mouseover', @onHover
  drawTile:=>
    color = random.rndClr()
    @beginFill(color)
    @lineStyle(1, '0x84B1AA')
    @drawRect(0, 0, @data.width, @data.height)
    @endFill()
    @x = @data.x
    @y = @data.y
    @app.stage.addChild @
    @app.addAnimationNodes @
module.exports = bgTile
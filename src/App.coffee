Tile = require './elements/Tile'
class App extends PIXI.Application
  animation:true
  animationNodes:[]
  constructor:(w,h,o)->
    super(w,h,o)
    @build()
    @animate()

  build:=>
    data = {
      x: 100
      y: 200
      width: 50
      height: 50
      color: '0xFFFFFF'
    }
    # tile = new Tile(data, @)
  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()
    null

module.exports = App

Tile = require './elements/Tile'
BgTile = require './elements/bgTile'
class App extends PIXI.Application
  animation:true
  animationNodes:[]
  blocks:10
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.style.margin = 0
    @build()
    @animate()
    document.body.appendChild @view
  build:=>
    mW = window.innerWidth
    mH = window.innerHeight
    tW = mW/@blocks
    tH = mH/@blocks
    for row in [0..@blocks-1]
      for column in [0..@blocks-1] 
        data = {
          x: column * tW
          y: row * tH
          width: tW
          height: tH
          color: '0xFFFFFF'
        }
        bgTile = new BgTile(data, @)
        tile = new Tile(data, @)
  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()
    null

module.exports = App

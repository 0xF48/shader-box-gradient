{Box,Shader} = require 'shader-box'
module.exports = (canvas,opt={})->
	if opt.speed == null
		opt.speed = 0
	if opt.fade == null
		opt.fade = 1.0
	if opt.seed == null
		opt.seed = [0.0,0.0,0.0]

	if opt.seed.length != 3
		throw new Error 'invalid seed array length, should be 3 (vector.xyz)'

	stop_anim = false
	box = new Box
		canvas: canvas
		resize: true
		clearColor: [0.8, 1.0, 1.0, 1.0]
		context:
			antialias: false
			depth: false
	shader = new Shader
		code: require('./gradient.glsl')()
		uniforms:
			iTime:
				type: '1f'
				val: 1
			speed:
				type: '1f'
				val: opt.speed
			seed:
				type: '3fv'
				val: [0.0,0.0,0.0]
			fade:
				type: '1f'
				val: opt.fade
	box.add shader

	tick = (t)->
		if stop_anim
			return
		requestAnimationFrame(tick)
		shader.uniforms.iTime.val = t
		box.clear().draw(shader)
	
	pause = ()->
		stop_anim = true

	run = ()->
		stop_anim = false
		tick(0)


	box.clear().draw(shader)



	{box,shader,tick,pause,run}
# ShaderBox - Gradient

That simple plug-n-play webgl wave gradient background you were looking for.

**http://arxii.github.io/shader-box-gradient**



```javascript
var ShaderBoxGradient = require('shader-box-gradient')
//speed: how fast does it change colors?
//fade: how much does it fade to white at the bottom?
//seed: just a random seed for rgb values. (vector.xyz)
var gradient = ShaderBoxGradient(window.canvas_element,{seed:[1,2,3],speed:1.0,fade:1.0})
gradient.shader.uniforms.speed.val = 0.5
gradient.shader.uniforms.seed.val[0] = 0.5
gradient.shader.uniforms.fade.val = 0
gradient.run()
gradient.pause()

```
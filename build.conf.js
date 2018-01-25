webpack = require("webpack")
cfg = {
	module: {
		loaders: [
			{ test: /\.coffee$/, use: "coffee-loader"},
			{ test: /\.glsl$/, use: "glsl-template-loader" }
		]
	},
	entry: "./shader-box-gradient.coffee",
	resolve: { "modules": ["node_modules"] },
	output: {
		filename: "index.js",
		library: 'ShaderBoxGradient',
		libraryTarget: 'umd'
	}
}
module.exports = cfg
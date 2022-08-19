// Framework7 has a transitive dependency on path-to-regexp,
// which is declared as a commonjs module. This breaks build
// when we transpile these dependendies, so let's hand jamb
// convert it to es6 module.
// See this issue: https://forum.vuejs.org/t/how-do-i-handle-a-transitive-dependency-that-is-not-transpiled-from-es6-to-es5/48440/5
// const pathToRegexpPath = path.resolve(__dirname, 'node_modules/framework7/node_modules/path-to-regexp/index.js')
// const pathToRegexp = fs.readFileSync(pathToRegexpPath).toString()
// const pathToRegexpUpdated = pathToRegexp.replace(
// `module.exports = pathToRegexp
// module.exports.parse = parse
// module.exports.compile = compile
// module.exports.tokensToFunction = tokensToFunction
// module.exports.tokensToRegExp = tokensToRegExp`,
// `export default pathToRegexp
// pathToRegexp.parse = parse
// pathToRegexp.compile = compile
// pathToRegexp.tokensToFunction = tokensToFunction
// pathToRegexp.tokensToRegExp = tokensToRegExp`)
// fs.writeFileSync(pathToRegexpPath, pathToRegexpUpdated)

module.exports = {
  publicPath: './',
  transpileDependencies: [
    'framework7',
    'framework7-vue',
    'template7',
    'dom7',
    'ssr-window'
  ],
}

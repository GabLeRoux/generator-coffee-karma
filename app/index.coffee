require 'coffee-errors'

util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
GitHubApi = require 'github'

# The generator auto adds all the github information if specified
githubUserInfo = (name, cb) ->
  proxy = process.env.http_proxy or process.env.HTTP_PROXY or process.env.https_proxy or process.env.HTTPS_PROXY or null
  githubOptions = version: '3.0.0'

  if proxy
    proxy = url.parse proxy

    githubOptions.proxy =
      host: proxy.hostname
      port: proxy.port

  github = new GitHubApi githubOptions

  github.user.getFrom user: name, (err, res) ->
    throw err  if err
    cb JSON.parse JSON.stringify res

class CoffeeModuleGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super
    @currentYear = (new Date()).getFullYear()
    @on 'end', => @installDependencies skipInstall: options['skip-install']
    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'

  askFor: ->
    done = @async()

    # have Yeoman greet the user.
    console.log @yeoman

    prompts = [
      name: 'githubUser'
      message: 'Would you mind telling me your username on GitHub?'
      default: 'someuser'
    ,
      name: 'moduleName'
      message: 'What\'s the name of your project?'
      default: @_.slugify(@appname)
    ,
      name: 'moduleDescription'
      message: 'Can you give me a short description of your project?'
      default: 'Awesome CoffeeScript project, build with Yeoman, generator-coffeescript-karma'
    ]

    @prompt prompts, (props) =>
      @githubUser   = props.githubUser
      @appname      = props.moduleName
      @description  = props.moduleDescription
      @slug         = @_.slugify @appname
      done()

  userInfo: ->
    done = @async()

    githubUserInfo @githubUser, (res) =>
      @realname   = res.name
      @email      = res.email
      @githubUrl  = res.html_url
      done()

  projectfiles: ->
    @template '_package.json', 'package.json'
    @template '_README.md', 'README.md'
    @template 'gruntfile.coffee'
    @template '_bower.json', 'bower.json'
    @template 'bowerrc'
    @template 'karma.config.coffee'

  gitfiles: ->
    @copy '_gitignore', '.gitignore'

  app: ->
    @template 'src/coffee/index.coffee', "src/coffee/#{@appname}.coffee"
    @template 'src/coffee/classes/example.class.coffee', "src/coffee/classes/#{@appname}.class.coffee"

  tests: ->
    @mkdir 'test'
    @template 'test/coffee/index.test.coffee', "test/coffee/#{@appname}.test.coffee"
    @template 'test/coffee/classes/example.class.test.coffee', "test/coffee/classes/#{@appname}.class.test.coffee"

module.exports = CoffeeModuleGenerator
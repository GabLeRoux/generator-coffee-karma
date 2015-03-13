require 'coffee-errors'

util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
GitHub = require 'github'

# Fetches the user from github
githubGetUser = (name, callback) ->

  # Get the proxy
  proxy = process.env.http_proxy or process.env.HTTP_PROXY or process.env.https_proxy or process.env.HTTPS_PROXY or null

  # Set the version to the github options
  options = version : '3.0.0'

  # Check if proxy exists, if so, parse it
  if proxy
    proxy = url.parse proxy

    # Add the proxy to the github options
    options.proxy =
      host: proxy.hostname
      port: proxy.port

  github = new GitHub( options )

  # Fetch the actual user data from the github server
  github.user.getFrom( user: name, (err, res) ->
    throw err  if err
    callback JSON.parse JSON.stringify res
  )


#
class CoffeeKarmaGenerator extends yeoman.generators.Base
  constructor: (args, options) ->
    super
    @currentYear = (new Date()).getFullYear()
    @on 'end', => @installDependencies skipInstall: options['skip-install']
    @pkg = JSON.parse @readFileAsString path.join __dirname, '../package.json'

  askFor: ->
    done = @async()

    # have Yeoman greet the user.
    console.log @yeoman

    prompts = [
      name:     'githubUser'
      message:  'Would you mind telling me your username on GitHub?'
      default:  'someuser'
    ,
      name:     'moduleName'
      message:  'What\'s the name of your project?'
      default:  @_.slugify(@appname)
    ,
      name:     'moduleDescription'
      message:  'Can you give me a short description of your project?'
      default:  'Awesome CoffeeScript project, build with Yeoman'
    ]

    @prompt( prompts, (props) =>
      @githubUser   = props.githubUser
      @appname      = props.moduleName
      @description  = props.moduleDescription
      @slug         = @_.slugify @appname
      done()
    )


  userInfo: ->
    done = @async()

    githubGetUser( @githubUser, (res) =>
      @realname   = res.name
      @email      = res.email
      @githubUrl  = res.html_url
      done()
    )

  projectfiles: ->
    @template '_package.json', 'package.json'
    @template '_README.md', 'README.md'
    @template '_gruntfile.coffee', 'gruntfile.coffee'
    @template '_bower.json', 'bower.json'
    @template 'bowerrc'
    @template 'karma.config.coffee'

  gitfiles: ->
    @copy '_gitignore', '.gitignore'

  app: ->
    @template 'src/coffee/index.coffee', "src/coffee/#{@appname}.coffee"
    @template 'src/coffee/classes/example.class.coffee', "src/coffee/classes/example.class.coffee"

  tests: ->
    @template 'test/coffee/index.test.coffee', "test/coffee/#{@appname}.test.coffee"
    @template 'test/coffee/classes/example.class.test.coffee', "test/coffee/classes/example.class.test.coffee"

module.exports = CoffeeKarmaGenerator
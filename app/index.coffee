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

buildString = ( files ) ->
  bufferString = '['

  last = files.length - 1
  counter = 0;

  for filename in files
    do (filename ) ->
      bufferString += '"' + filename + '"'
      bufferString += if counter != last  then ", " else "]"
      counter++

  bufferString

#
class CoffeeKarmaGenerator extends yeoman.generators.Base
  constructor: (args, options) ->
    super
    @currentYear = (new Date()).getFullYear()
    @on 'end', => @installDependencies skipInstall: options['skip-install']

    @pkg_generator      = JSON.parse @readFileAsString path.join __dirname, '../package.json'
    @pkg_template       = JSON.parse @readFileAsString path.join __dirname, 'templates/_package.json'
    @pkg_template_files = buildString(  @pkg_template.files )

    console.log( @pkg_template_files )

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
    @template '.bowerrc'
    @template 'karma.config.coffee'

  gitfiles: ->
    @copy '_gitignore', '.gitignore'

  app: ->
    @mkdir 'dist'
    @template 'src/coffee/index.coffee', "src/coffee/#{@appname}.coffee"
    @template 'src/coffee/classes/example.class.coffee', "src/coffee/classes/example.class.coffee"

  tests: ->
    @template 'test/coffee/index.test.coffee', "test/coffee/#{@appname}.test.coffee"
    @template 'test/coffee/classes/example.class.test.coffee', "test/coffee/classes/example.class.test.coffee"

module.exports = CoffeeKarmaGenerator
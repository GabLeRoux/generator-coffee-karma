# Generator | CoffeeScript & Karma
A generator for Yeoman to scaffold CoffeeScript projects, test it with karma (Jasmine), run tasks with Grunt.

## Installation
First you need to install the generator on your machine. Use [npm](http://www.npmjs.com) to global install the generator;

```
npm install -g generator-coffeescript-karma
```


Run 'yo' inside the project root and select the 'Coffee Karma' generator. More information about generators on [Yeoman](http://yeoman.io/learning/index.html).

```
yo
```

Yeoman will create a project with the following structure:

    .
    ├── dist
    │   └── projectName.min.js ( Will be generated when run 'grunt uglify' )
    ├── src
    |   └── coffee
    │       ├── projectName.coffee
    │       └── classes
    │           └── main.class.coffee
    ├── test
    |   └── coffee    
    │       ├── projectName.test.coffee
    │       └── classes
    │           └── main.class.test.coffee
    ├── .gitignore
    ├── bowerrc
    ├── bower.json
    ├── package.json
    ├── gruntfile.coffee
    ├── karma.config.coffee
    └── README.md

That's all there is to it! You can start coding, testing and building right out of the box!


## Usage

### Testing
Great, you are ready to write awesome code! But off course, you want to run tests, lots and lots of tests. Start Karma by running the 'grunt karma' command in the terminal.
```
grunt karma
```

This generator installs the grunt-karma module. Although it works straight out of the box, additional configuration information can be found on [github/karma-runner/grunt-karma](https://github.com/karma-runner/grunt-karma)

Karma outputs the test reports directly in the terminal. If you prefer a html based test report go to 'server/port/debug.html' while 'grunt karma' is running. Most likely this url is;

```
http://localhost:9876/debug.html
```

> It is possible you have to refresh to get the last report

At this moment, only chrome comes out of the box. If you would like to use some other browser launchers, edit the 'karma.config.coffee' file. 
[Find more browser launchers](https://npmjs.org/browse/keyword/karma-launcher)

### Compiling
If you would like to compile coffeeScript automatically on file change, activate the grunt watcher. This is easily done by running the 'grunt watch' command in the terminal.

```
grunt watch
```

Otherwise, you could run 'grunt coffee' in the terminal to compile the CoffeeScript files manually.

```
grunt coffee
```

> Compiled coffeeScript files are stored in the 'src/javascript' folder.

### Building
If your code is ready for production, simply run 'grunt' in your terminal. This will uglify the most recent compiled coffeeScript files from the 'src/javascript' directory and stores the 'projectName.min.js' in './dist'.

> Make sure to compile CoffeeScripts ('grunt coffee') before running 'grunt'

```
grunt
```

Will output

    .
    └── dist
        └── projectName.min.js
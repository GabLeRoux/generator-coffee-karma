# Generator CoffeeScript & Karma
A Yeoman generator to scaffold CoffeeScript projects, test it with karma (Jasmine) and run build tasks with Grunt.

## Installation
First you need to install the generator on your machine. Use [npm](http://www.npmjs.com) to global install the generator;

```
npm install -g generator-coffeescript-karma
```

Run 'yo coffee-karma' or 'yo' inside the project root and select the 'Coffee Karma' generator. More information about generators on [Yeoman](http://yeoman.io/learning/index.html).


```
yo coffee-karma
```

or

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

> This project uses the grunt-karma module. It works right away! Info about customization can be found at [grunt-karma](https://github.com/karma-runner/grunt-karma).

Karma shows the test reports directly in the terminal. If you prefer a html based test report go to 'server/port/debug.html' while 'grunt karma' is running. Most likely this url is;

```
http://localhost:9876/debug.html
```

> It is possible you have to refresh to get the last report

At this moment, only chrome comes out of the box. If you would like to use another browser-launchers, install the launcher with [npm](http://www.npmjs.com) and edit the 'browsers' registration method in the 'karma.config.coffee' file.

[Find more browser launchers](https://npmjs.org/browse/keyword/karma-launcher)

### Compiling
You could run 'grunt' in the terminal to compile & uglify the CoffeeScript files manually.

```
grunt
```

If you would like to compile & uglify coffeeScript automatically on file change, activate the grunt watcher. This is easily done by running the 'grunt watch' command in the terminal.

```
grunt watch
```

### Building & Deploying
If your code is ready for production, simply run 'grunt:patch', 'grunt:minor' or 'grunt:major' in your terminal to deploy on github. This will do a few things;

 1. Compile CoffeeScript into Javascript.
 2. Build 'projectName.js' & 'projectName.min.js' and save it in './dist'.
 3. Update the version number and create an new release.
 4. Commit & push new release to github (make sure the project is a github repo).


For a patch commit & push, just run 'grunt patch'. (v0.0.1 to v0.0.2)

```
grunt patch
```

For a minor commit & push, run 'grunt minor'. (v0.0.2 to v0.1.0)

```
grunt minor
```

for a major commit & push, run 'grunt major'. (v0.1.0 to v1.0.0)

```
grunt major
```

Will output

    .
    └── dist
        └── projectName.min.js
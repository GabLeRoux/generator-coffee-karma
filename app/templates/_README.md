# <%= slug %>
## <%= description %>

## Usage

### Testing
Great, you are ready to write awesome code! But off course, you want to run tests, lots and lots of tests. Start Karma by running the 'grunt karma' command in the terminal.

```
grunt karma
```

Karma outputs the test reports directly in the terminal. If you prefer a html based test report go to 'server/port/debug.html' while 'grunt karma' is running. Most likely this url is;

```
http://localhost:9876/debug.html
```

> It is possible you have to refresh to get the last report

At this moment, only chrome comes out of the box. If you would like to use some other browsers, edit the 'karma.config.coffee' file. 
Find more here https://npmjs.org/browse/keyword/karma-launcher

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
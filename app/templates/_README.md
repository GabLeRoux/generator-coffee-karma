# Generator | CoffeeScript + Karma + Grunt
Build a new CoffeeScript project, test it with karma (Jasmine), run it with Grunt.

### 1. Preparing
After cloning the file to your local machine, you have to modify the package.json file with your projects name, version and optionally description. 
This is important, because grunt use the given name and version for automated file naming by compiling. If you leave the defaults, your files will be named "CoffeeScript-Karma-Grunt-0.0.1.min.js" for example.

```json
{
  "name": "your_project_name",
  "version": "0.0.1",
  "description": "your projects description"
}
```


### 2. Installing
Open your terminal and cd inside the project root. Run the following command;

```
npm install
```

Make sure you have installed nodeJS before running npm commands. Download nodeJS at

### 3. Testing
Great, you are ready to write awesome code! But off course, you want to run tests, lots and lots of tests. Start Karma by running the 'grunt karma' command in the terminal.

```
grunt karma
```

Karma outputs the test reports directly in the terminal. If you prefer a html based test report go to 'server/port/debug.html' while 'grunt karma' is running. Most likely this url is;

```
http://localhost:9876/debug.html
```

> It is possible you have to refresh to get the last report

### 4. Compiling
If you would like to compile coffeeScript automatically on file change, activate the watcher. This is easily done by running the 'grunt watch' command in the terminal.

```
grunt watch
```

Otherwise, you could run 'grunt coffee' in the terminal to compile the CoffeeScript files manually.

```
grunt coffee
```

> Compiled coffeeScript files are stored in the 'src/javascript' folder.

### 5. Building
If your code is ready for production, simply run 'grunt uglify' in your terminal. This will uglify the most recent compiled coffeeScript files in the 'src/javascript' directory.

```
grunt uglify
```

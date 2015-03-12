# Generator | CoffeeScript & Karma
A generator for Yeoman to scaffold CoffeeScript projects, test it with karma (Jasmine), run tasks with Grunt.

## Installation
First you need to install the generator on your machine. Run the next command in the terminal

```
npm install -g generator-coffeescript-karma
```

Make sure you're in the root directory of your new project. if not already, run the next command in the terminal

```
cd path/to/projectFolder
```

Run yo and select the 'Coffee Karma' generator

```
yo
```

That's all there is to it! You can start coding, testing and building right out of the box!

## Usage

### 1. Testing
Great, you are ready to write awesome code! But off course, you want to run tests, lots and lots of tests. Start Karma by running the 'grunt karma' command in the terminal.

```
grunt karma
```

Karma outputs the test reports directly in the terminal. If you prefer a html based test report go to 'server/port/debug.html' while 'grunt karma' is running. Most likely this url is;

```
http://localhost:9876/debug.html
```

> It is possible you have to refresh to get the last report

### 2. Compiling
If you would like to compile coffeeScript automatically on file change, activate the watcher. This is easily done by running the 'grunt watch' command in the terminal.

```
grunt watch
```

Otherwise, you could run 'grunt coffee' in the terminal to compile the CoffeeScript files manually.

```
grunt coffee
```

> Compiled coffeeScript files are stored in the 'src/javascript' folder.

### 3. Building
If your code is ready for production, simply run 'grunt uglify' in your terminal. This will uglify the most recent compiled coffeeScript files in the 'src/javascript' directory.

```
grunt uglify
```

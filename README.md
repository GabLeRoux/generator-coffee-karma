# CoffeeScript Init Template
Basic template for test driven CoffeeScript development.

### Prepare for installation
After cloning the file to your local environment, you have to change a few things first. This is important for file further file naming.
Go to package.json in the root folder, and edit the following attributes;

```json
{
  "name": "your_project_name",
  "version": "0.0.1",
  "description": "your projects description"
}
```


### Install Dependencies
Open your terminal and cd inside the project root. Run the following command;

```
npm install
```

Make sure you have installed nodeJS before running npm commands. Download nodeJS at http://www.nodejs.org

## Testing
Great, you are ready to write awesome code! But off course, you want to test. Start Karma by running the following command in the terminal;

```
grunt karma
```
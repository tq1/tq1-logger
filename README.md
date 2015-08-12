# tq1-logger
TQ1 node.js log wrapper to winstonjs

## Usage

1. Add `
    "tq1-logger": "git+https://github.com/tq1/tq1-logger.git#<version number>"` to `package.json` file (Check the releases for desired version number)
2. Include following line to node.js server file. Where `<options>` options are described in [Levels](#levels)
```javascript
require('tq1-logger')(<options>, console)
```


## Options

Options parameter is an object that will be passed with the following keys/values:

###logLevel

tq1-logger implements four levels for console logs. Use the logLevel key with one of the following values:

Level             | Color   | Usage                   | Description
------------------|---------|-------------------------|------------------------------
`DEBUG`           | blue    | `console.log("text")`   | Includes all levels
`INFO`            | green   | `console.info("text")`  | Also includes warn and error levels
`WARN`            | yellow  | `console.warn("text")`  | Includes `warn` and `error` levels
`ERROR`           | red     | `console.error("text")` | Only print `error` level logs

Default value is `DEBUG`.

###name

The name of your application. This will be printed with the logs and can be used to identify the log source.

The next keys should be added if [Logstash](https://www.elastic.co/products/logstash) integration is desired.

###logstashHost

This version supports Logstash integration using UDP input ([click here](https://github.com/nomiddlename/log4js-node/blob/master/examples/logstashUDP.js) for an example configuration). The logstashHost value should contain the address of your logstash host.

###logstashPort

The port (string) used by Logstash in your Logstash host.

##Example

Here is an example of how you can initiate the logger on CoffeeScript:

```javascript
options:
  logLevel: 'DEBUG'
  logstashHost: '127.0.0.1'
  logstashPort: '9999'
  name: 'Example Application'

require('tq1-logger') options, console
```

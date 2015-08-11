moment = require('moment-timezone')
colors = require('colors')
util = require('util')
log4js = require('log4js')
stripAnsi = require('strip-ansi')

class Logger

  @startLogger: (loggerLevel, mainConsole) ->

    log4js.configure({
      "appenders": [
        {
          type: "console",
          category: "TQ1 - Analytics"
        },
        {
          "host": "192.168.59.103",
          "port": 28777,
          "type": "logstashUDP",
          "layout": {
            "type": "pattern",
            "pattern": "%m"
          },
          "category": "TQ1 - Analytics"
        }
      ]
    });

    logger = log4js.getLogger('TQ1 - Analytics');
    logger.setLevel('DEBUG');

    mainConsole.log = () =>
      logger.debug stripAnsi(arguments[0])
    mainConsole.info = () =>
      logger.info stripAnsi(arguments[0])
    mainConsole.warn = () =>
      logger.warn stripAnsi(arguments[0])
    mainConsole.error = () =>
      logger.error stripAnsi(arguments[0])


module.exports = Logger

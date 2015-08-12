moment = require('moment-timezone')
colors = require('colors')
util = require('util')
log4js = require('log4js')
stripAnsi = require('strip-ansi')

class Logger

  @startLogger: (options, mainConsole) ->

    logCategory = if options.name? then options.name else "TQ1 - Logs"

    if options.logstashHost? and options.logstashPort? and options.name?
      log4js.configure({
        appenders: [
          {
            type: "console"
            category: logCategory
          },
          {
            host: options.logstashHost
            port: options.logstashPort
            type: "logstashUDP"
            layout: {
              type: "pattern"
              pattern: "%m"
            },
            category: logCategory
          }
        ]
      })

    logger = log4js.getLogger(logCategory)

    if options.logLevel?
      logger.setLevel(options.logLevel)
    else
      logger.setLevel('DEBUG')

    mainConsole.log = () =>
      logger.debug stripAnsi(arguments[0])
    mainConsole.info = () =>
      logger.info stripAnsi(arguments[0])
    mainConsole.warn = () =>
      logger.warn stripAnsi(arguments[0])
    mainConsole.error = () =>
      logger.error stripAnsi(arguments[0])


module.exports = Logger

moment = require('moment-timezone')
colors = require('colors')
util = require('util')
log4js = require('log4js')
stripAnsi = require('strip-ansi')

class Logger

  @start_logger: (options, main_console) ->

    log_category = if options.name? then options.name else "TQ1 - Logs"

    if options.logstash_host? and options.logstash_port? and options.name?
      log4js.configure({
        appenders: [
          {
            type: "console"
            category: log_category
          },
          {
            host: options.logstash_host
            port: options.logstash_port
            type: "logstashUDP"
            layout: {
              type: "pattern"
              pattern: "%m"
            },
            category: log_category
          }
        ]
      })

    logger = log4js.getLogger(log_category)

    if options.log_level?
      logger.setLevel(options.log_level)
    else
      logger.setLevel('DEBUG')

    logger.debug JSON.stringify arguments

    main_console.log = () =>
      logger.debug stripAnsi(arguments[0]) #We're just interested in the log message, that is the first argument
    main_console.info = () =>
      logger.info stripAnsi(arguments[0])
    main_console.warn = () =>
      logger.warn stripAnsi(arguments[0])
    main_console.error = () =>
      logger.error stripAnsi(arguments[0])


module.exports = Logger

winston = require('winston')
moment = require('moment-timezone')
colors = require('colors')
util = require('util')

class Logger

  @startLogger: (loggerLevel, mainConsole) ->

    logFormatter = (options) ->
      return "[" + options.timestamp() + "][" + colorizeLevel(options.level.toUpperCase()) + "]: " +
      (if options.message isnt undefined then options.message else '') + ' ' +
      (if options.meta and Object.keys(options.meta).length > 0 then '' + JSON.stringify(options.meta) else '')

    customTimestamp = () ->
      return moment().toString()

    colorizeLevel = (level) ->
      switch level
        when 'DEBUG' then return level.blue
        when 'INFO' then return level.green
        when 'WARN' then return level.yellow
        when 'ERROR' then return level.red

    consoleConfig =
      level: {}
      colorize: true
      prettyPrint: true
      timestamp: customTimestamp
      formatter: logFormatter

    switch loggerLevel
      when 'debug' then consoleConfig.level = 'debug'
      when 'info' then consoleConfig.level = 'info'
      when 'warn' then consoleConfig.level = 'warn'
      when 'error' then consoleConfig.level = 'error'

    logger = new winston.Logger transports: [new winston.transports.Console consoleConfig]

    mainConsole.log = () =>
      logger.debug.apply logger, @_formatArgs(arguments)
    mainConsole.info = () =>
      logger.info.apply logger, @_formatArgs(arguments)
    mainConsole.warn = () =>
      logger.warn.apply logger, @_formatArgs(arguments)
    mainConsole.error = () =>
      logger.error.apply logger, @_formatArgs(arguments)


  @_formatArgs: (args) ->
    return [util.format.apply(util.format, Array.prototype.slice.call(args))]


module.exports = Logger

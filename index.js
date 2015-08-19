var logger = require('./src/logger');
module.exports = (function(options, main_console){
  logger.start_logger(options, main_console);
});

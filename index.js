var logger = require('./src/logger');
module.exports = (function(options, mainConsole){
  logger.startLogger(options, mainConsole);
});

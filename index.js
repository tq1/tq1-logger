var logger = require('./src/logger');
module.exports = (function(level, mainConsole){
  logger.startLogger(level, mainConsole);
});

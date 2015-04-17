# tq1-logger
TQ1 node.js log wrapper to winstonjs

## Usage

1. Add `
    "tq1-logger": "git+https://github.com/tq1/tq1-logger.git#0.0.2"` to `package.json` file
2. Include following line to node.js server file. Where `<logger level>` options are described in [Levels](#levels)
```javascript
require('tq1-logger')(<logger level>, console)
```


## Levels
tq1-logger implements four levels for console logs.

Level             | Color   | Usage                   | Description
------------------|---------|-------------------------|------------------------------
`debug`           | blue    | `console.log("text")`   | Includes all levels
`info`            | green   | `console.info("text")`  | Also includes warn and error levels
`warn`            | yellow  | `console.warn("text")`  | Includes `warn` and `error` levels
`error`           | red     | `console.error("text")` | Only print `error` level logs

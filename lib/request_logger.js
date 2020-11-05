const chalk = require('chalk')

const requestLogger = function (req, res, next) {
  console.log(chalk.bgBlueBright.whiteBright('\n===== Incoming Request =====\n'))
  console.log(`${new Date()}`)
  console.log(`${req.method} ${req.url}`)
  console.log(`body ${JSON.stringify(req.body)}`)
  console.log(chalk.bgBlueBright.whiteBright('\n============================\n'))
  next()
}

module.exports = requestLogger

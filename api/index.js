const app = require('express')();

const apm = require('elastic-apm-node').start({
  // Override service name from package.json
  // Allowed characters: a-z, A-Z, 0-9, -, _, and space
  serviceName: 'Node_API',

  // Use if APM Server requires a token
  // secretToken: '',

  // Use if APM Server uses API keys for authentication
  apiKey: 'Um9oeEYzOEJFUmlaNm9BYzMzbHc6N3Z4TDRzWjNSUnFGRkF1d211NUlXZw==',

  // Set custom APM Server URL (default: http://localhost:8200)
  serverUrl: 'http://192.168.0.11:8200',
})

apm.logger.info('APM is running')

app.get('/error', (req, res) => {
  apm.captureError(new Error('Something went wrong'));
  return res.json({ message: 'Hello World' });
})

app.get('/', (req, res) => {
  return res.json({ message: 'Hello World' });
})

app.listen(8080, () => console.log('API runing!'))

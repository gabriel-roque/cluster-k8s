require('dotenv').config();

const app = require('express')()
const faker = require('faker')

const apm = require('elastic-apm-node').start({
  serviceName: 'NODE_API',
  apiKey: process.env.ELASTIC_API_TOKEN,
  serverUrl: process.env.APM_SERVER,
  environment: 'development',
})

app.use((req, res, next) => {
  const t = apm.startTransaction(`${req.method} ${req.path}`, { startTime: Date.now().toString() })

  const user = {
    email: faker.internet.email(),
    username: faker.internet.userName(),
    id: faker.datatype.uuid()
  }

  req.user = user
  t.addLabels(user, true)
  apm.setUserContext(user)

  apm.setCustomContext({
    userId: user.id,
    userAuth: true
  })

  apm.registerMetric('any_metric', () => {
    return Math.random()
  })

  apm.setSpanOutcome('success')

  req.transaction = t
  req.id = faker.datatype.uuid()
  next()
})

app.get('/error', (req, res) => {
  try {
    throw new Error('Something went wrong')
  } catch (err) {
    req.transaction.end(req.id);
    apm.captureError(err);
    return res.json({ error: err.message });
  }
})

app.get('/', (req, res) => {
  req.transaction.end(req.id);
  return res.json({ message: 'Hello World' });
})

app.get('/delay', (req, res) => {
  setTimeout(() => {
    req.transaction.end(req.id);
    return res.json({ message: 'Deplay Route' });
  }, 3000)
})

app.listen(8080, () => console.log('API runing!'))

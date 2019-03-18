const fastify = require('fastify')({
  logger: true
})

fastify.get('/', async () => {
  return { errorLevels: fastify.log.levels }
})

fastify.get('/trace', async () => {
  fastify.log.trace('execute /trace route')
  return 'response for trace'
})

fastify.get('/debug', async () => {
  fastify.log.debug('execute /debug route')
  return 'response for debug'
})

fastify.get('/info', async () => {
  const info = {
    currentTimestamp: +new Date(),
    sequenceId: 100,
    description: 'Additional important description',
    userIds: [100, 200, 300]
  }
  fastify.log.info('execute /info route', info)
  return 'response for info'
})

fastify.get('/warn', async () => {
  fastify.log.warn('execute /warn route')
  return 'response for warn'
})

fastify.get('/error', async () => {
  fastify.log.error('execute /error route')
  return 'response for error'
})

fastify.get('/fatal', async () => {
  try {
    throw new Error('Whoops!')
  } catch (e) {
    fastify.log.fatal('execute /fatal route', e)
  }

  return 'response for fatal'
})

const start = async () => {
  try {
    await fastify.listen(3000, '0.0.0.0')
    fastify.log.info(`server listening on ${fastify.server.address().port}`)
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}

process.on('SIGINT', () => process.exit());
start()
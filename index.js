const fastify = require('fastify')({
    logger: true
})

fastify.get('/', async (request, reply) => {
    fastify.log.info('execute / route')
    return { hello: 'world' }
})

fastify.get('/test', async (request, reply) => {
    fastify.log.info('execute /test route')
    return 'test response'
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
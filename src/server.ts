import Fastify from 'fastify';
import fastifyPostgres from '@fastify/postgres';
import { CONFIG } from './config';

const server = Fastify({
  logger: true,
});

server.register(fastifyPostgres, {
  connectionString: CONFIG.connectionString,
});

server.get('/', async (request, reply) => {
  return { hello: 'world' };
});

server.get('/test', async (request, reply) => {
  const client = await server.pg.connect();
  try {
    const { rows } = await client.query('select * from movie');
    return { result: rows };
  } finally {
    client.release();
  }
});

const start = async () => {
  try {
    await server.listen({ port: CONFIG.port });
  } catch (err) {
    server.log.error(err);
    process.exit(1);
  }
};

start();

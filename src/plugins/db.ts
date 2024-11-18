import fp from 'fastify-plugin';
import fastifyPostgres from '@fastify/postgres';
import { CONFIG } from '../config';
import { FastifyInstance } from 'fastify';

export default fp(async (fastify: FastifyInstance) => {
  fastify.register(fastifyPostgres, {
    connectionString: CONFIG.connectionString,
  });
});

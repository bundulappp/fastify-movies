import Fastify from 'fastify';
import { CONFIG } from './config';
import db from './plugins/db';
import { MovieRepository } from './repository/movie.repository';
import { MovieService } from './service/movie.service';
import { movieRoutes } from './controller/routes/movie.routes';

export default async function createApp() {
  const server = Fastify({
    logger: true,
  });

  server.register(db);
  const movieRepository = new MovieRepository(server);
  const movieService = new MovieService(movieRepository);

  await server.register(async (fastify) => {
    await movieRoutes(fastify, movieService);
  });

  return server;
}

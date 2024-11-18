import { FastifyInstance } from 'fastify';
import { MovieService } from '../../service/movie.service';

export async function movieRoutes(
  fastify: FastifyInstance,
  movieService: MovieService
) {
  fastify.get('/movies', async (request, reply) => {
    try {
      const movies = await movieService.getAll();
      return { movies };
    } catch (error) {
      fastify.log.error(error);
      reply.status(500).send({ error: 'Internal Server Error' });
    }
  });
}

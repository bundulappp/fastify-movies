import { PoolClient } from 'pg';
import { Movie } from '../type/movie.type';
import { FastifyInstance } from 'fastify';

export class MovieRepository {
  constructor(private fastify: FastifyInstance) {}

  async getAll(): Promise<Movie[]> {
    const dbClient = await this.fastify.pg.connect();
    const { rows } = await dbClient.query('SELECT * FROM movie');
    return rows;
  }
}

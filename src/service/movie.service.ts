import { MovieRepository } from '../repository/movie.repository';
import { Movie } from '../type/movie.type';

export class MovieService {
  constructor(private movieRepository: MovieRepository) {}

  async getAll(): Promise<Movie[]> {
    return await this.movieRepository.getAll();
  }
}

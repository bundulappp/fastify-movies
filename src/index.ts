import { CONFIG } from './config';
import createApp from './server';

async function start() {
  try {
    const server = await createApp();
    await server.listen({ port: CONFIG.port });
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

start();

require('dotenv').config();
export const CONFIG = {
  connectionString: process.env.CONNECTION_STRING!,
  port: Number(process.env.PORT!),
};

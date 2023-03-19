// logger to properly format logs for console

import logger from "pino";
import dayjs from "dayjs";

const log = logger({
  base: {
    pid: false,
  },
  transport: {
    target: "pino-pretty",
    options: {
      colorize: true,
    },
  },
  timestamp: () => `,"time":"${dayjs().format()}"`,
});

export default log;

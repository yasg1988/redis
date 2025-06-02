FROM debian:bullseye-slim

# Установим зависимости и клонируем исходники нужной версии Redis
RUN apt-get update && \
    apt-get install -y build-essential tcl git curl && \
    git clone --branch 8.0.2 --depth 1 https://github.com/redis/redis.git /redis

# Собираем Redis
WORKDIR /redis
RUN make && make install

# Открываем порт Redis
EXPOSE 6379

# Если нужен пароль — добавьте строку ниже (замените YourStrongPassword)
 CMD ["src/redis-server", "--requirepass", "erg#(Q%*NDS235dg;", "--protected-mode", "no"]

# Без пароля (НЕ рекомендовано для продакшена)
# CMD ["src/redis-server", "--protected-mode", "no"]

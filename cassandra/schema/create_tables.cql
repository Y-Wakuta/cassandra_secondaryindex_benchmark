CREATE TABLE IF NOT EXISTS bench.users_id_index(
  userid text PRIMARY KEY,
  first_name text,
  last_name text
);

CREATE TABLE IF NOT EXISTS bench.users_first_name_index(
  userid text,
  first_name text PRIMARY KEY,
  last_name text
);

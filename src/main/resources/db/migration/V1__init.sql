create table users (
                       id uuid primary key,
                       email varchar(255) not null unique,
                       password_hash varchar(255) not null,
                       created_at timestamptz not null default now()
);

create table routes (
                        id uuid primary key,
                        user_id uuid not null references users(id) on delete cascade,
                        created_at timestamptz not null default now(),

                        start_lat double precision not null,
                        start_lng double precision not null,

                        target_distance_m integer not null,
                        actual_distance_m integer not null,
                        elevation_gain_m integer not null,

                        profile varchar(32) not null,
                        points_polyline text not null
);

create index idx_routes_user_created on routes(user_id, created_at desc);
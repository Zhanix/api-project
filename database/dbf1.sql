PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);
INSERT INTO migrations VALUES(1,'0001_01_01_000000_create_users_table',1);
INSERT INTO migrations VALUES(2,'0001_01_01_000001_create_cache_table',1);
INSERT INTO migrations VALUES(3,'0001_01_01_000002_create_jobs_table',1);
INSERT INTO migrations VALUES(4,'2024_12_16_061235_create_f1_table',2);
INSERT INTO migrations VALUES(5,'2024_12_16_061630_create_personal_access_tokens_table',3);
CREATE TABLE IF NOT EXISTS "users" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "email_verified_at" datetime, "password" varchar not null, "remember_token" varchar, "created_at" datetime, "updated_at" datetime);
CREATE TABLE IF NOT EXISTS "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));
CREATE TABLE IF NOT EXISTS "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));
INSERT INTO sessions VALUES('tUQdrApK99B0WzN6vwcX2EXyBPHWejRIhEeVkobF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkVNQWR2ZDRKeU5PVktJTk5KN3dieHdWcEJiT3JnVFFPWldQSE1GNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1734331253);
CREATE TABLE IF NOT EXISTS "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);
CREATE TABLE IF NOT EXISTS "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));
CREATE TABLE IF NOT EXISTS "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS "f1" ("id" integer primary key autoincrement not null, "posisi" varchar not null, "tim" varchar not null, "desctim" text not null, "point" varchar not null, "logo" varchar not null, "created_at" datetime, "updated_at" datetime);
INSERT INTO f1 VALUES(3,'Posisi : 1','Red Bull Racing','Red Bull tampil dominan di musim 2023 dengan mobil RB19 yang superior. Max Verstappen meraih gelar juara dunia untuk ketiga kalinya, sementara Sergio Perez menambah poin penting bagi tim. Kombinasi performa mobil, strategi cerdas, dan kecepatan murni membawa Red Bull menjadi juara konstruktor dengan dominasi hampir di setiap balapan.','Point : 860','https://i.imgur.com/DrCIlDy.jpeg','2024-12-16 06:34:39','2024-12-16 06:34:39');
INSERT INTO f1 VALUES(4,'Posisi : 2','Mercedes-AMG PETRONAS','Mercedes mengalami musim yang menantang dengan mobil W14 yang masih bermasalah dengan performa dan keseimbangan. Namun, Lewis Hamilton tampil konsisten dengan beberapa podium penting, sementara George Russell berjuang untuk hasil terbaik. Mercedes akhirnya finis kedua di klasemen konstruktor, menunjukkan kemajuan meski belum bisa menyaingi Red Bull.','Point : 409','https://i.imgur.com/xAzAoLa.jpeg','2024-12-16 06:35:56','2024-12-16 06:35:56');
INSERT INTO f1 VALUES(5,'Posisi : 3','Ferrari','Ferrari mengalami musim yang naik turun dengan mobil SF-23 yang kurang stabil dalam performa. Charles Leclerc dan Carlos Sainz berhasil meraih beberapa podium dan satu kemenangan, namun tim masih kesulitan bersaing dalam perebutan gelar. Ferrari berfokus pada peningkatan konsistensi untuk kembali ke puncak.','Point : 406','https://i.imgur.com/02Xyorb.jpeg','2024-12-16 06:36:30','2024-12-16 06:36:30');
INSERT INTO f1 VALUES(6,'Posisi : 4','McLaren Mercedes','McLaren memulai musim dengan lambat, namun peningkatan besar pada paruh kedua musim membuat mereka tampil impresif. Lando Norris menjadi andalan dengan sejumlah podium, sementara rookie Oscar Piastri menunjukkan potensinya dengan performa solid, termasuk finis kuat di beberapa balapan penting.','Point : 302','https://i.imgur.com/Ln7G77H.jpeg','2024-12-16 06:37:35','2024-12-16 06:37:35');
INSERT INTO f1 VALUES(7,'Posisi : 5','Aston Martin Aramco Mercedes','Aston Martin tampil mengejutkan di awal musim dengan mobil AMR23 yang kompetitif. Fernando Alonso meraih beberapa podium berkat performa briliannya, sementara Lance Stroll berjuang meraih poin. Meskipun performa menurun di paruh kedua musim, Aston Martin tetap menjadi tim yang patut diperhitungkan.','Point : 280','https://i.imgur.com/fIeBvsJ.jpeg','2024-12-16 06:38:11','2024-12-16 06:38:11');
INSERT INTO f1 VALUES(8,'Posisi : 6','Alpine Renault','Alpine menjalani musim yang tidak konsisten, dengan performa mobil A523 sering naik turun. Esteban Ocon dan Pierre Gasly meraih beberapa hasil positif, termasuk podium di balapan tertentu, namun tim masih jauh dari bersaing di papan atas dan fokus pada peningkatan performa.','Point : 120','https://i.imgur.com/c7ouV06.jpeg','2024-12-16 06:38:49','2024-12-16 06:38:49');
INSERT INTO f1 VALUES(9,'Posisi : 7','Williams Mercedes','Williams menunjukkan peningkatan dengan mobil FW45, terutama di lintasan cepat. Alex Albon tampil impresif dengan hasil poin penting, sementara Logan Sargeant sebagai rookie masih beradaptasi. Tim menunjukkan progres positif menuju kebangkitan mereka.','Point : 28','https://i.imgur.com/MFdycxR.jpeg','2024-12-16 06:39:20','2024-12-16 06:39:20');
INSERT INTO f1 VALUES(10,'Posisi : 8','AlphaTauri Honda RBPT','AlphaTauri mengalami musim yang sulit dengan performa mobil yang kurang kompetitif. Yuki Tsunoda tampil solid dalam beberapa balapan, sementara Nyck de Vries digantikan oleh Daniel Ricciardo yang memberikan dorongan performa di paruh kedua musim.','Point : 25','https://i.imgur.com/MO1amxk.jpeg','2024-12-16 06:39:55','2024-12-16 06:39:55');
INSERT INTO f1 VALUES(11,'Posisi : 9','Alfa Romeo Ferrari','Alfa Romeo mengalami kesulitan dengan mobil C43 yang kurang stabil. Valtteri Bottas dan Zhou Guanyu berjuang meraih poin di tengah kompetisi ketat di papan tengah, namun performa tim tetap tertinggal dari rival terdekat.','Point : 16','https://i.imgur.com/sAfBcSt.jpeg','2024-12-16 06:40:23','2024-12-16 06:40:23');
INSERT INTO f1 VALUES(12,'Posisi : 10','Haas Ferrari','Haas kesulitan dengan degradasi ban pada mobil VF-23, yang sering membuat mereka kehilangan posisi di balapan. Kevin Magnussen dan Nico Hülkenberg beberapa kali tampil kuat di kualifikasi, tetapi konsistensi menjadi tantangan utama tim sepanjang musim.','Point : 12','https://i.imgur.com/eD8Qs2e.jpeg','2024-12-16 06:40:50','2024-12-16 06:40:50');
CREATE TABLE IF NOT EXISTS "personal_access_tokens" ("id" integer primary key autoincrement not null, "tokenable_type" varchar not null, "tokenable_id" integer not null, "name" varchar not null, "token" varchar not null, "abilities" text, "last_used_at" datetime, "expires_at" datetime, "created_at" datetime, "updated_at" datetime);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('migrations',5);
INSERT INTO sqlite_sequence VALUES('f1',12);
CREATE UNIQUE INDEX "users_email_unique" on "users" ("email");
CREATE INDEX "sessions_user_id_index" on "sessions" ("user_id");
CREATE INDEX "sessions_last_activity_index" on "sessions" ("last_activity");
CREATE INDEX "jobs_queue_index" on "jobs" ("queue");
CREATE UNIQUE INDEX "failed_jobs_uuid_unique" on "failed_jobs" ("uuid");
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" on "personal_access_tokens" ("tokenable_type", "tokenable_id");
CREATE UNIQUE INDEX "personal_access_tokens_token_unique" on "personal_access_tokens" ("token");
COMMIT;

const sqlite3 = require("sqlite3");
const { open } = require("sqlite");
const path = require("path");

const db = async () => {
  return await open({
    filename: "./data.sqlite",
    driver: sqlite3.Database,
  });
};

(async () => {
  const db_ = await db();
  console.info("Running Migrations");
  await db_.migrate({
    migrationsPath: path.join(__dirname, "migrations"),
  });
})();

module.exports = {
  db,
};

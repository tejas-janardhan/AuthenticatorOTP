--------------------------------------------------------------------------------
-- Up
--------------------------------------------------------------------------------
CREATE TABLE
    users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name CHAR(100) NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        isEmailVerified INTEGER NOT NULL DEFAULT 0,
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    authProviders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name CHAR(100) NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        isEmailVerified INTEGER NOT NULL DEFAULT 0,
        uniquePasscode TEXT NOT NULL,
        otpLength INTEGER NOT NULL DEFAULT 4,
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    userAuthProviderRegistry (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name CHAR(100) NOT NULL,
        userId INTEGER NOT NULL,
        authProviderId INTEGER NOT NULL,
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (userId) REFERENCES users (id),
        FOREIGN KEY (authProviderId) REFERENCES authProviders (id)
    );

CREATE TABLE
    otps (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        otp CHAR(10) NOT NULL,
        validFrom TEXT NOT NULL,
        validTo TEXT NOT NULL,
        userAuthProviderRegistryId INTEGER,
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (userAuthProviderRegistryId) REFERENCES userAuthProviderRegistry (id)
    );

--------------------------------------------------------------------------------
-- Down
--------------------------------------------------------------------------------
DROP TABLE users;

DROP TABLE authProviders;

DROP TABLE userAuthProviderRegistry;

DROP TABLE otps;
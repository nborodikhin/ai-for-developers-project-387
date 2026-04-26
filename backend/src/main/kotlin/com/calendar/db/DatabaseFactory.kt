package com.calendar.db

import com.zaxxer.hikari.HikariConfig
import com.zaxxer.hikari.HikariDataSource
import jakarta.annotation.PostConstruct
import org.flywaydb.core.Flyway
import org.jetbrains.exposed.sql.Database
import org.springframework.stereotype.Component

@Component
class DatabaseFactory {

    @PostConstruct
    fun init() {
        // Pool size 1: all transactions share the same connection → same in-memory SQLite DB
        val config = HikariConfig().apply {
            jdbcUrl = "jdbc:sqlite::memory:"
            driverClassName = "org.sqlite.JDBC"
            maximumPoolSize = 1
        }
        val dataSource = HikariDataSource(config)

        Flyway.configure()
            .dataSource(dataSource)
            .load()
            .migrate()

        Database.connect(dataSource)
    }
}

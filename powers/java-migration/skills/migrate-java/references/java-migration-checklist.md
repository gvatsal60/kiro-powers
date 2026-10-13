# Java migration checklist

Reference checklist for migrating a Java project from one JDK version to
another. Based on the Oracle JDK Migration Guide and OpenRewrite recipes.

## Before you start

- [ ] Test suite is green on the current JDK
- [ ] Dedicated upgrade branch created
- [ ] Target JDK installed locally and in CI
- [ ] Dependencies audited for target-JDK support (Lombok, Mockito,
      ByteBuddy, ASM, cglib, monitoring agents)
- [ ] Inventory of `javax.*` Java EE usage and `sun.*` internal access

## Build configuration

- [ ] Maven: set `maven.compiler.release` (or plugin `<release>`)
- [ ] Gradle: set `sourceCompatibility` / `toolchain.languageVersion`
- [ ] Bump Maven/Gradle and plugins to target-compatible versions
- [ ] Update CI images and `actions/setup-java` versions

## Breaking changes to handle

- [ ] Removed Java EE modules (JDK 11+): JAXB, JAX-WS, JAF, CORBA
      re-added as explicit dependencies
- [ ] Namespace check: `javax.xml.bind` (JAXB 2.x) vs
      `jakarta.xml.bind` (JAXB 3.x)
- [ ] Strong encapsulation (JDK 17+): scoped `--add-opens` /
      `--add-exports` instead of `--illegal-access`
- [ ] `SecurityManager` deprecated for removal (JDK 17+)
- [ ] `finalize()`, Nashorn, `Thread.stop()/suspend()/resume()` removed
- [ ] System class loader is no longer `URLClassLoader` (JDK 9+)
- [ ] GC flags updated: G1 is the default since JDK 9; CMS removed
- [ ] Unified JVM logging: replace `-XX:+PrintGCDetails` with `-Xlog:gc`

## Automation

OpenRewrite composite recipes (`org.openrewrite.recipe:rewrite-migrate-java`):

- `org.openrewrite.java.migrate.UpgradeToJava17`
- `org.openrewrite.java.migrate.UpgradeToJava21`
- `org.openrewrite.java.migrate.UpgradeToJava25`

Run with Maven:

```sh
mvn -U org.openrewrite.maven:rewrite-maven-plugin:run \
  -Drewrite.recipeArtifactCoordinates=org.openrewrite.recipe:rewrite-migrate-java:RELEASE \
  -Drewrite.activeRecipes=org.openrewrite.java.migrate.UpgradeToJava21
```

## Validation

- [ ] Clean build on the target JDK
- [ ] Full test suite passes
- [ ] No `InaccessibleObjectException` or illegal-access warnings
- [ ] Serialization, reflection, and integration paths exercised
- [ ] Performance compared against the previous JDK

## References

- Oracle JDK Migration Guide: https://docs.oracle.com/en/java/javase/21/migrate/
- Migrating from JDK 8 to later releases:
  https://docs.oracle.com/en/java/javase/21/migrate/migrating-jdk-8-later-jdk-releases.html
- OpenRewrite Java migration recipes:
  https://github.com/openrewrite/rewrite-migrate-java
- JEP 403: Strongly Encapsulate JDK Internals by Default
- JEP 411: Deprecate the Security Manager for Removal

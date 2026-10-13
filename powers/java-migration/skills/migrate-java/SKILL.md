---
name: migrate-java
description: Migrate a Java project from one JDK version to another
---

# Migrate Java versions

Guide the agent through migrating a Java codebase between JDK versions
(for example JDK 8 → 17, 17 → 21, or 21 → 25).

## Step 1: Assess the current state

- Record the current runtime and build JDK: `java -version`
- Identify the build tool and compiler settings:
  - Maven: `maven-compiler-plugin` `<release>` / `<source>` / `<target>`
  - Gradle: `sourceCompatibility`, `targetCompatibility`,
    `java.toolchain.languageVersion`
- Inventory dependencies that manipulate bytecode or use reflection
  (Lombok, Mockito, ByteBuddy, ASM, cglib) and confirm each supports
  the target JDK
- Scan for JDK-internal usage with `jdeps` from the target JDK:
  `jdeps --jdk-internals -R <jars-or-classes>`

## Step 2: Prepare a migration branch

- Create a dedicated upgrade branch
- Ensure the test suite is green on the current JDK before changing anything

## Step 3: Point the build toolchain at the target JDK

- Install the target JDK and configure the build toolchain
- Set the compiler `release` flag to the target major version
- Bump Maven/Gradle and plugins to versions that support the target JDK

## Step 4: Fix breaking changes

- Removed Java EE modules (JDK 11+): JAXB, JAX-WS, JAF, CORBA must
  become explicit dependencies with the correct namespace
  (`javax.xml.bind` stays JAXB 2.x; `jakarta.xml.bind` needs JAXB 3.x)
- Strong encapsulation (JDK 17+): replace `--illegal-access` usage with
  scoped `--add-opens` / `--add-exports`, and prefer upgrading the
  offending library over adding flags
- Removed APIs: Nashorn, `SecurityManager` (deprecated), `finalize()`,
  `Thread.stop()/suspend()/resume()`, `Runtime.exec()` legacy overloads
- `URLClassLoader` casting: the system class loader is no longer a
  `URLClassLoader` on JDK 9+

## Step 5: Run OpenRewrite recipes

Apply the composite recipe for the target version from
`org.openrewrite.recipe:rewrite-migrate-java`:

- `org.openrewrite.java.migrate.UpgradeToJava17`
- `org.openrewrite.java.migrate.UpgradeToJava21`
- `org.openrewrite.java.migrate.UpgradeToJava25`

Review the diff, then run the build and tests.

## Step 6: Validate

- Clean build and full test suite pass on the target JDK
- No `InaccessibleObjectException` or illegal-access warnings at startup
- Exercise serialization, reflection, and integration paths
- Compare startup time, throughput, and memory against the previous JDK

## Step 7: Roll out

- Ship behind a canary with error and latency monitoring
- Keep the previous runtime image available for rollback
- Track every remaining `--add-opens` flag with an owner and removal plan

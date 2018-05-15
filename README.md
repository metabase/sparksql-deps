# Metabase SparkSQL driver dependencies

### Building the JAR

```bash
lein uberjar # builds target/metabase-sparksql-deps-1.2.1.spark2-standalone.jar
```

### Signing the JAR (Optional)

```bash
# (Replace keystore, TSA and profile below with your own)
jarsigner -keystore /path/to/my_keystore.jks \
  -tsa 'http://my.timestamp-authority.com' \
  target/metabase-sparksql-deps-1.2.1.spark2-standalone.jar \
  'my-signing-profile'
```  

### Releasing an updated JAR (for Metabase developers)

```bash
# Requires aws-cli tools installed & a `metabase` profile set up
./build-and-release
```

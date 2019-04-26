# Kotlin Native

- `./gradlew common_native:build`
- `./common_native/build/konan/bin/macos_x64/common_native_main.kexe`


## Alternative

I didn't succeed to use

```
// Did not succeeded with 'kotlin-platform-native'
apply plugin: 'kotlin-platform-native'
sourceSets {
    main {
        kotlin.srcDir 'src/main/kotlin'
        component {
            outputKinds = [EXECUTABLE] // <-- FRAMEWORK/LIBRARY does not work here
            target 'macos_x64'
        }
    }
}
```
# Onova source dependency

Source: https://github.com/Tyrrrz/Onova/tree/6b471ea61d7358c35a7c79a014b0675600d931a0

Version: 2.6.13. Original license: MIT, preserved in License.txt.

The application builds Onova from source because its upstream binary embeds Deorcify. Local changes remove that dependency, target the library to .NET 10, update the formatting tool, and share the application's build settings. The updater executable retains its .NET Framework 3.5 target and original update behavior.

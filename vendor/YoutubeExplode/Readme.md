# YoutubeExplode source dependency

Source: https://github.com/Tyrrrz/YoutubeExplode/tree/d8b1928bf32802c43532465f4d202d066ce77667

Version: 6.6.3. Original license: MIT, preserved in License.txt.

The application builds both YoutubeExplode and YoutubeExplode.Converter from these sources instead of consuming their precompiled NuGet packages. The upstream YoutubeExplode package internalizes Deorcify, hiding the regional startup restriction from the NuGet dependency graph.

Local changes: removed the Deorcify package reference, targeted .NET 10, and shared the application's build and package settings. The YouTube API and conversion code is unchanged. Future dependency upgrades must preserve these changes and pass scripts/Verify-NoRegionalRestrictions.ps1 against the published binaries.

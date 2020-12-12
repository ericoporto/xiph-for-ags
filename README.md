# xiph-for-ags
Xiph libraries needed for developing AGS on Windows 

[![Build Status](https://dev.azure.com/ericoporto/xiph-for-ags/_apis/build/status/ericoporto.xiph-for-ags?branchName=main)](https://dev.azure.com/ericoporto/xiph-for-ags/_build/latest?definitionId=17&branchName=main)
[![NuGet Release Status](https://vsrm.dev.azure.com/ericoporto/_apis/public/Release/badge/d9a338cd-2575-4610-a871-df8adf998416/1/1)](https://dev.azure.com/ericoporto/xiph-for-ags/_release?view=all&_a=deployments&definitionId=1)
[![Nuget](https://img.shields.io/nuget/v/ericoporto.xiph-for-ags)](https://www.nuget.org/packages/ericoporto.xiph-for-ags)

## Details on this package

This package is currently not ready to be integrated in other environments other than AGS Development.

## Notes

Native NuGet package made following partially : [digitalhouseblog How to make A NuGet Package for C++](https://digitalhouseblog.wordpress.com/2019/08/22/how-to-make-a-nuget-package-for-c/) | [archive](https://web.archive.org/web/20201025012823/https://digitalhouseblog.wordpress.com/2019/08/22/how-to-make-a-nuget-package-for-c/)

Release pipeline made with help from this article : [yanxiaod Using Azure Pipelines to publish the NuGet package from GitHub repo](https://medium.com/@yanxiaodi/using-azure-devops-pipelines-to-publish-the-nuget-package-from-github-repo-fb58be4e9be8) | [archive](https://web.archive.org/web/20201212210106/https://medium.com/@yanxiaodi/using-azure-devops-pipelines-to-publish-the-nuget-package-from-github-repo-fb58be4e9be8)

This repository uses a YAML Azure Pipeline to build and release the package to GitHub and a second Classic Azure Pipeline that can pickup the artifact from the GitHub Release and pushes to NuGet.

# Docker Image for R Client

Docker image for using R Client.

+ [R client overview](https://msdn.microsoft.com/en-us/microsoft-r/r-client)


## How to Use This Docker Image

The easiest way to use this docker image is to build from docker hub:

```bash
docker run -it akzaidi/mrclient-docker /bin/bash
```

This will land you as the root user in the docker container. There will be four files waiting for you here, the three EULA files (see the licensing agreement below) and a `demo.R` script. Start an R session and try out the demo script:

```bah
R
source("demo.R")
```

You can find further examples in the `rstudio-server` docker image I have here: [mrclient-rstudio](https://github.com/akzaidi/mrclient-rstudio). 

## Licensing

Microsoft R Client has special licensing terms, which you agree to if you use this Docker image. The licensing information for MRO and MKL can be found online at [MRO and MKL licenses](https://mran.microsoft.com/faq/#licensing). 
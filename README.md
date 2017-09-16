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
> source('demo.R')
Automatically adding a MinMax normalization transform, use 'norm=Warn' or 'norm=No' to turn this behavior off.
Beginning processing data.
Rows Read: 248, Read Time: 0.000133038, Transform Time: 0.00142789
Beginning processing data.
Beginning processing data.
Rows Read: 248, Read Time: 0.000154018, Transform Time: 0.00182796
Beginning processing data.
Beginning processing data.
Rows Read: 248, Read Time: 0.000166893, Transform Time: 0.00142193
Beginning processing data.
Using 2 threads to train.
Automatically choosing a check frequency of 2.
Auto-tuning parameters: maxIterations = 6048.
Auto-tuning parameters: L2 = 2.666837E-05.
Auto-tuning parameters: L1Threshold (L1/L2) = 0.
Using best model from iteration 4686.
Not training a calibrator because it is not needed.
Elapsed time: 00:00:10.6677594
Elapsed time: 00:00:00.0808943
Beginning processing data.
Rows Read: 248, Read Time: 0.000112772, Transform Time: 0.00201106
Beginning processing data.
Elapsed time: 00:00:00.3250834
Finished writing 248 rows.
Writing completed.
> sessionInfo()
R version 3.3.3 (2017-03-06)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 16.04.3 LTS

locale:
[1] C

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

other attached packages:
[1] RevoUtilsMath_10.0.0 RevoUtils_10.0.3     RevoMods_11.0.0
[4] MicrosoftML_1.3.0    RevoScaleR_9.1.0     lattice_0.20-34
[7] rpart_4.1-10

loaded via a namespace (and not attached):
[1] R6_2.2.0               tools_3.3.3            CompatibilityAPI_1.1.0
[4] codetools_0.2-15       grid_3.3.3             mrupdate_1.0.1
[7] iterators_1.0.8        foreach_1.4.3          jsonlite_1.3
```

You can find further examples in the `rstudio-server` docker image I have here: [mrclient-rstudio](https://github.com/akzaidi/mrclient-rstudio). 

## Licensing

Microsoft R Client has special licensing terms, which you agree to if you use this Docker image. The licensing information for MRO and MKL can be found online at [MRO and MKL licenses](https://mran.microsoft.com/faq/#licensing). 
# Standalone SPM docker image
This is a minimal docker image for SPM Standalone. For more info see: https://en.wikibooks.org/wiki/SPM/Standalone .

# Ho to use
1. Pull the image on your local machine:
```
docker pull alerokhin/spm-min:12
```
2. Download the [example batch script](https://raw.githubusercontent.com/commandercool/spm-min/main/auditory_spm12_batch.m) and save it in `C:\spm-min-test`.
This is a slightly adjusted script of well-known [auditory example](https://www.fil.ion.ucl.ac.uk/spm/data/auditory/), available on the SPM official page.
3. Run the example script with the following command:
```
docker run -v "C:\spm-min-test":/data alerokhin/spm-min script /data/auditory_spm12_batch.m
```
At the beginning of execution, you should see the following output:
```
Warning: No display specified.  You will not be able to display graphics on the screen.
SPM12, version 7771 (standalone)
MATLAB, version 7.10.0.499 (R2010a)
 ___  ____  __  __
/ __)(  _ \(  \/  )
\__ \ )___/ )    (   Statistical Parametric Mapping
(___/(__)  (_/\/\_)  SPM12 - https://www.fil.ion.ucl.ac.uk/spm/

Downloading Auditory dataset...         :                        ...done


------------------------------------------------------------------------
04-Oct-2020 16:06:17 - Running job #1
------------------------------------------------------------------------
04-Oct-2020 16:06:17 - Running 'Make Directory'
04-Oct-2020 16:06:17 - Done    'Make Directory'
04-Oct-2020 16:06:17 - Running 'Move/Delete Files'
04-Oct-2020 16:06:20 - Done    'Move/Delete Files'
04-Oct-2020 16:06:20 - Done



------------------------------------------------------------------------
04-Oct-2020 16:06:22 - Running job #1
------------------------------------------------------------------------
04-Oct-2020 16:06:22 - Running 'Realign: Estimate & Reslice'
```
4. Wait for job to complete and go to the `C:\spm-min-test` to check results.

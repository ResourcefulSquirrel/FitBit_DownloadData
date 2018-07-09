[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1308115.svg)](https://doi.org/10.5281/zenodo.1308115)


# FitBit_DownloadData

## Overview

The functions here were written to download data from FitBit servers using the FitBit API. I used [fitbitr](https://github.com/teramonagi/fitbitr) from [Nagi Teramo](https://github.com/teramonagi), and I have a "registered" FitBit App, which is necessary to get the `key` and `secret` for using Oauth2.0

## Usage

### FitBit_AuthCode

This is the part that is based on fitbitr.

Right now, you will need to enter your own FitBit OAuth `Key` and `Secret` into the FitBit_AuthCode.R file.  I hope to somehow make it more elegant so maybe it prompts you for your codes, but that seems like it might be more annoying, since every time you use this you would need to enter that information.

Additionally, this requires you be logged into the proper FitBit user account with your browser when you run the code. I couldn't figure out how to manage that kind of a login from R.

### getFitBitData

This uses the OAuth info generated from FitBit_AuthCode.R to grab a number of types of physical activity data from FitBit over a designated period of time. It then shoves all of that data into a .csv to export it. 

Currently this function asks for an ID and a device name, which is because the code is written for a research project which has multiple subjects and multiple devices. It is only used for constructing the .csv file name at the end of the function. Feel free to delete these for your use.


## Note

This is my first time attempting load a semi-complex thing to GitHub. Helpful feedback is appreciated.

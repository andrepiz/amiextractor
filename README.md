# amiextractor
A set of functions and utilities to extract and process images acquired by the AMIE camera of the SMART-1 mission.

The _decode_IMG_ function allows to extract labels, browse image and image from a binary IMG file retrieved from the AMIE database https://archives.esac.esa.int/psa/ftp/SMALL-MISSIONS-FOR-ADVANCED-RESEARCH-AND-TECHNOLOGY/AMIE 

![decode_img](https://github.com/andrepiz/amiextractor/assets/75851004/4cc745f4-2e37-4838-a289-a87a88fa8454)

The _extract_IMG_ function calls _decode_IMG_ and also retrieves ancillary data that may be useful to fit for instance the expected moon size and location against the image:

![check_geometry](https://github.com/andrepiz/amiextractor/assets/75851004/04457300-e41a-4b1c-8541-ba05a8a76421)

Finally, there is also the possibility to correct the images for bias and dark current, by extracting the master frames from the CALIB IMG directory [1]:
![mfbias](https://github.com/andrepiz/amiextractor/assets/75851004/e30b8ba9-348b-4c37-9574-2c437fcd1838)
![mfdc](https://github.com/andrepiz/amiextractor/assets/75851004/a5a8a818-484b-41c7-ab35-d3ff766e195d)

[1] The calibration of AMIE images, B Grieger · 2009

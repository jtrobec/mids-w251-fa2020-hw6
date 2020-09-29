MIDS 251 - Fall 2020 - HW6 - Justin Trobec
==========================================

This repository has my HW6 files.

The `.ipynb` file was run with 2 epochs and a learning rate of 1e-5 for 1M rows on AWS. It ended up with an AUC of 0.96891.

I also got the notebook running on my Xavier (AGX). The included `Dockerfile` creates an image that makes all the requirements to run the notebook available. I generate the image, then run it with the nvidia runtime, starting up bash. In order to get all the requirements, I needed to build sentencepiece, and also install rust. Once in the container, I start-up jupyter, and (because I use -network host) I can connect to jupyter from my PC.

I was not able to finish running the notebook. As of now, when I have to turn in the assignment, it has run for ~18 hrs. It is almost done with the evaluation set tho, so I think total time would be approximately 1 day. I expect this would be slower on an NX.

XeLaTeX files for creating ISO envelopes
########################################

:date: 2022-01-03
:tags: xelatex, envelopes
:author: Roland Smith

.. Last modified: 2022-01-03T23:20:23+0100
.. vim:spelllang=en

History
=======

Around 2001, I wrote a couple of PostScript files to enable me to print
envelopes suitable for posting in the Netherlands.

While these worked fine, they have limitations mainly in the font encoding.
Anything other than native PostScript or latinX encoding is a hassle.
However, it's 2022 now, and I just want to be able to use UTF-8 for addresses.

So I decided to “port” these scripts to XeLaTeX.


Introduction
============

This repository contains TeX files for creating C5, C6 and DL size envelopes
with XeLaTeX.
The return address is printed in the left-top as is usual in the Netherlands.
(This is allowed so you don't have to print every envelope on both sides.)

It also prints the KIX code which is used for automatic mail processing in the
Netherlands.

The sender address is situated about 5 mm from the edges of the envelope;
a lot of printers cannot print in that area anyway.

This works for me, and I like to keep things simple.
So feel free to fork this repo and adapt it to your needs rather than sending
a pull request.


Requirements
============

* XeLaTeX
* TikZ
* KIX barcode font installed where fontspec can find it.
* Printer that doesn't choke on envelopes.

It has been tested with TeXLive 2020.
The KIX barcode font can be found online.


Usage
=====

Download the repo.

Fill in the sender and recipient details in the lines shown below.
Then use XeLaTeX to generate a PDF, and print it.

.. code-block:: tex

    %% Fill in the sender details
    \newcommand{\sendername}{S. Ender}
    \newcommand{\senderaddress}{Nowhere street 42}
    \newcommand{\senderpostcode}{9999 ZZ}
    \newcommand{\sendertown}{NOWHERE}
    %% Fill in the recipient details.
    \newcommand{\recipientname}{R. Ecipient}
    \newcommand{\recipientaddress}{Somehere street 1a}
    \newcommand{\recipientpostcode}{9876 AA}
    \newcommand{\recipientkix}{9876AA1XA}
    \newcommand{\recipienttown}{SOMEWHERE}

The envelope PDF's are oriented such that you should put it in the printer
with the short side going into the printer.
You can change that by modifiying the “Rotate” special near the end of the
file.
Depending on the printer, the envelope should probably be centered in the
width of the input tray.

---
title: "Printing from the command line"
excerpt: Using `stdlinux` and `lpr` to print black and white papers from the university's free printing service.
permalink: /tutorials/printthis/
---

Printers have always been a pain for systems admins and users alike. However, there's a quick and easy setup for printing from the printers on campus using `stdlinux` and the command line.

## Using lpr

Unless you want to try `cat`ting a file to a printer device and hoping for the best, I would recommend using `lpr` to help print any documents that need printing. `lpr` is installed by default on `stdlinux`, and works at very least with the printers in Caldwell 112. It can be as simple as `lpr <document>`, but there are a couple specifics that you might need to use.

### Printers

The printers in Caldwell 112 are named:

* `lj_cl_112_a`
* `lj_cl_112_b`
* `lj_cl_112_c`

The first one being the one closest to the office in the corner near the Java helpdesk.

The flag that is used to pass a printer name as an argument is `-P`. Altogether, the command to print `doc.pdf` from the first printer would be:

```
$ lpr -P lj_cl_112_a doc.pdf
```

### Single Sided

By default, the printers print documents double-sided. In the event that there is a need to have a document single-sided only, there is a way to do that, although it's more convoluted than specifying a printer. The invocation is `-o sides=one-sided`.

### Alias

If it seems like it would be a good idea to alias this in order to have an easier way to call this on a paper, it is advisable to specify the printer that would be used the most, and aliasing that in `~/.bashrc`.

```
alias printthis="lpr -P lj_cl_112_a"
```

And calling it is now as simple as `$ printthis <document>`.

## The document did not print

If there is a problem with the printing, check the following:

1. The command line did not show any errors
    * If it did, google is your friend
2. The printer does not show that the paper is out
    * Else, the people at the java table can refill it
3. The document name does not contain any illegal characters
    * If there are any such as `+`, `\\`, `(`, etc. try renaming the file

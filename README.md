Developer Environment
=====================

The goal of this repository is to assemble scripts that will help you to configure your environment.

Each tool that need to be configured have it's own script, so you can easily configure just some tools.

**Important:** It's highly recommended that you read the Shell Scripts before runing it!

GIT
---------------------

To configure git on your environment use the following command:

```ssh
curl -sSL https://bit.ly/gitdevel | bash
```


RELEASE NOTES
---------------------

* *2016-10-05*
  * Splited main file into utils file to be used on other scripts (core).
  * Added i18n support to the core of the scripts.
  * fixed GIT script to use the gpg program istead of gpg2.

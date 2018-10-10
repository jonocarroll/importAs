Tests and Coverage
================
10 October, 2018 21:01:06

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                        | Coverage (%) |
| :---------------------------- | :----------: |
| importAs                      |    37.78     |
| [R/rstudio.R](../R/rstudio.R) |     0.00     |
| [R/utils.R](../R/utils.R)     |     0.00     |
| [R/zzz.R](../R/zzz.R)         |     0.00     |
| [R/import.R](../R/import.R)   |    62.96     |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                            | n |  time | error | failed | skipped | warning |
| :---------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-debug.R](testthat/test-debug.R)           | 2 | 0.039 |     0 |      0 |       0 |       0 |
| [test-functional.R](testthat/test-functional.R) | 7 | 0.011 |     0 |      0 |       0 |       0 |
| [test-infix.R](testthat/test-infix.R)           | 7 | 0.011 |     0 |      0 |       0 |       0 |
| [test-package.R](testthat/test-package.R)       | 3 | 0.004 |     0 |      0 |       0 |       0 |
| [test-shared.R](testthat/test-shared.R)         | 4 | 0.006 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                | context               | test                                       | status | n |  time |
| :-------------------------------------------------- | :-------------------- | :----------------------------------------- | :----- | -: | ----: |
| [test-debug.R](testthat/test-debug.R#L8)            | debug                 | messaging                                  | PASS   | 2 | 0.039 |
| [test-functional.R](testthat/test-functional.R#L6)  | functional form usage | import – functional                        | PASS   | 1 | 0.002 |
| [test-functional.R](testthat/test-functional.R#L10) | functional form usage | structural components – functional         | PASS   | 3 | 0.003 |
| [test-functional.R](testthat/test-functional.R#L16) | functional form usage | messaging – functional                     | PASS   | 1 | 0.001 |
| [test-functional.R](testthat/test-functional.R#L21) | functional form usage | retrieval – functional                     | PASS   | 2 | 0.005 |
| [test-infix.R](testthat/test-infix.R#L6)            | infix form usage      | import – infix                             | PASS   | 1 | 0.002 |
| [test-infix.R](testthat/test-infix.R#L10)           | infix form usage      | structural components – infix              | PASS   | 3 | 0.004 |
| [test-infix.R](testthat/test-infix.R#L16)           | infix form usage      | messaging – infix                          | PASS   | 1 | 0.001 |
| [test-infix.R](testthat/test-infix.R#L21)           | infix form usage      | retrieval – infix                          | PASS   | 2 | 0.004 |
| [test-package.R](testthat/test-package.R#L4)        | package               | package option is set on package load      | PASS   | 1 | 0.001 |
| [test-package.R](testthat/test-package.R#L11)       | package               | resetting package option after unload      | PASS   | 1 | 0.001 |
| [test-package.R](testthat/test-package.R#L17)       | package               | option remains set after reloading package | PASS   | 1 | 0.002 |
| [test-shared.R](testthat/test-shared.R#L7)          | shared                | equivalence                                | PASS   | 2 | 0.003 |
| [test-shared.R](testthat/test-shared.R#L12)         | shared                | precedence                                 | PASS   | 2 | 0.003 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |
| :------- | :---------------------------- |
| Version  | R version 3.4.4 (2018-03-15)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Pop\!\_OS 18.04 LTS           |
| Language | en\_AU                        |
| Timezone | Australia/Adelaide            |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.0   |
| covr     | 3.2.0   |
| covrpage | 0.0.60  |

</details>

<!--- Final Status : pass --->

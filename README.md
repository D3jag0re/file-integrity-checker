# file-integrity-checker

This is based off the DevOps Roadmap Project [File Integrity Checker ](https://roadmap.sh/projects/file-integrity-checker)

Verify the integrity of application log files to detect tampering. 

This is number 19 of [DevOps Projects](https://roadmap.sh/devops/projects) as per roadmap.sh

## Description From Site 

You are required to develop a tool that verifies the integrity of log files to detect tampering. This tool can be used to enhance security measures by using techniques such as file integrity monitoring and hashing to ensure that no unauthorized changes have been made to the log files.

## Requirements

The tool should be capable of the following:

- [X] Accept a directory or a single log file as input.
- [X] Utilize a cryptographic hashing algorithm, such as SHA-256, to compute hashes for each log file provided.
- [X] On first use, store the computed hashes in a secure location.
- [X] For subsequent uses, compare the newly computed hashes against the previously stored ones.
- [X] Clearly report any discrepancies found as a result of the hash comparison, indicating possible file tampering.
- [] Allow for manual re-initialization of log file integrity.

Here is the example of how it might look like:

```
> ./integrity-check init /var/log  # Initializes and stores hashes of all log files in the directory
> Hashes stored successfully.

> ./integrity-check check /var/log/syslog
> Status: Modified (Hash mismatch)
# Optionally report the files where hashes mismatched

> ./integrity-check -check /var/log/auth.log
> Status: Unmodified

> ./integrity-check update /var/log/syslog
> Hash updated successfully.

```

After completing this project you will get the idea of hashing algorithms, security and writing scripts.

## prerequisites

- Have some sort of Linux machine running (VM, WSL, etc.)

## To Run  

- Run Script with optins

## Notes 

- There is both a `bash` and `python` version of this as my own personal stretch goal. 
- for `bash` made use of `sha256sum` . Hoping this doesn't void the requirements. Still required lots of modification and usage inside the tool. 
- if `checksum` file is included in the directory, it will report `FAILED`

## Lessons Learned

- Lessons
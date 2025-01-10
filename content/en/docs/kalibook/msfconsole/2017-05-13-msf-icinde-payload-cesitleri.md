---
draft: false
title: Payload Types in Metasploit Framework
date: 2017-05-13T12:37:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
description: Payload refers to a type of exploit module. There are 3 different groups of payload modules in the Metasploit Framework.
weight: 70
translationKey:: msf-payload-types
url: /msf-payload-types/
featured_image: /images/metasploit.jpg
categories:
    - Metasploit Framework
tags:
    - cybersecurity
    - metasploit framework
linkTitle: Payload Types
keywords:
    - msf
    - payload
---

## What are Payload Groups?

Payload refers to a type of exploit module. There are 3 different groups of payload modules in the Metasploit Framework. We will look at these modules, which we can separate as Singles, Stagers and Stages.

## Single payloads (Singles)

These types of payload modules contain all the codes and operations they need. They do not need any helper to work. For example, a payload that adds a user to the target system does its operation and stops. It does not need another command line, etc.

When they are a stand-alone program, they can be noticed and caught by programs such as netcat.

Let's pay attention to the naming "windows/shell_bind_tcp". For Windows, shell_bind_tcp works as a single payload. We will see a different naming in the next section.

## Stagers

Stager payload modules are codes that establish a network connection between the target computer and the local computer. They usually contain small codes. They need a stage to work. Metasploit Framework will use the most suitable payload module, if it is not successful, the payload that promises less success will be automatically selected.

Let's pay attention to the naming `windows/shell/bind_tcp`. Here `bind_tcp` is the stager and needs a stage. In this naming, `shell` between `windows` and `bind_tcp` refers to the stage.

## Stages

The payload module types that we refer to as stages are used by stagers. Since they act as intermediaries, they are written in the middle part of the `windows/shell/bind_tcp` name. They do not have any size restrictions. Meterpreter, VNC Injection and iPhone 'ipwn' Shell can be given as examples.

## What are the Payload Types?

In the first section of the article, we divided the Payloads into 3 groups. Now let's examine the payloads according to their types.

## Inline (Non Staged)

Such payloads work more stably because they contain the stage (shell) they need within themselves. When their size is a bit large, it is easier for the other party to notice. Some Exploits may not be able to use these payloads due to their limitations.

## Staged

When stagers want to run information they receive from the other party on the other party, they use the stage provided to them. These types of payloads are called Staged.

## Meterpreter

Meterpreter is a command line program with its name consisting of the combination of Meta-Interpreter expressions. It works via DLL injection and directly in RAM memory. It does not leave any residue on the hard disk. It is very useful to run or cancel code via Meterpreter.

## PassiveX

PassiveX payload types are used to bypass firewalls. They create a hidden Internet Explorer process using ActiveX. These types of payload types use HTTP requests and responses to communicate with the target computer.

## NoNX

Restricted areas called NX (No eXecute) bits are used to prohibit the processor from intervening in certain memory areas. If a program wants to intervene in the restricted area of ​​RAM memory, this request is not fulfilled by the processor and this behavior is prevented by the DEP (Data Execution Prevention) system. NoNX payload types are used to overcome this restriction.

## Ord

Ordinal payload modules run within Windows and are simple enough to work in almost all Windows versions. Although they can work in almost all versions, there is a prerequisite for these types of payloads to work. ws2_32.dll must be pre-loaded on the system. They are also not very stable.

## IPv6

These types of payload modules are designed to be used for IPv6 network communication.

## Reflective DLL injection

These types of payload modules are placed in the target system's memory. They do not touch the hard disk and help to run payload types such as VNC, Meterpreter.

## Video Explanation

{{<youtube "ocULVGGYTOs">}}
